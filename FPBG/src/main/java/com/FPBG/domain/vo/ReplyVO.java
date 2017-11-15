package com.FPBG.domain.vo;

import java.util.Date;

public class ReplyVO {

	private int replyNumber;
	private int boardNumber;
	private String replyContent;
	private Date replyDate;
	private String memNickName;
	private int memNumber;
	public int getReplyNumber() {
		return replyNumber;
	}
	public void setReplyNumber(int replyNumber) {
		this.replyNumber = replyNumber;
	}
	public int getBoardNumber() {
		return boardNumber;
	}
	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	public String getMemNickName() {
		return memNickName;
	}
	public void setMemNickName(String memNickName) {
		this.memNickName = memNickName;
	}
	public int getMemNumber() {
		return memNumber;
	}
	public void setMemNumber(int memNumber) {
		this.memNumber = memNumber;
	}
	
}
