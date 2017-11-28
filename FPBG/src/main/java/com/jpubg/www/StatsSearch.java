package com.jpubg.www;

import com.FPBG.domain.dto.PlayerDTO;

import pro.lukasgorny.core.JPubg;
import pro.lukasgorny.dto.FilterCriteria;
import pro.lukasgorny.dto.Player;
import pro.lukasgorny.dto.Stat;
import pro.lukasgorny.enums.PUBGMode;
import pro.lukasgorny.enums.PUBGRegion;
import pro.lukasgorny.enums.PUBGSeason;
import pro.lukasgorny.enums.PUBGStat;
import pro.lukasgorny.factory.JPubgFactory;

public class StatsSearch {
	
	public PlayerDTO search(String search,String season,String mode, String Region) {
		FilterCriteria criteria = new FilterCriteria();
		PlayerDTO dto = new PlayerDTO();
		System.out.println(search);
		System.out.println(season);
		System.out.println(mode);
		System.out.println(Region);
		
		if(search.equals("") || search == ""){
			return dto;
		}
		if(season != null){
			if(season.equals("") || season == ""){
				criteria.setSeason(PUBGSeason.PRE5_2017);
				System.out.println("season5");
			}else if(season.equals("pre1-2017") || season == "pre1-2017"){
				criteria.setSeason(PUBGSeason.PRE1_2017);
				System.out.println("season1");
			}else if(season.equals("pre2-2017") || season == "pre2-2017"){
				criteria.setSeason(PUBGSeason.PRE2_2017);
				System.out.println("season2");
			}else if(season.equals("pre3-2017") || season == "pre3-2017"){
				criteria.setSeason(PUBGSeason.PRE3_2017);
				System.out.println("season3");
			}else if(season.equals("pre4-2017") || season == "pre4-2017"){
				criteria.setSeason(PUBGSeason.PRE4_2017);
				System.out.println("season4");
			}else if(season.equals("pre5-2017") || season == "pre5-2017"){
				criteria.setSeason(PUBGSeason.PRE5_2017);
				System.out.println("season5");
			}
		}
		
		if(mode != null){
			if(mode.equals("") || mode == ""){
				criteria.setMode(PUBGMode.solo);
				System.out.println("mode solo");
			}else if(mode.equals("solo") || mode == "solo"){
				criteria.setMode(PUBGMode.solo);
				System.out.println("mode solo");
			}else if(mode.equals("duo") || mode == "duo"){
				criteria.setMode(PUBGMode.duo);
				System.out.println("mode duo");
			}else if(mode.equals("squad") || mode == "squad"){
				criteria.setMode(PUBGMode.squad);
				System.out.println("mode squado");
			}else if(mode.equals("solo-fpp") || mode == "solo-fpp"){
				criteria.setMode(PUBGMode.solo_fpp);
				System.out.println("mode solo_fpp");
			}else if(mode.equals("duo-fpp") || mode == "duo-fpp"){
				criteria.setMode(PUBGMode.duo_fpp);
				System.out.println("mode duo_fpp");
			}else if(mode.equals("squad-fpp") || mode == "squad-fpp"){
				criteria.setMode(PUBGMode.squad_fpp);
				System.out.println("mode squad_fpp");
			}
		}
		
		if(Region != null){
			if(Region.equals("") || Region == "" || Region == null){
				criteria.setRegion(PUBGRegion.as);
				System.out.println("Region as");
			}else if(Region.equals("as") || Region == "as"){
				criteria.setRegion(PUBGRegion.as);
				System.out.println("Region as");
			}else if(Region.equals("na") || Region == "na"){
				criteria.setRegion(PUBGRegion.na);
				System.out.println("Region NA");
			}else if(Region.equals("eu") || Region == "eu"){
				criteria.setRegion(PUBGRegion.eu);
				System.out.println("Region EU");
			}else if(Region.equals("krjp") || Region == "krjp"){
				criteria.setRegion(PUBGRegion.krjp);
				System.out.println("Region KR/JP");
			}else if(Region.equals("oc") || Region == "oc"){
				criteria.setRegion(PUBGRegion.oc);
				System.out.println("Region OC");
			}else if(Region.equals("sa") || Region == "sa"){
				criteria.setRegion(PUBGRegion.sa);
				System.out.println("Region SA");
			}else if(Region.equals("sea") || Region == "sea"){
				criteria.setRegion(PUBGRegion.sea);
				System.out.println("Region SEA");
			}
		}
		
		JPubg jPubg = JPubgFactory.getWrapper("a56b69fc-a8ab-4d5b-a151-24868ea4d28d");

		Player player = null;
		
		try {
		      player = jPubg.getByNickname(search, criteria);
		} catch (IllegalArgumentException e) {
		      System.out.println("Player could not be found or validated: " + e.getLocalizedMessage());
		}

		if(player != null) {
		      Stat rating = jPubg.getPlayerMatchStatByStatName(player, PUBGStat.RATING);
		      Stat win_Ratio = jPubg.getPlayerMatchStatByStatName(player, PUBGStat.WIN_RATIO);
		      Stat top_10_Ratio = jPubg.getPlayerMatchStatByStatName(player, PUBGStat.TOP_10_RATIO);
		      Stat kill_Death_Ratio = jPubg.getPlayerMatchStatByStatName(player, PUBGStat.KILL_DEATH_RATIO);
		      Stat wins = jPubg.getPlayerMatchStatByStatName(player, PUBGStat.WINS);
		      Stat kills = jPubg.getPlayerMatchStatByStatName(player, PUBGStat.KILLS);
		      Stat damage_Per_Game = jPubg.getPlayerMatchStatByStatName(player, PUBGStat.DAMAGE_PER_GAME);
		      Stat round_Played = jPubg.getPlayerMatchStatByStatName(player, PUBGStat.ROUNDS_PLAYED);
		      
		      dto.setRating(rating.getStringValue());
		      dto.setWin_Ratio(win_Ratio.getStringValue());
		      dto.setTop_10_Ratio(top_10_Ratio.getStringValue());
		      dto.setKill_Death_Ratio(kill_Death_Ratio.getStringValue());
		      dto.setWins(wins.getStringValue());
		      dto.setKills(kills.getStringValue());
		      dto.setDamage_Per_Game(damage_Per_Game.getStringValue());
		      dto.setRound_Played(round_Played.getStringValue());
		}
		
		return dto;
	}
	
}