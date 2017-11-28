package com.FPBG.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.FPBG.domain.dto.Criteria;
import com.FPBG.domain.vo.ReplyVO;
import com.FPBG.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	ReplyDAO dao;

	@Override
	public void create(ReplyVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void delete(Integer replyNumber) throws Exception {
		dao.delete(replyNumber);
	}

	@Override
	public List<ReplyVO> list(Integer boardNumber) throws Exception {
		return dao.list(boardNumber);
	}

	@Override
	public List<ReplyVO> listPage(Integer boardNumber, Criteria cri) throws Exception {
		return dao.listPage(boardNumber, cri);
	}

	@Override
	public int count(Integer boardNumber) throws Exception {
		return dao.count(boardNumber);
	}

}
