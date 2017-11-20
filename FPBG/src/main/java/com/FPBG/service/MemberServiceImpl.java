package com.FPBG.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.FPBG.domain.vo.MemberVO;
import com.FPBG.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberDAO dao;

	@Override
	public void insert(MemberVO vo) throws Exception {
		dao.insert(vo);
	}

	@Override
	public void update(MemberVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void delete(MemberVO vo) throws Exception {
		dao.delete(vo);
	}
	
	@Override
	public boolean registerCheck(MemberVO vo)throws Exception {
		return dao.registerCheck(vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}

	@Override
	public MemberVO select(MemberVO vo) throws Exception {
		return dao.select(vo);
	}

}