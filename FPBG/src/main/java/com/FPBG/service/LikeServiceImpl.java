package com.FPBG.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.FPBG.domain.vo.LikeVO;
import com.FPBG.persistence.LikeDAO;

@Service
public class LikeServiceImpl implements LikeService{
	
	@Inject
	LikeDAO dao;

	@Override
	public int likeCount(int boardNumber) throws Exception {
		return dao.likeCount(boardNumber);
	}

	@Override
	public int likeSelect(LikeVO vo) throws Exception {
		return dao.likeSelect(vo);
	}

	@Transactional
	@Override
	public void like(LikeVO vo) throws Exception {
		dao.like(vo);
		dao.likeCountUp(vo.getBoardNumber());
	}
	
	@Transactional
	@Override
	public void unlike(LikeVO vo) throws Exception {
		dao.unlike(vo);
		dao.likeCountDown(vo.getBoardNumber());
	}

}
