package com.FPBG.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.FPBG.domain.dto.Criteria;
import com.FPBG.domain.vo.BoardVO;
import com.FPBG.domain.vo.SearchCriteria;
import com.FPBG.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO dao;

	@Override
	public void create(BoardVO vo) throws Exception {
		dao.create(vo);
	}
	
	@Transactional
	@Override
	public BoardVO read(Integer boardNumber) throws Exception {
		dao.ViewCount(boardNumber);
		BoardVO vo = dao.read(boardNumber);
		//좋아요가 15이상이면 화제글 업데이트
		if(vo.getBoardLikeCount() >= 15){
			dao.Good(boardNumber);
		} else if (vo.getBoardLikeCount() < 15){ // 15이하면 화제글 X업데이트 
			dao.beGood(boardNumber);
		}
		vo = dao.read(boardNumber);
		return vo;
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

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		
		 return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return dao.listSearchCount(cri);
	}


}
