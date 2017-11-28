package com.FPBG.util;

import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import com.FPBG.domain.dto.RankMemberDTO;

public class MakeTOP10 {
	
	public ArrayList<RankMemberDTO> MakeSolo()throws Exception {
		
		Document docSolo = Jsoup.connect("https://bglog.me/rank/").get();
		
		ArrayList<RankMemberDTO> dtosSolo = new ArrayList<>();
		
		RankMemberDTO dtoSolo = new RankMemberDTO();
		
		for(int i = 1; i <= 10; i++){
			dtoSolo = new RankMemberDTO();
			dtoSolo.setRank(Integer.parseInt(docSolo.select("#rank > tbody > tr:nth-child("+ i +") > td:nth-child(1)").text()));
			dtoSolo.setMemNickName(docSolo.select("#rank > tbody > tr:nth-child("+ i +") > td:nth-child(2)").text());
			dtoSolo.setRating(Float.parseFloat(docSolo.select("#rank > tbody > tr:nth-child("+ i +") > td:nth-child(3)").text()));
			dtoSolo.setMatch(Integer.parseInt(docSolo.select("#rank > tbody > tr:nth-child("+ i +") > td:nth-child(4)").text()));
			dtosSolo.add(i-1,dtoSolo);
		}
		
		return dtosSolo;
		
	}
	public ArrayList<RankMemberDTO> MakeDuo()throws Exception {
		Document docDuo = Jsoup.connect("https://bglog.me/rank/?region=&match=duo").get();
		
		ArrayList<RankMemberDTO> dtosDuo = new ArrayList<>();
		
		RankMemberDTO dtoDuo = new RankMemberDTO();
		
		for(int i = 1; i <= 10; i++){
			dtoDuo = new RankMemberDTO();
			dtoDuo.setRank(Integer.parseInt(docDuo.select("#rank > tbody > tr:nth-child("+ i +") > td:nth-child(1)").text()));
			dtoDuo.setMemNickName(docDuo.select("#rank > tbody > tr:nth-child("+ i +") > td:nth-child(2)").text());
			dtoDuo.setRating(Float.parseFloat(docDuo.select("#rank > tbody > tr:nth-child("+ i +") > td:nth-child(3)").text()));
			dtoDuo.setMatch(Integer.parseInt(docDuo.select("#rank > tbody > tr:nth-child("+ i +") > td:nth-child(4)").text()));
			dtosDuo.add(i-1,dtoDuo);
		}
		
		return dtosDuo;
	
	}
	public ArrayList<RankMemberDTO> MakeSquad()throws Exception {
		Document docSquad = Jsoup.connect("https://bglog.me/rank/?region=&match=squad").get();
		
		ArrayList<RankMemberDTO> dtosSquad = new ArrayList<>();
		
		RankMemberDTO dtoSquad = new RankMemberDTO();
		
		for(int i = 1; i <= 10; i++){
			dtoSquad = new RankMemberDTO();
			dtoSquad.setRank(Integer.parseInt(docSquad.select("#rank > tbody > tr:nth-child("+ i +") > td:nth-child(1)").text()));
			dtoSquad.setMemNickName(docSquad.select("#rank > tbody > tr:nth-child("+ i +") > td:nth-child(2)").text());
			dtoSquad.setRating(Float.parseFloat(docSquad.select("#rank > tbody > tr:nth-child("+ i +") > td:nth-child(3)").text()));
			dtoSquad.setMatch(Integer.parseInt(docSquad.select("#rank > tbody > tr:nth-child("+ i +") > td:nth-child(4)").text()));
			dtosSquad.add(i-1,dtoSquad);
		}
		
		return dtosSquad;
		
	}
	
}
