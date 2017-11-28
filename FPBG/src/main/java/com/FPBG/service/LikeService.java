package com.FPBG.service;

import com.FPBG.domain.vo.LikeVO;

public interface LikeService {
	
	public int likeCount(int boardNumber)throws Exception;
	
	public int likeSelect(LikeVO vo)throws Exception;
	
	public void like(LikeVO vo)throws Exception;

	public void unlike(LikeVO vo)throws Exception;
	
}
