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

import com.FPBG.domain.vo.HateVO;
import com.FPBG.domain.vo.LikeVO;
import com.FPBG.domain.vo.MemberVO;
import com.FPBG.service.HateService;
import com.FPBG.service.LikeService;

@Controller
@RequestMapping("/good/*")
public class LikeHateController {
	
	@Inject
	LikeService likeservice;
	
	@Inject
	HateService hateservice;
	
	/*좋아요 기능*/
	@RequestMapping(value = "/like", method = RequestMethod.POST)
	public ResponseEntity<String> likeRegister(@RequestBody LikeVO vo, HttpServletRequest request){
		ResponseEntity<String> entity = null;
		
		
		try {
			HttpSession session = request.getSession();
			MemberVO member = (MemberVO)session.getAttribute("vo");
			vo.setMemNumber(member.getMemNumber());
			likeservice.like(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/*싫어요 기능*/
	@RequestMapping(value = "/hate", method = RequestMethod.POST)
	public ResponseEntity<String> hateRegister(@RequestBody HateVO vo, HttpServletRequest request){
		ResponseEntity<String> entity = null;
		
		
		try {
			HttpSession session = request.getSession();
			MemberVO member = (MemberVO)session.getAttribute("vo");
			vo.setMemNumber(member.getMemNumber());
			hateservice.hate(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/likeCheck/{boardNumber}", method = RequestMethod.GET)
	public ResponseEntity<Integer> likeCheck(@PathVariable("boardNumber")Integer boardNumber, HttpServletRequest request){
		ResponseEntity<Integer> entity = null;
		
		LikeVO vo = new LikeVO();
		
		try {
			HttpSession session = request.getSession();
			MemberVO member = (MemberVO)session.getAttribute("vo");
			vo.setMemNumber(member.getMemNumber());
			vo.setBoardNumber(boardNumber);
			entity = new ResponseEntity<Integer>(likeservice.likeSelect(vo), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(0, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/hateCheck/{boardNumber}", method = RequestMethod.GET)
	public ResponseEntity<Integer> hateCheck(@PathVariable("boardNumber")Integer boardNumber, HttpServletRequest request){
		ResponseEntity<Integer> entity = null;
		
		HateVO vo = new HateVO();
		
		try {
			HttpSession session = request.getSession();
			MemberVO member = (MemberVO)session.getAttribute("vo");
			vo.setMemNumber(member.getMemNumber());
			vo.setBoardNumber(boardNumber);
			entity = new ResponseEntity<Integer>(hateservice.hateSelect(vo), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(0, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/unlike", method = RequestMethod.DELETE)
	public ResponseEntity<String> unlikek(@RequestBody LikeVO vo, HttpServletRequest request){
		ResponseEntity<String> entity = null;
		
		
		try {
			HttpSession session = request.getSession();
			MemberVO member = (MemberVO)session.getAttribute("vo");
			vo.setMemNumber(member.getMemNumber());
			likeservice.unlike(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/unhate", method = RequestMethod.DELETE)
	public ResponseEntity<String> unhate(@RequestBody HateVO vo, HttpServletRequest request){
		ResponseEntity<String> entity = null;
		
		
		try {
			HttpSession session = request.getSession();
			MemberVO member = (MemberVO)session.getAttribute("vo");
			vo.setMemNumber(member.getMemNumber());
			hateservice.unhate(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	

}
