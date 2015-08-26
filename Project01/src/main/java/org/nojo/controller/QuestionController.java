package org.nojo.controller;

import java.util.List;

import javax.inject.Inject;

import org.nojo.domain.AnswerVO;
import org.nojo.domain.FilemanagerVO;
import org.nojo.domain.QuestionVO;
import org.nojo.service.AnswerService;
import org.nojo.service.AttachFileService;
import org.nojo.service.QuestionService;
import org.nojo.util.Criteria;
import org.nojo.util.PageMaker;
import org.nojo.util.Search;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/{domain}/qna")
public class QuestionController {

	// region Inject
	@Inject
	private QuestionService service;
	@Inject
	private AnswerService ansService;
	// region End
	@Inject
	private AttachFileService fileService;

	
	
	
	
	// 리스트페이지 & 검색
	@RequestMapping("/listpage")
	public String ListPage(@PathVariable("domain") String domain, Criteria cri, Model model, String searchKey,
			String searchValue) throws Exception {

		Search search = new Search();
		if (searchKey != null)
			search.setSearchKey(searchKey.split("&"));
		search.setSearchValue(searchValue);

		PageMaker pagemaker = null;
		List<QuestionVO> list = null;

		if (search.getSearchValue() == null) {

			pagemaker = new PageMaker(cri, service.getCnt(domain));
			list = service.listQuestion(domain, cri);

		} else {

			pagemaker = new PageMaker(cri, service.getSearchCnt(domain, search));
			list = service.searchQuestion(domain, cri, search);

			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchValue", searchValue);

		}

		model.addAttribute("list", list);
		model.addAttribute("pagemaker", pagemaker);

		return "qna/listpage";
	}

	// 등록 region
	@RequestMapping(value = "/questionRegist", method = RequestMethod.GET)
	public String regist(@PathVariable("domain") String domain) {

		return "qna/questionRegist";
	}

	@Transactional
	@RequestMapping(value = "/questionRegist", method = RequestMethod.POST)
	public String registQuestion(QuestionVO vo,
			@RequestParam(value = "attachfile_no", required = false) Integer[] attachfile_no,@PathVariable("domain") String domain) throws Exception {

		service.addQuestion(vo);

		 if (attachfile_no != null) {
			 
			 for (Integer files : attachfile_no) {
				 
				 FilemanagerVO fvo = new FilemanagerVO();
				 
				 fvo.setQuestion_no(vo.getQuestion_no());
				 fvo.setClz_domain(vo.getClz_domain());
				 fvo.setAttachfile_no(files);
				 fileService.addAttachFileBoard(fvo);
			}
				
		 }
		
		return "redirect:listpage";
	}

	// region End

	// 질문 글 조회
	@RequestMapping("/detail")
	public String readBoard(@PathVariable("domain") String domain, @RequestParam("no") int no,
			@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		PageMaker pagemaker = null;
		List<AnswerVO> list = null;

		pagemaker = new PageMaker(cri, ansService.getCntList(no));
		list = ansService.getAllAnswers(domain, no, cri);

		for (AnswerVO vo : list) {
			vo.getAnswer_no();
		}
		
		model.addAttribute("ansList", list);
		model.addAttribute("QuestionVO", service.getReadQuestion(no));

		return "qna/detail";
	}
	
	//파일첨부 조회
	@ResponseBody
	@RequestMapping("/getQuestionFile/{no}")
	public List<FilemanagerVO> getAttach(@PathVariable("no") Integer no, 
									@PathVariable("domain") String domain) throws Exception{
		
		List<FilemanagerVO> fileList = null;
		fileList = fileService.getQAttachFile(no, domain);
		return fileList;
		
	}
	

	// 글 수정 region
	@RequestMapping("/questionModify")
	public String modify(@PathVariable("domain") String domain, @RequestParam("no") int no,
			@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		readBoard(domain, no, cri, model);

		return "qna/questionModify";
	}

	@Transactional
	@RequestMapping(value = "/questionModify", method = RequestMethod.POST)
	public String modifyBoard(QuestionVO vo,
			@RequestParam(value = "attachfile_no", required = false) Integer[] attachfile_no,
			@PathVariable("domain") String domain) throws Exception {

		Integer question_no = vo.getQuestion_no();

		if (attachfile_no != null) {
			
			for (Integer files : attachfile_no) {
				
				FilemanagerVO fvo = new FilemanagerVO();
				
				fvo.setQuestion_no(question_no);
				fvo.setClz_domain(domain);
				fvo.setAttachfile_no(files);
				
				fileService.addAttachFileBoard(fvo);
				
			}
		}

		if (attachfile_no == null) {

			fileService.removeAttach(question_no);

		}

		service.modifyQuestion(vo);

		return "redirect:detail?no=" + question_no;
	}
	// region End

	// 글삭제
	@RequestMapping(value = "/questionRemove/{no}")
	public String removeBoard(@PathVariable("no") int no) throws Exception {
		
		fileService.removeAttachQuestionBoard(no);
		service.removeQuestion(no);

		return "redirect:../listpage";
	}

}
