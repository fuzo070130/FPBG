package com.FPBG.persistence;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SampleDAOImpl implements SampleDAO{
	
	//@Inject
	@Resource(name = "sqlSession")
	private SqlSession session;
	
	private static String namespace = "com.FPBG.mapper.SampleMapper";

	@Override
	public int select() throws Exception {
		return session.selectOne(namespace+".select");
	}

}
