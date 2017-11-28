package com.FPBG.service;

import java.util.List;

import com.FPBG.domain.dto.Criteria;
import com.FPBG.domain.vo.ReplyVO;

public interface ReplyService {
	
	public void create(ReplyVO vo)throws Exception;
	
	public void update(ReplyVO vo)throws Exception;
	
	public void delete(Integer replyNumber)throws Exception;
	
	public List<ReplyVO> list(Integer boardNumber)throws Exception;
	
	public List<ReplyVO> listPage(Integer boardNumber , Criteria cri)throws Exception;
	
	public int count(Integer boardNumber)throws Exception;

}
