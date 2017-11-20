package com.FPBG.service;

import com.FPBG.domain.vo.MemberVO;

public interface MemberService {

	public void insert(MemberVO	vo)throws Exception;
	
	public void update(MemberVO vo)throws Exception;

	public void delete(MemberVO vo)throws Exception;

	boolean registerCheck(MemberVO vo) throws Exception;

	public MemberVO login(MemberVO vo) throws Exception;
	
	public MemberVO select(MemberVO vo) throws Exception;
	
}