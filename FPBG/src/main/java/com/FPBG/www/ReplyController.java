package com.FPBG.www;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.FPBG.domain.vo.MemberVO;
import com.FPBG.domain.vo.ReplyVO;
import com.FPBG.service.ReplyService;

@Controller
@RequestMapping("/Reply/*")
public class ReplyController {
	
	@Inject
	ReplyService service;
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO vo, HttpServletRequest request){
		ResponseEntity<String> entity = null;
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("vo");
		vo.setMemNickName(member.getMemNickName());
		
		try {
			service.create(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/{cReplyNumber}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("ReplyNumber") Integer ReplyNumber, @RequestBody ReplyVO vo){
		ResponseEntity<String> entity = null;
		try {
			vo.setReplyNumber(ReplyNumber);
			service.update(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{cReplyNumber}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("ReplyNumber") Integer ReplyNumber){
		ResponseEntity<String> entity = null;
		try {
			service.delete(ReplyNumber);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
