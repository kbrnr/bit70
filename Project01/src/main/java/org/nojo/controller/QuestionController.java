package org.nojo.controller;

import java.util.List;

import javax.inject.Inject;

import org.nojo.domain.QuestionVO;
import org.nojo.service.QuestionService;
import org.nojo.util.Criteria;
import org.nojo.util.PageMaker;
import org.nojo.util.Search;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/{domain}/QnABoard")
public class QuestionController {

	@Inject
	private QuestionService service;

	@RequestMapping("/listpage")
	public String ListPage(@PathVariable("domain") String domain, Criteria cri, Model model, 
							String searchKey, String searchValue) throws Exception {

		Search search = new Search();
		if(searchKey != null)
			search.setSearchKey(searchKey.split("&"));
		search.setSearchValue(searchValue);
		
		PageMaker pagemaker = null;
		List<QuestionVO> list = null;
		
		if(search.getSearchValue() == null){

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
		
		return "QnABoard/listpage";
	}

	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String regist() {

		return "QnABoard/regist";
	}

	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String registQuestion(QuestionVO vo) throws Exception {

		service.addQuestion(vo);
		return "redirect:listpage";
	}

	@RequestMapping("/read")
	public String readBoard(@RequestParam("no") int no, @ModelAttribute("cri") Criteria cri, Model model)
			throws Exception {
		model.addAttribute("QuestionVO", service.getReadQuestion(no));
		return "QnABoard/read";
	}
	
	@RequestMapping("/modify")
	public String modify( @RequestParam("no") int no, @ModelAttribute("cri") Criteria cri, Model model)
			throws Exception {
		
		readBoard(no, cri, model);
		
		return "QnABoard/modify";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyBoard(QuestionVO vo) throws Exception {

		service.modifyQuestion(vo);

		return "redirect:read?no=" + vo.getQuestion_no();
	}

	@RequestMapping(value = "/remove/{no}")
	public String removeBoard(@PathVariable("no") int no) throws Exception {

		service.removeQuestion(no);

		return "redirect:../listpage";
	}

}
