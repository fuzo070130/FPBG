package com.FPBG.persistence;

import java.util.List;

import com.FPBG.domain.dto.Criteria;
import com.FPBG.domain.vo.BoardVO;
import com.FPBG.domain.vo.SearchCriteria;

public interface BoardDAO {
	
	public void create(BoardVO vo)throws Exception;
	
	public BoardVO read(Integer boardNumber)throws Exception;
	
	public void update(BoardVO vo)throws Exception;
	
	public void delete(Integer boardNumber)throws Exception;
	
	public List<BoardVO> listPage(int page) throws Exception;
	
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	
	public int countPaging(Criteria cri) throws Exception;
	
	public List<BoardVO> listSearch(SearchCriteria cri)throws Exception;
	  
	public int listSearchCount(SearchCriteria cri)throws Exception;

	public void ViewCount(int boardNumber) throws Exception;

	public void Good(int boardNumber) throws Exception;

	public void beGood(int boardNumber) throws Exception;
}
