package com.FPBG.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.FPBG.domain.vo.BoardVO;
import com.FPBG.domain.vo.Criteria;
import com.FPBG.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO dao;

	@Override
	public void create(BoardVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public BoardVO read(Integer boardNumber) throws Exception {
		return dao.read(boardNumber);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void delete(Integer boardNumber) throws Exception {
		dao.delete(boardNumber);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {

		return dao.listCriteria(cri);
	}
	
	@Override
	  public int listCountCriteria(Criteria cri) throws Exception {

	    return dao.countPaging(cri);
	  }


}
