package com.FPBG.www;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.FPBG.domain.dto.Criteria;
import com.FPBG.domain.dto.PageMaker;
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
		vo.setMemNumber(member.getMemNumber());
		
		try {
			service.create(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/{ReplyNumber}", method = {RequestMethod.PUT, RequestMethod.PATCH})
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

	@RequestMapping(value = "/{ReplyNumber}", method = RequestMethod.DELETE)
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
	
	@RequestMapping(value = "/all/{boradNumber}" , method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("boradNumber") Integer boardNumber) {
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.list(boardNumber) , HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{boradNumber}/{page}" , method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("boradNumber") Integer boardNumber,@PathVariable("page") Integer page) {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String,Object> map = new HashMap<String,Object>();
			List<ReplyVO> list = service.listPage(boardNumber, cri);
			
			map.put("list", list);
			
			int replyCount = service.count(boardNumber);
			pageMaker.setTotalCount(replyCount);
			
			entity = new ResponseEntity<Map<String, Object>>(map , HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

}
