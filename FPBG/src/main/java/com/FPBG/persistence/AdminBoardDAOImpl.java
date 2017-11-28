package com.FPBG.persistence;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.FPBG.domain.dto.Criteria;
import com.FPBG.domain.vo.AdminBoardVO;
import com.FPBG.domain.vo.SearchCriteria;

@Repository
public class AdminBoardDAOImpl implements AdminBoardDAO {
	
	@Resource(name = "sqlSession")
	private SqlSession session;
	
	private static String namespace = "com.FPBG.mapper.AdminBoardMapper";

	@Override
	public void create(AdminBoardVO vo) throws Exception {
		
		session.insert(namespace + ".create", vo);
	}

	@Override
	public AdminBoardVO read(Integer adminboardNumber) throws Exception {
		
		return session.selectOne(namespace + ".read", adminboardNumber);
	}

	@Override
	public void update(AdminBoardVO vo) throws Exception {
		
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer adminboardNumber) throws Exception {
		
		session.delete(namespace + ".delete", adminboardNumber);
	}

	@Override
	public List<AdminBoardVO> listPage(int page) throws Exception {
		
		if (page <= 0) {
			page = 1;
		}

		page = (page - 1) * 10;

		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<AdminBoardVO> listCriteria(Criteria cri) throws Exception {
		
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		
		return session.selectOne(namespace + ".countPaging", cri);
	}

	@Override
	public List<AdminBoardVO> listSearch(SearchCriteria cri) throws Exception {
		
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne(namespace + ".listSearchCount", cri);
	}
	
	@Override
	public void ViewCount(int adminboardNumber)throws Exception {
		session.update(namespace+".ViewCount", adminboardNumber);
	}
}
