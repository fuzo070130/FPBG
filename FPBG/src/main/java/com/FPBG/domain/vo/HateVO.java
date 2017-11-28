package com.FPBG.domain.vo;

import java.util.Date;

public class HateVO {
	
	private int hateNumber;
	private int memNumber;
	private Date hateDate;
	private int boardNumber;
	public int getHateNumber() {
		return hateNumber;
	}
	public void setHateNumber(int hateNumber) {
		this.hateNumber = hateNumber;
	}
	public int getMemNumber() {
		return memNumber;
	}
	public void setMemNumber(int memNumber) {
		this.memNumber = memNumber;
	}
	public Date getHateDate() {
		return hateDate;
	}
	public void setHateDate(Date hateDate) {
		this.hateDate = hateDate;
	}
	public int getBoardNumber() {
		return boardNumber;
	}
	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}
	
}
