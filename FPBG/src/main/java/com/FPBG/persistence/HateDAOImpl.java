package com.FPBG.persistence;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.FPBG.domain.vo.HateVO;

@Repository
public class HateDAOImpl implements HateDAO{
	
	@Resource(name = "sqlSession")
	private SqlSession session;
	
	private static String namespace = "com.FPBG.mapper.HateMapper";

	@Override
	public int hateCount(int boardNumber) throws Exception {
		return session.selectOne(namespace+".hateCount", boardNumber);
	}

	@Override
	public int hateSelect(HateVO vo) throws Exception {
		return session.selectOne(namespace+".hateSelect", vo);
	}

	@Override
	public void hate(HateVO vo) throws Exception {
		session.insert(namespace+".hate", vo);
	}

	@Override
	public void unhate(HateVO vo) throws Exception {
		session.delete(namespace+".unhate", vo);
	}

	@Override
	public void hateCountUp(int boardNumber) throws Exception {
		session.update(namespace+".hateCountUp",boardNumber);
	}

	@Override
	public void hateCountDown(int boardNumber) throws Exception {
		session.update(namespace+".hateCountDown",boardNumber);
	}

}
