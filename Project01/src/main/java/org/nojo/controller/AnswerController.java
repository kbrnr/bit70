package org.nojo.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.nojo.domain.AnswerVO;
import org.nojo.service.AnswerService;
import org.nojo.service.QuestionService;
import org.nojo.util.Criteria;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/{domain}/qna")
public class AnswerController {

	
	//Inject region
	@Inject
	private AnswerService service;
	@Inject
	private QuestionService questionService;
	//region End
	
	
	
	
	
	
	//답변 글쓰기 region Start
	//원문 글 가져오기
	@RequestMapping(value = "/answer", method = RequestMethod.GET)
	public String regist(@RequestParam("no") int no, Model model) throws Exception {

		model.addAttribute("QuestionVO", questionService.getReadQuestion(no));

		return "qna/answer";
	}

	// 답변 글쓰기
	@RequestMapping(value = "/answer", method = RequestMethod.POST)
	public String resigtAnswer(@PathVariable("domain") String domain, AnswerVO vo, Criteria cri, Model model)
			throws Exception {

		service.addAnswer(vo);

		return "redirect: detail?no= " + vo.getQuestion_no();
	}
	//region End
	
	
	
	
	
	//답변 수정하기 region Start
	//원문 글 가져오기
	public void readQuestion(@PathVariable("domain") String domain, @RequestParam("no") Integer no, Criteria cri,
			Model model) throws Exception {

		model.addAttribute("QuestionVO", questionService.getReadQuestion(no));
	}
	//수정 글 가져오기
	public void getAnswers(@PathVariable("domain") String domain, @RequestParam("no") int no,
			@RequestParam("rno") int rno, Model model) throws Exception {

		model.addAttribute("vo", service.readAnswer(no, domain, rno));
	}
	// 답변 수정
	@RequestMapping(value = "/answerModify", method = RequestMethod.GET)
	public String modify(@PathVariable("domain") String domain, @RequestParam("no") int no,
			@RequestParam("rno") int rno, Criteria cri, Model model) throws Exception {

		readQuestion(domain, no, cri, model);
		getAnswers(domain, no, rno, model);

		return "qna/answerModify";
	}
	@RequestMapping(value = "/answerModify", method = RequestMethod.POST)
	public String modify(AnswerVO vo) throws Exception {

		service.modifyAnswer(vo);

		return "redirect: detail?no=" + vo.getQuestion_no();
	}
	//region End

	
	
	
	
	// 추천 (부가기능 미구현)
	public void vote(AnswerVO vo) throws Exception {

	}
	
	
	// 답변글 삭제
	@RequestMapping("/answerRemove/{rno}")
	public String remove(@PathVariable("rno") Integer answer_no, HttpServletRequest request) throws Exception {

		service.removeAnswer(answer_no);

		String referer = request.getHeader("Referer");

		return "redirect:" + referer;

	}
}