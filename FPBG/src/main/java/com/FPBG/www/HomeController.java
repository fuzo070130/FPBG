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
import com.FPBG.domain.dto.SearchDTO;
import com.FPBG.domain.vo.BoardVO;
import com.FPBG.service.BoardService;
import com.FPBG.util.MakeSearch;
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
	public String search(String search ,String season, String mode, String Region,Model model)throws Exception{
		MakeSearch Make = new MakeSearch();
		SearchDTO dto = Make.Search(search, Region, mode, season);
		
		model.addAttribute("dto", dto);
		
		return "player/player";
	}
	
	@RequestMapping(value = "/compare", method = RequestMethod.GET)
	public String search(String search1 ,String search2 ,String season, String mode, String Region,Model model)throws Exception{
		MakeSearch Make = new MakeSearch();
		SearchDTO dto1 = Make.Search(search1, Region, mode, season);
		SearchDTO dto2 = Make.Search(search2, Region, mode, season);
		
		model.addAttribute("dto1", dto1);
		model.addAttribute("dto2", dto2);
		
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
