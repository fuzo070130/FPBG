package com.FPBG.persistence;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.FPBG.domain.vo.BoardVO;
import com.FPBG.domain.vo.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Resource(name = "sqlSession")
	private SqlSession session;

	private static String namespace = "com.FPBG.mapper.BoardMapper";

	@Override
	public void create(BoardVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public BoardVO read(Integer boardNumber) throws Exception {
		return session.selectOne(namespace + ".read", boardNumber);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer boardNumber) throws Exception {
		session.delete(namespace + ".delete", boardNumber);
	}

	@Override
	public List<BoardVO> listPage(int page) throws Exception {

		if (page <= 0) {
			page = 1;
		}

		page = (page - 1) * 10;

		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {

		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {

		return session.selectOne(namespace + ".countPaging", cri);
	}
}
