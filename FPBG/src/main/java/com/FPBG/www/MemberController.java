package com.FPBG.www;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.FPBG.domain.vo.MemberVO;
import com.FPBG.service.MemberService;
import com.FPBG.util.CodeCreate;
import com.FPBG.util.PasswordSecurity;

@Controller
@RequestMapping("/Member/*")
public class MemberController {
	
	@Inject
	private MemberService service;
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(MemberVO vo)throws Exception {
		/* 암호화 */
		PasswordSecurity security = new PasswordSecurity();
		vo.setMemPassword(security.encryptSHA256(vo.getMemPassword()));
		service.insert(vo);
		return "home";
	}
	
	@ResponseBody
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	public ResponseEntity<String> memberMailCheck(MemberVO vo, HttpServletRequest request){

		ResponseEntity<String> entity = null;
		try {
			boolean check = service.registerCheck(vo);
			if(!check){
				
				String code = CodeCreate.getCodeCreate();
				HttpSession session = request.getSession();
				session.setAttribute("code", code);
				session.setMaxInactiveInterval(60*5);
				
				MailSendThred.MailSend("webmaster@place24.co.kr", vo.getMemEmail() , "제목입니다.", code);
				entity = new ResponseEntity<String>("succ", HttpStatus.OK);
			}else{
				entity = new ResponseEntity<String>("fail", HttpStatus.OK);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/codeCheck", method = RequestMethod.GET)
	public ResponseEntity<String> memberCodeCheck(String code, HttpServletRequest request){

		HttpSession session = request.getSession();
		String sessionCode = (String) session.getAttribute("code");
		if(sessionCode != null && code != null){
			if(sessionCode.equals(code)){
				session.invalidate();
				return new ResponseEntity<String>("succ", HttpStatus.OK);
			}
		}
		return new ResponseEntity<String>("fail", HttpStatus.OK);
	}
	
}
