package com.FPBG.persistence;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.FPBG.domain.vo.LikeVO;

@Repository
public class LikeDAOImpl implements LikeDAO{
	
	@Resource(name = "sqlSession")
	private SqlSession session;
	
	private static String namespace = "com.FPBG.mapper.LikeMapper";

	@Override
	public int likeCount(int boardNumber) throws Exception {
		return session.selectOne(namespace+".likeCount", boardNumber);
	}

	@Override
	public int likeSelect(LikeVO vo) throws Exception {
		return session.selectOne(namespace+".likeSelect", vo);
	}

	@Override
	public void like(LikeVO vo) throws Exception {
		session.insert(namespace+".like", vo);
	}

	@Override
	public void unlike(LikeVO vo) throws Exception {
		session.delete(namespace+".unlike", vo);
	}

	@Override
	public void likeCountUp(int boardNumber) throws Exception {
		session.update(namespace+".likeCountUp", boardNumber);
	}

	@Override
	public void likeCountDown(int boardNumber) throws Exception {
		session.update(namespace+".likeCountDown", boardNumber);
	}

}
