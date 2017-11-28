package com.FPBG.persistence;

import com.FPBG.domain.vo.HateVO;

public interface HateDAO {
	
	public int hateCount(int boardNumber)throws Exception;
	
	public int hateSelect(HateVO vo)throws Exception;
	
	public void hate(HateVO vo)throws Exception;

	public void unhate(HateVO vo)throws Exception;
	
	public void hateCountUp(int boardNumber)throws Exception;
	
	public void hateCountDown(int boardNumber)throws Exception;

}
