package com.FPBG.persistence;

import com.FPBG.domain.vo.MemberVO;

public interface MemberDAO {
	
	public void insert(MemberVO	vo)throws Exception;
	
	public void update(MemberVO vo)throws Exception;

	public void delete(MemberVO vo)throws Exception;

	public boolean registerCheck(MemberVO vo) throws Exception;

	public MemberVO login(MemberVO vo)throws Exception;

	
	
}
