package com.FPBG.persistence;

import com.FPBG.domain.vo.LikeVO;

public interface LikeDAO {
	
	public int likeCount(int boardNumber)throws Exception;
	
	public int likeSelect(LikeVO vo)throws Exception;
	
	public void like(LikeVO vo)throws Exception;

	public void unlike(LikeVO vo)throws Exception;
	
	public void likeCountUp(int boardNumber)throws Exception;
	
	public void likeCountDown(int boardNumber)throws Exception;
	
}
