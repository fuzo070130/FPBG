package com.FPBG.www;

import java.util.ArrayList;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.FPBG.domain.dto.PlayerDTO;
import com.FPBG.domain.dto.RankMemberDTO;
import com.FPBG.domain.vo.BoardVO;
import com.FPBG.service.BoardService;
import com.FPBG.util.MakeTOP10;
import com.FPBG.util.MakeTOP100;
import com.jpubg.www.StatsSearch;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private BoardService boardservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model)throws Exception {
		MakeTOP10 top = new MakeTOP10();

		ArrayList<RankMemberDTO> solo = top.MakeSolo();
		ArrayList<RankMemberDTO> duo = top.MakeDuo();
		ArrayList<RankMemberDTO> squad = top.MakeSquad();
		
		model.addAttribute("solo", solo);
		model.addAttribute("duo", duo);
		model.addAttribute("squad", squad);
		
		return "home";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(String search ,String season, String mode, String Region,Model model) {
		StatsSearch playersearch = new StatsSearch();
		try {
			PlayerDTO dto = playersearch.search(search, season, mode, Region);
			if(dto != null){
				model.addAttribute("search" , playersearch.search(search,season,mode,Region));
			}else{
				model.addAttribute("error", "error");
			}
		}catch(Exception e){
			model.addAttribute("error", "error");
		}
		
		return "player/player";
	}
	
	@RequestMapping(value = "/compare", method = RequestMethod.GET)
	public String search(String search1 ,String search2 ,String season, String mode, String Region,Model model) {
		StatsSearch playersearch = new StatsSearch();
		try {
			PlayerDTO dto1 = playersearch.search(search1, season, mode, Region);
			PlayerDTO dto2 = playersearch.search(search2, season, mode, Region);
			if(dto1 != null || dto2 != null){
				model.addAttribute("search1" , playersearch.search(search1,season,mode,Region));
				model.addAttribute("search2" , playersearch.search(search2,season,mode,Region));
			}else{
				model.addAttribute("error", "error");
			}
		}catch(Exception e){
			model.addAttribute("error", "error");
		}
		
		return "player/player";
	}
	
	@RequestMapping(value = "/readboard", method = RequestMethod.GET)
	public String readboard(Model model)throws Exception{
		
		MakeTOP100 top = new MakeTOP100();
		try {
			model.addAttribute("topdto", top.makeTop100("solo", "as"));
		}catch(Exception e){
			model.addAttribute("error", "error");
		}
		
		return "readboard";
	}
	
	@RequestMapping(value = "/readboard/{server}/{mode}", method = RequestMethod.GET)
	public String readboardAjax(@PathVariable("server")String server, @PathVariable("mode")String mode , Model model)throws Exception{
		
		MakeTOP100 top = new MakeTOP100();
		
		model.addAttribute("topdto", top.makeTop100(mode, server));
		model.addAttribute("server", server);
		model.addAttribute("mode", mode);
		
		return "readboard";
	}
	
	@RequestMapping(value = "/weapons", method = RequestMethod.GET)
	public String weapons() {
		return "option/weapons";
	}
	@RequestMapping(value = "/items", method = RequestMethod.GET)
	public String items() {
		return "option/items";
	}
	@RequestMapping(value = "/attachments", method = RequestMethod.GET)
	public String attachments() {
		return "option/attachments";
	}
	@RequestMapping(value = "/patch", method = RequestMethod.GET)
	public String patch() {
		return "patch";
	}
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board() {
		return "board";
	}
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String newfile(BoardVO vo)throws Exception {
		return "NewFile";
	}
	
}
