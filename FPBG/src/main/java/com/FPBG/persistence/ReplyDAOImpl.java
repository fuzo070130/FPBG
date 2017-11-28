package com.FPBG.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.FPBG.domain.dto.Criteria;
import com.FPBG.domain.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
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
	public List<ReplyVO> list(Integer boardNumber) throws Exception {
		return session.selectList(namespace + ".list" , boardNumber);
	}

	@Override
	public List<ReplyVO> listPage(Integer boardNumber, Criteria cri) throws Exception {
		Map<String , Object> param = new HashMap<>();
		
		param.put("boardNumber", boardNumber);
		param.put("cri", cri);
		
		return session.selectList(namespace+".listPage", param);
	}

	@Override
	public int count(Integer boardNumber) throws Exception {
		return session.selectOne(namespace+".count",boardNumber);
	}
	
}
