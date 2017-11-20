package com.FPBG.service;

import java.util.List;

import com.FPBG.domain.vo.BoardVO;
import com.FPBG.domain.vo.Criteria;

public interface BoardService {
	
	public void create(BoardVO vo)throws Exception;
	
	public BoardVO read(Integer boardNumber)throws Exception;
	
	public void update(BoardVO vo)throws Exception;
	
	public void delete(Integer boardNumber)throws Exception;
	
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri) throws Exception;
}
