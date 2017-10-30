package com.FPBG.domain.vo;

import java.util.Date;

public class BoardVO {
	
	private int boardNumber;
	private String boardTitle;
	private String boardContent;
	private String boardPassword;
	private int boardViewCount;
	private int boardLikeCount;
	private int boardHateCount;
	private Date boardDate;
	private Date boardUpdateDate;
	private int boardGood;
	private String memNickName;
	private String memNumber;
	public int getBoardNumber() {
		return boardNumber;
	}
	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardPassword() {
		return boardPassword;
	}
	public void setBoardPassword(String boardPassword) {
		this.boardPassword = boardPassword;
	}
	public int getBoardViewCount() {
		return boardViewCount;
	}
	public void setBoardViewCount(int boardViewCount) {
		this.boardViewCount = boardViewCount;
	}
	public int getBoardLikeCount() {
		return boardLikeCount;
	}
	public void setBoardLikeCount(int boardLikeCount) {
		this.boardLikeCount = boardLikeCount;
	}
	public int getBoardHateCount() {
		return boardHateCount;
	}
	public void setBoardHateCount(int boardHateCount) {
		this.boardHateCount = boardHateCount;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public Date getBoardUpdateDate() {
		return boardUpdateDate;
	}
	public void setBoardUpdateDate(Date boardUpdateDate) {
		this.boardUpdateDate = boardUpdateDate;
	}
	public int getBoardGood() {
		return boardGood;
	}
	public void setBoardGood(int boardGood) {
		this.boardGood = boardGood;
	}
	public String getMemNickName() {
		return memNickName;
	}
	public void setMemNickName(String memNickName) {
		this.memNickName = memNickName;
	}
	public String getMemNumber() {
		return memNumber;
	}
	public void setMemNumber(String memNumber) {
		this.memNumber = memNumber;
	}
	
}
