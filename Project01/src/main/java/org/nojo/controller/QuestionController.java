package org.nojo.controller;

import javax.inject.Inject;

import org.nojo.domain.QuestionVO;
import org.nojo.service.QuestionService;
import org.nojo.util.Criteria;
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
	public String ListPage(@PathVariable("domain") String clz_domain) {
		/*
		 * ClassVO vo = new ClassVO(); model.addAttribute("clz_domain",
		 * vo.getClz_domain());
		 */
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
	public void readBoard(@RequestParam("no") int question_no, @ModelAttribute("cri") Criteria cri, Model model)
			throws Exception {

		model.addAttribute("boardVO", service.getReadQuestion(question_no));

	}

	@RequestMapping("/modify")
	public void modify(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model)
			throws Exception {

		readBoard(bno, cri, model);
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyBoard(QuestionVO vo) throws Exception {

		service.modifyQuestion(vo);
		
		return "redirect:read?bno=" + vo.getQuestion_no();
	}

	@RequestMapping(value = "/remove/{no}")
	public String removeBoard(@PathVariable("no") int question_no) throws Exception {

		service.removeQuestion(question_no);
		
		return "redirect:../listpage";
	}

}
