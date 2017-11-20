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
	
	public PlayerDTO search(String search) {
		PlayerDTO dto = new PlayerDTO();
		
		JPubg jPubg = JPubgFactory.getWrapper("a56b69fc-a8ab-4d5b-a151-24868ea4d28d");

		// We're filtering by mode, region and season here
		FilterCriteria criteria = new FilterCriteria();
		criteria.setMode(PUBGMode.squad);
		criteria.setRegion(PUBGRegion.krjp);
		criteria.setSeason(PUBGSeason.PRE5_2017);

		Player player = null;
		// Always remember to use try-catch block for error processing!
		try {
		      player = jPubg.getByNickname(search, criteria);
		} catch (IllegalArgumentException e) {
		      System.out.println("Player could not be found or validated: " + e.getLocalizedMessage());
		}

		if(player != null) {
		      // We would like to retrieve best rating for player "TheHusar" for season PRE2_2017
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
		      
		      // You can get season name directly from stat object
		}
		return dto;
	}
	
}