package com.FPBG.persistence;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.FPBG.domain.dto.Criteria;
import com.FPBG.domain.vo.BoardVO;
import com.FPBG.domain.vo.SearchCriteria;

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

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		
		 return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne(namespace + ".listSearchCount", cri);
	}
	
	@Override
	public void ViewCount(int boardNumber)throws Exception {
		session.update(namespace+".ViewCount", boardNumber);
	}
	
	@Override
	public void Good(int boardNumber)throws Exception {
		session.update(namespace+".Good", boardNumber);
	}
	@Override
	public void beGood(int boardNumber)throws Exception {
		session.update(namespace+".beGood", boardNumber);
	}
	
}
