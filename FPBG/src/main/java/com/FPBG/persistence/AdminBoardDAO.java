package com.FPBG.persistence;

import java.util.List;

import com.FPBG.domain.dto.Criteria;
import com.FPBG.domain.vo.AdminBoardVO;
import com.FPBG.domain.vo.SearchCriteria;

public interface AdminBoardDAO {

	public void create(AdminBoardVO vo)throws Exception;
	
	public AdminBoardVO read(Integer adminboardNumber)throws Exception;
	
	public void update(AdminBoardVO vo)throws Exception;
	
	public void delete(Integer adminboardNumber)throws Exception;
	
	public List<AdminBoardVO> listPage(int page) throws Exception;
	
	public List<AdminBoardVO> listCriteria(Criteria cri) throws Exception;
	
	public int countPaging(Criteria cri) throws Exception;
	
	public List<AdminBoardVO> listSearch(SearchCriteria cri)throws Exception;
	  
	public int listSearchCount(SearchCriteria cri)throws Exception;

	public void ViewCount(int adminboardNumber) throws Exception;
	
}
