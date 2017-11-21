package com.FPBG.domain.vo;

import java.util.Date;

public class AdminBoardVO {

	private int adminboardNumber;
	private String adminboardTitle;
	private String adminboardContent;
	private String adminboardPassword;
	private int adminboardViewCount;
	private int adminboardLikeCount;
	private int adminboardHateCount;
	private Date adminboardDate;
	private Date adminboardUpdateDate;
	private int adminboardGood;
	private String memNickName;
	private String memNumber;
	
	public int getAdminboardNumber() {
		return adminboardNumber;
	}
	public void setAdminboardNumber(int adminboardNumber) {
		this.adminboardNumber = adminboardNumber;
	}
	public String getAdminboardTitle() {
		return adminboardTitle;
	}
	public void setAdminboardTitle(String adminboardTitle) {
		this.adminboardTitle = adminboardTitle;
	}
	public String getAdminboardContent() {
		return adminboardContent;
	}
	public void setAdminboardContent(String adminboardContent) {
		this.adminboardContent = adminboardContent;
	}
	public String getAdminboardPassword() {
		return adminboardPassword;
	}
	public void setAdminboardPassword(String adminboardPassword) {
		this.adminboardPassword = adminboardPassword;
	}
	public int getAdminboardViewCount() {
		return adminboardViewCount;
	}
	public void setAdminboardViewCount(int adminboardViewCount) {
		this.adminboardViewCount = adminboardViewCount;
	}
	public int getAdminboardLikeCount() {
		return adminboardLikeCount;
	}
	public void setAdminboardLikeCount(int adminboardLikeCount) {
		this.adminboardLikeCount = adminboardLikeCount;
	}
	public int getAdminboardHateCount() {
		return adminboardHateCount;
	}
	public void setAdminboardHateCount(int adminboardHateCount) {
		this.adminboardHateCount = adminboardHateCount;
	}
	public Date getAdminboardDate() {
		return adminboardDate;
	}
	public void setAdminboardDate(Date adminboardDate) {
		this.adminboardDate = adminboardDate;
	}
	public Date getAdminboardUpdateDate() {
		return adminboardUpdateDate;
	}
	public void setAdminboardUpdateDate(Date adminboardUpdateDate) {
		this.adminboardUpdateDate = adminboardUpdateDate;
	}
	public int getAdminboardGood() {
		return adminboardGood;
	}
	public void setAdminboardGood(int adminboardGood) {
		this.adminboardGood = adminboardGood;
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
