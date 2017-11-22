package com.FPBG.www;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.FPBG.domain.vo.AdminBoardVO;
import com.FPBG.domain.vo.PageMaker;
import com.FPBG.domain.vo.SearchCriteria;
import com.FPBG.service.AdminBoardService;

@Controller
@RequestMapping("/patch/*")
public class AdminBoardController {

  private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);

  @Inject
  private AdminBoardService service;

  @RequestMapping(value = "/Adminlist", method = RequestMethod.GET)
  public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

    logger.info(cri.toString());

    //model.addAttribute("list", service.listCriteria(cri));
    model.addAttribute("list", service.listSearchCriteria(cri));

    PageMaker pageMaker = new PageMaker();
    pageMaker.setCri(cri);

    //pageMaker.setTotalCount(service.listCountCriteria(cri));
    pageMaker.setTotalCount(service.listSearchCount(cri));

    model.addAttribute("pageMaker", pageMaker);
  }

  @RequestMapping(value = "/AdminreadPage", method = RequestMethod.GET)
  public void read(@RequestParam("adminboardNumber") int adminboardNumber, @ModelAttribute("cri") SearchCriteria cri, Model model)
      throws Exception {
	  
    model.addAttribute("AdminBoardVO",service.read(adminboardNumber));
  }

  @RequestMapping(value = "/AdminremovePage", method = RequestMethod.POST)
  public String remove(@RequestParam("adminboardNumber") int adminboardNumber, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

    service.delete(adminboardNumber);

    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/patch/Adminlist";
  }

  @RequestMapping(value = "/AdminmodifyPage", method = RequestMethod.GET)
  public void modifyPagingGET(int adminboardNumber, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

    model.addAttribute("AdminBoardVO", service.read(adminboardNumber));
  }

  @RequestMapping(value = "/AdminmodifyPage", method = RequestMethod.POST)
  public String modifyPagingPOST(AdminBoardVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

    logger.info(cri.toString());
    service.update(board);

    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());

    rttr.addFlashAttribute("msg", "SUCCESS");

    logger.info(rttr.toString());

    return "redirect:/patch/Adminlist";
  }

  @RequestMapping(value = "/Adminregister", method = RequestMethod.GET)
  public void registGET() throws Exception {

    logger.info("regist get ...........");
  }

  @RequestMapping(value = "/Adminregister", method = RequestMethod.POST)
  public String registPOST(AdminBoardVO board, RedirectAttributes rttr) throws Exception {

    logger.info("regist post ...........");
    logger.info(board.toString());

    service.create(board);

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/patch/Adminlist";
  }

 }
