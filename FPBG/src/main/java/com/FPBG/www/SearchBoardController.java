package com.FPBG.www;

import java.io.File;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.FPBG.domain.dto.PageMaker;
import com.FPBG.domain.vo.BoardVO;
import com.FPBG.domain.vo.PhotoVO;
import com.FPBG.domain.vo.SearchCriteria;
import com.FPBG.service.BoardService;

@Controller
@RequestMapping("/sboard/*")
public class SearchBoardController {

  private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);

  @Inject
  private BoardService service;

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

    //model.addAttribute("list", service.listCriteria(cri));
    model.addAttribute("list", service.listSearchCriteria(cri));

    PageMaker pageMaker = new PageMaker();
    pageMaker.setCri(cri);

    //pageMaker.setTotalCount(service.listCountCriteria(cri));
    pageMaker.setTotalCount(service.listSearchCount(cri));

    model.addAttribute("pageMaker", pageMaker);
  }

  @RequestMapping(value = "/readPage", method = RequestMethod.GET)
  public void read(@RequestParam("boardNumber") int boardNumber, @ModelAttribute("cri") SearchCriteria cri, Model model)
      throws Exception {

    model.addAttribute(service.read(boardNumber));
  }

  @RequestMapping(value = "/removePage", method = RequestMethod.POST)
  public String remove(@RequestParam("boardNumber") int boardNumber, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

    service.delete(boardNumber);

    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/sboard/list";
  }

  @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
  public void modifyPagingGET(int boardNumber, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

    model.addAttribute(service.read(boardNumber));
  }

  @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
  public String modifyPagingPOST(BoardVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
	  
	service.update(board);
	
    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/sboard/list";
  }

  @RequestMapping(value = "/register", method = RequestMethod.GET)
  public void registGET() throws Exception {

  }

  @RequestMapping(value = "/register", method = RequestMethod.POST)
  public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception {

    logger.info("regist post ...........");
    logger.info(board.toString());
    
    /*String content = board.getBoardContent();
    String contentMain = content.substring(3 , content.length()-4);
    board.setBoardContent(contentMain);*/
    
    service.create(board);

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/sboard/list";
  }
  
  @RequestMapping("/photoUpload")
  public String photoUpload(HttpServletRequest request, PhotoVO vo){
      String callback = vo.getCallback();
      String callback_func = vo.getCallback_func();
      String file_result = "";
      try {
          if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
              //파일이 존재하면
              String original_name = vo.getFiledata().getOriginalFilename();
              String ext = original_name.substring(original_name.lastIndexOf(".")+1);
              //파일 기본경로
              String defaultPath = request.getSession().getServletContext().getRealPath("/");
              //파일 기본경로 _ 상세경로
              String path = defaultPath + "resources" + File.separator + "photo_upload" + File.separator;             
              File file = new File(path);
              System.out.println("path:"+path);
              //디렉토리 존재하지 않을경우 디렉토리 생성
              if(!file.exists()) {
                  file.mkdirs();
              }
              //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
              String realname = UUID.randomUUID().toString() + "." + ext;
          ///////////////// 서버에 파일쓰기 /////////////////
              vo.getFiledata().transferTo(new File(path+realname));
              file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/FPBG/resources/photo_upload/"+realname;
          } else {
              file_result += "&errstr=error";
          }
      } catch (Exception e) {
          e.printStackTrace();
      }
      return "redirect:" + callback + "?callback_func="+callback_func+file_result;
  }
}
