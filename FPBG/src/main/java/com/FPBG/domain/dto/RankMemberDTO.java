package com.FPBG.domain.dto;

public class RankMemberDTO {
	
	private int rank;
	private String memNickName;
	private float rating;
	private int match;
	
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getMemNickName() {
		return memNickName;
	}
	public void setMemNickName(String memNickName) {
		this.memNickName = memNickName;
	}
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}
	public int getMatch() {
		return match;
	}
	public void setMatch(int match) {
		this.match = match;
	}

}
