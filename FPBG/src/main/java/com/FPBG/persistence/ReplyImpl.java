package com.FPBG.persistence;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.FPBG.domain.vo.ReplyVO;

@Repository
public class ReplyImpl implements ReplyDAO{
	
	@Resource(name = "sqlSession")
	private SqlSession session;
	
	private static String namespace = "com.FPBG.mapper.ReplyMapper";
	
	@Override
	public void create(ReplyVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer replyNumber) throws Exception {
		session.delete(namespace + ".delete", replyNumber);
	}

	@Override
	public List<ReplyVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}
	
}
