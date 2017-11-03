package com.FPBG.persistence;

import java.util.List;

import com.FPBG.domain.vo.BoardVO;

public interface BoardDAO {
	
	public void create(BoardVO vo)throws Exception;
	
	public BoardVO read(Integer boardNumber)throws Exception;
	
	public void update(BoardVO vo)throws Exception;
	
	public void delete(Integer boardNumber)throws Exception;
	
	public List<BoardVO> listAll()throws Exception;
	
}
