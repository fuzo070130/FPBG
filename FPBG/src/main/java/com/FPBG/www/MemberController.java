package com.FPBG.www;

import java.io.PipedWriter;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.FPBG.domain.vo.MemberVO;
import com.FPBG.service.MemberService;
import com.FPBG.util.CodeCreate;
import com.FPBG.util.MailSendThred;
import com.FPBG.util.PasswordSecurity;

@Controller
@RequestMapping("/Member/*")
public class MemberController {
	
	@Inject
	private MemberService service;
	
	@ResponseBody
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody MemberVO vo)throws Exception {
		ResponseEntity<String> entity = null;
		/* 암호화 */
		PasswordSecurity security = new PasswordSecurity();
		vo.setMemPassword(security.encryptSHA256(vo.getMemPassword()));
		
		try {
			service.insert(vo);
			entity = new ResponseEntity<String>("succ", HttpStatus.OK);
		}catch (Exception e){
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
			e.printStackTrace();
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo,HttpSession session, HttpServletRequest request,HttpServletResponse response, Model model)throws Exception {
		PasswordSecurity security = new PasswordSecurity();
		vo.setMemPassword(security.encryptSHA256(vo.getMemPassword()));
		
		String referer = request.getHeader("referer");
		if(referer == null || referer == ""){
			referer = "/";
		}
		MemberVO Mvo = service.login(vo);

		if(Mvo == null) {
			return "redirect:/";
		}
		session.setAttribute("vo", Mvo);
		model.addAttribute("vo", Mvo);
		
		return "redirect:" + referer;
	}
	
	@ResponseBody
	@RequestMapping(value = "/mailCheck", method = RequestMethod.POST)
	public ResponseEntity<String> memberMailCheck(@RequestBody MemberVO vo, HttpServletRequest request){

		ResponseEntity<String> entity = null;
		try {
			boolean check = service.registerCheck(vo);
			if(!check){
				
				String code = CodeCreate.getCodeCreate();
				HttpSession session = request.getSession();
				session.setAttribute("code", code);
				session.setMaxInactiveInterval(60*5);
				
				MailSendThred.MailSend("fuzo070130@naver.com", vo.getMemEmail() , "제목입니다.", code);
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
