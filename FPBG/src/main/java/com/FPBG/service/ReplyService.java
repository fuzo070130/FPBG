package com.FPBG.service;

import java.util.List;

import com.FPBG.domain.vo.ReplyVO;

public interface ReplyService {
	
public void create(ReplyVO vo)throws Exception;
	
	public void update(ReplyVO vo)throws Exception;
	
	public void delete(Integer replyNumber)throws Exception;
	
	public List<ReplyVO> listAll()throws Exception;

}
