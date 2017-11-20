package com.jpubg.www;

import pro.lukasgorny.core.JPubg;
import pro.lukasgorny.dto.FilterCriteria;
import pro.lukasgorny.dto.Player;
import pro.lukasgorny.dto.Stat;
import pro.lukasgorny.enums.PUBGMode;
import pro.lukasgorny.enums.PUBGRegion;
import pro.lukasgorny.enums.PUBGSeason;
import pro.lukasgorny.enums.PUBGStat;
import pro.lukasgorny.factory.JPubgFactory;

public class TOP100 {
	{
	
	JPubg jPubg = JPubgFactory.getWrapper("a56b69fc-a8ab-4d5b-a151-24868ea4d28d");

	// We're filtering by mode, region and season here
	FilterCriteria criteria = new FilterCriteria();
	criteria.setMode(PUBGMode.duo);
	criteria.setRegion(PUBGRegion.agg);
	criteria.setSeason(PUBGSeason.PRE5_2017);

	Player player = null;

	// Always remember to use try-catch block for error processing!
	try {
	      player = jPubg.getByNickname("Mester_Noah", criteria);
	} catch (IllegalArgumentException e) {
	      System.out.println("Player could not be found or validated: " + e.getLocalizedMessage());
	}

	if(player != null) {
	      // We would like to retrieve best rating for player "TheHusar" for season PRE2_2017
	      Stat stat = jPubg.getPlayerMatchStatByStatName(player, PUBGStat.RATING);
	      Stat stat2 = jPubg.getPlayerMatchStatByStatName(player, PUBGStat.WIN_RATIO);
	      Stat stat3 = jPubg.getPlayerMatchStatByStatName(player, PUBGStat.TOP_10_RATIO);
	      Stat stat4 = jPubg.getPlayerMatchStatByStatName(player, PUBGStat.KILL_DEATH_RATIO);
	      Stat stat5 = jPubg.getPlayerMatchStatByStatName(player, PUBGStat.WINS);
	      Stat stat6 = jPubg.getPlayerMatchStatByStatName(player, PUBGStat.KILLS);
	      Stat stat7 = jPubg.getPlayerMatchStatByStatName(player, PUBGStat.DAMAGE_DEALT);
	      
	      // You can get season name directly from stat object
	      System.out.println(stat.getStringValue());
	      System.out.println(stat2.getStringValue());
	      System.out.println(stat3.getStringValue());
	      System.out.println(stat4.getStringValue());
	      System.out.println(stat5.getStringValue());
	      System.out.println(stat6.getStringValue());
	      System.out.println(stat7.getStringValue());
		}

	}
}
