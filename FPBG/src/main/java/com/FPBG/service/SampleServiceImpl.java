package com.FPBG.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.FPBG.persistence.SampleDAO;

@Service
public class SampleServiceImpl implements SampleService{
	
	@Inject
	SampleDAO dao;

	@Override
	public int select() throws Exception {
		return dao.select();
	}

}
