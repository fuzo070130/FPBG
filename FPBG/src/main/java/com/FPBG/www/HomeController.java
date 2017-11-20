package com.FPBG.www;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.FPBG.domain.dto.PlayerDTO;
import com.FPBG.domain.vo.BoardVO;
import com.FPBG.service.BoardService;
import com.jpubg.www.TOP10;
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
		return "home";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(String search , Model model) {
		System.out.println(search);
		StatsSearch playersearch = new StatsSearch();
		model.addAttribute("search" , playersearch.search(search));
		return "player/player";
	}
	
	@RequestMapping(value = "/readboard", method = RequestMethod.GET)
	public String readboard() {
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
