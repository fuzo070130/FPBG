package com.FPBG.util;

import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import com.FPBG.domain.dto.RankMemberDTO;

public class MakeTOP100 {
	
	public ArrayList<RankMemberDTO> makeTop100(String mode,String server)throws Exception{
		Document doc = Jsoup.connect("https://bglog.me/rank/?region="+server+"&match="+mode+"").get();
		
		ArrayList<RankMemberDTO> dtos = new ArrayList<>();
		
		RankMemberDTO dto = new RankMemberDTO();
		
		for(int i = 1; i <= 100; i++){
			dto = new RankMemberDTO();
			dto.setRank(Integer.parseInt(doc.select("#rank > tbody > tr:nth-child("+ i +") > td:nth-child(1)").text()));
			dto.setMemNickName(doc.select("#rank > tbody > tr:nth-child("+ i +") > td:nth-child(2)").text());
			dto.setRating(Float.parseFloat(doc.select("#rank > tbody > tr:nth-child("+ i +") > td:nth-child(3)").text()));
			dto.setMatch(Integer.parseInt(doc.select("#rank > tbody > tr:nth-child("+ i +") > td:nth-child(4)").text()));
			dtos.add(i-1,dto);
		}
		
		return dtos;
		
	}

}
