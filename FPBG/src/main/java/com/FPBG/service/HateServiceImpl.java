package com.FPBG.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.FPBG.domain.vo.HateVO;
import com.FPBG.persistence.HateDAO;

@Service
public class HateServiceImpl implements HateService{
	
	@Inject
	HateDAO dao;

	@Override
	public int hateCount(int boardNumber) throws Exception {
		return dao.hateCount(boardNumber);
	}

	@Override
	public int hateSelect(HateVO vo) throws Exception {
		return dao.hateSelect(vo);
	}

	@Transactional
	@Override
	public void hate(HateVO vo) throws Exception {
		dao.hate(vo);
		dao.hateCountUp(vo.getBoardNumber());
	}

	@Transactional
	@Override
	public void unhate(HateVO vo) throws Exception {
		dao.unhate(vo);
		dao.hateCountDown(vo.getBoardNumber());
	}

	@Override
	public void hateCountUp(int boardNumber) throws Exception {
		dao.hateCountUp(boardNumber);
	}

	@Override
	public void hateCountDown(int boardNumber) throws Exception {
		dao.hateCountDown(boardNumber);
	}

}
