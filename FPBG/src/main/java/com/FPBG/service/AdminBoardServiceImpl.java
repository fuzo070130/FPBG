package com.FPBG.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.FPBG.domain.vo.AdminBoardVO;
import com.FPBG.domain.vo.Criteria;
import com.FPBG.domain.vo.SearchCriteria;
import com.FPBG.persistence.AdminBoardDAO;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {
	
	@Inject
	AdminBoardDAO dao;
	
	@Override
	public void create(AdminBoardVO vo) throws Exception {

		dao.create(vo);
	}

	@Override
	public AdminBoardVO read(Integer adminboardNumber) throws Exception {

		return dao.read(adminboardNumber);
	}

	@Override
	public void update(AdminBoardVO vo) throws Exception {

		dao.update(vo);
	}

	@Override
	public void delete(Integer adminboardNumber) throws Exception {

		dao.delete(adminboardNumber);
	}

	@Override
	public List<AdminBoardVO> listCriteria(Criteria cri) throws Exception {

		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {

		return dao.countPaging(cri);
	}

	@Override
	public List<AdminBoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {

		 return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return dao.listSearchCount(cri);
	}
}
