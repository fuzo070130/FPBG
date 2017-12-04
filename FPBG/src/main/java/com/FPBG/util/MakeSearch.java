package com.FPBG.util;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import com.FPBG.domain.dto.SearchDTO;

public class MakeSearch {
	
	public SearchDTO Search(String search,String Region,String mode,String season)throws Exception {
		
		if(season == "pre1-2017" || season.equals("pre1-2017")) {
			season = "2017-pre1";
		}else if(season == "pre2-2017" || season.equals("pre2-2017")) {
			season = "2017-pre2";
		}else if(season == "pre3-2017" || season.equals("pre3-2017")) {
			season = "2017-pre3";
		}else if(season == "pre4-2017" || season.equals("pre4-2017")) {
			season = "2017-pre4";
		}else if(season == "pre5-2017" || season.equals("pre5-2017")) {
			season = "2017-pre5";
		}else if(season == "pre6-2017" || season.equals("pre6-2017")) {
			season = "2017-pre6";
		}
		
		Document doc = Jsoup.connect("https://bglog.me/player/?player="+search+"&season="+season+"&region="+Region+"&match="+mode+"").get();
		
		SearchDTO dto = new SearchDTO();
		/*기본스탯*/
		dto.setNickName(search);
		dto.setPhoto(doc.select(".profile").attr("src"));
		dto.setRating(doc.select("div.info > p.rating").text());
		dto.setRank(doc.select("div.info > p.rate > span").text());
		dto.setWin(doc.select("div.wt10l > table > thead > tr > th:nth-child(1)").text());
		dto.setTop10(doc.select("div.wt10l > table > thead > tr > th:nth-child(2)").text());
		dto.setLose(doc.select("div.wt10l > table > thead > tr > th:nth-child(3)").text());
		dto.setKd(doc.select("tr:nth-child(1) > td.td2").text());
		dto.setKda(doc.select("tr:nth-child(2) > td.td2").text());
		dto.setAvgdmg(doc.select("tr:nth-child(4) > td.td2").text());
		dto.setHead(doc.select("tr:nth-child(5) > td.td2").text());
		dto.setMostkill(doc.select("tr:nth-child(6) > td.td2").text());
		dto.setMatch(doc.select("tr:nth-child(7) > td.td2").text());
		/*System.out.println("주소 : " + "https://bglog.me/player/?player="+search+"&season="+season+"&region="+Region+"&match="+mode+"");
		System.out.println("닉네임 : " + search);
		System.out.println("사진 : " + doc.select(".profile").attr("src"));
		System.out.println("점수 : " + doc.select("div.info > p.rating").text());
		System.out.println("순위 : " + doc.select("div.info > p.rate > span").text());
		System.out.println("승리 : " + doc.select("div.wt10l > table > thead > tr > th:nth-child(1)").text());
		System.out.println("TOP10 : " + doc.select("div.wt10l > table > thead > tr > th:nth-child(2)").text());
		System.out.println("패배 : " + doc.select("div.wt10l > table > thead > tr > th:nth-child(3)").text());
		System.out.println("K/D : " + doc.select("tr:nth-child(1) > td.td2").text());
		System.out.println("KDA : " + doc.select("tr:nth-child(2) > td.td2").text());
		System.out.println("평균딜량 : " + doc.select("tr:nth-child(4) > td.td2").text());
		System.out.println("헤드샷 : " + doc.select("tr:nth-child(5) > td.td2").text());
		System.out.println("최다킬 : " + doc.select("tr:nth-child(6) > td.td2").text());
		System.out.println("게임수 : " + doc.select("tr:nth-child(7) > td.td2").text());*/
		
		
		/*최고스탯*/
		dto.setBestrating(doc.select("div.box-best > table > tbody > tr:nth-child(2) > th.th2").text());
		dto.setBestkill(doc.select("div.box-best > table > tbody > tr:nth-child(3) > th.th2").text());
		dto.setBestkills(doc.select("div.box-best > table > tbody > tr:nth-child(4) > th.th2").text());
		dto.setBesttime(doc.select("div.box-best > table > tbody > tr:nth-child(5) > th.th2").text());
//		System.out.println("점수 : " + doc.select("div.box-best > table > tbody > tr:nth-child(2) > th.th2").text());
//		System.out.println("1경기 최대 킬수 : " + doc.select("div.box-best > table > tbody > tr:nth-child(3) > th.th2").text());
//		System.out.println("최대 연속 킬 : " + doc.select("div.box-best > table > tbody > tr:nth-child(4) > th.th2").text());
//		System.out.println("최대 생존시간 : " + doc.select("div.box-best > table > tbody > tr:nth-child(5) > th.th2").text());
		
		return dto;
	}

}
