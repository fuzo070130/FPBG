package com.FPBG.persistence;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.FPBG.domain.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Resource(name = "sqlSession")
	private SqlSession session;
	
	private static String namespace = "com.FPBG.mapper.MemberMapper";

	@Override
	public void insert(MemberVO vo) throws Exception {
		session.insert(namespace+".insert", vo);
	}

	@Override
	public void update(MemberVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}

	@Override
	public void delete(MemberVO vo) throws Exception {
		session.delete(namespace+".delete", vo);
	}
	
	@Override
	public boolean registerCheck(MemberVO vo) throws Exception {
		return session.selectOne(namespace+".registerCheck" , vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return session.selectOne(namespace+".login" , vo);
	}


}
