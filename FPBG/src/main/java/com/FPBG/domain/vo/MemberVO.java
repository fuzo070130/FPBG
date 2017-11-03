package com.FPBG.domain.vo;

import java.util.Date;

public class MemberVO {
	
	private int memNumber;
	private String memID;
	private String memNickName;
	private String memEmail;
	private int memEmailCheck;
	private String memSteam;
	private int memSteamCheck;
	private String memPassword;
	private String memDiscord;
	private Date memReg;
	public int getMemNumber() {
		return memNumber;
	}
	public void setMemNumber(int memNumber) {
		this.memNumber = memNumber;
	}
	public String getMemID() {
		return memID;
	}
	public void setMemID(String memID) {
		this.memID = memID;
	}
	public String getMemNickName() {
		return memNickName;
	}
	public void setMemNickName(String memNickName) {
		this.memNickName = memNickName;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public int getMemEmailCheck() {
		return memEmailCheck;
	}
	public void setMemEmailCheck(int memEmailCheck) {
		this.memEmailCheck = memEmailCheck;
	}
	public String getMemSteam() {
		return memSteam;
	}
	public void setMemSteam(String memSteam) {
		this.memSteam = memSteam;
	}
	public int getMemSteamCheck() {
		return memSteamCheck;
	}
	public void setMemSteamCheck(int memSteamCheck) {
		this.memSteamCheck = memSteamCheck;
	}
	public String getMemPassword() {
		return memPassword;
	}
	public void setMemPassword(String memPassword) {
		this.memPassword = memPassword;
	}
	public String getMemDiscord() {
		return memDiscord;
	}
	public void setMemDiscord(String memDiscord) {
		this.memDiscord = memDiscord;
	}
	public Date getMemReg() {
		return memReg;
	}
	public void setMemReg(Date memReg) {
		this.memReg = memReg;
	}

}
