package com.FPBG.www;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.FPBG.domain.vo.BoardVO;
import com.FPBG.service.BoardService;
import com.FPBG.service.SampleService;
import com.jpubg.www.TOP10;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private SampleService service;
	
	@Inject
	private BoardService boardservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model)throws Exception {
		System.out.println(service.select());
		return "home";
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
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGet() {
		System.out.println("get");
		return "register";
	}
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPost(BoardVO vo)throws Exception {
		System.out.println("post");
		boardservice.create(vo);
		return "home";
	}
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String newfile(BoardVO vo)throws Exception {
		return "NewFile";
	}
	
}
