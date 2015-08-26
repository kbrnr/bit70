package org.nojo.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.builder.annotation.MapperAnnotationBuilder;
import org.nojo.domain.AnswerVO;
import org.nojo.domain.FilemanagerVO;
import org.nojo.domain.QuestionVO;
import org.nojo.service.AnswerService;
import org.nojo.service.AttachFileService;
import org.nojo.service.QuestionService;
import org.nojo.util.Criteria;
import org.springframework.security.access.annotation.Secured;
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
public class AnswerController {

	
	//Inject region
	@Inject
	private AnswerService service;
	@Inject
	private QuestionService questionService;
	//region End
	@Inject
	private AttachFileService fileService;
	
	
	
	//답변 글쓰기 region Start
	//원문 글 가져오기
	@Secured("")
	@RequestMapping(value = "/answer", method = RequestMethod.GET)
	public String regist(@PathVariable("domain") String domain, @RequestParam("no") int no, Model model) throws Exception {
		
		model.addAttribute("QuestionVO", questionService.getReadQuestion(no));
		
		return "qna/answer";
	}

	// 답변 글쓰기
	@Transactional
	@RequestMapping(value = "/answer", method = RequestMethod.POST)
	public String resigtAnswer(@PathVariable("domain") String domain, AnswerVO vo, QuestionVO qvo, 
							@RequestParam(value = "attachfile_no", required = false) Integer[] attachfile_no, Criteria cri, Model model)
			throws Exception {
		
		int no = vo.getQuestion_no();
		
		qvo = questionService.getReadQuestion(no);
		String reciver_id = qvo.getMem_id();
		service.addAnswer(vo,reciver_id);
		
		if(attachfile_no != null){
			
			for (Integer files : attachfile_no) {

				FilemanagerVO fvo = new FilemanagerVO();
				fvo.setAnswer_no(vo.getAnswer_no());
				fvo.setClz_domain(vo.getClz_domain());
				fvo.setAttachfile_no(files);
				
				fileService.addAttachFileAnsBoard(fvo);
			}
			
		}

		return "redirect: detail?no= " + vo.getQuestion_no();
	}
	//region End
	
	//답글 전체 가져오기
	@ResponseBody
	@RequestMapping("/getAllAns/{no}")
	public List<AnswerVO> getAllans(@PathVariable("domain") String domain, @PathVariable("no") int no,
			@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		
		List<AnswerVO> list = null;
		list = service.getAllAnswers(domain, no, cri);
		
		return list;
	}
	
	
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
	
	
	
	//파일첨부 조회
	@ResponseBody
	@RequestMapping("/getAnsFile/{rno}")
	public List<FilemanagerVO> getAttach(@PathVariable("rno") Integer rno, 
									@PathVariable("domain") String domain, Model model) throws Exception{
		
		List<FilemanagerVO> fileList = null;
		fileList = fileService.getAnsAttachfile(rno, domain);
		model.addAttribute("file", fileList);
		return fileList;
		
	}
	
		
	// 추천
	@ResponseBody
	@RequestMapping(value= "/answerRecommend", method=RequestMethod.POST)
	public String vote(@RequestParam("ano") Integer ano, HttpServletRequest request) throws Exception {
		
		String referer = request.getHeader("Referer");
		service.voteRecommend(ano);
		
		return "redirect:" + referer;
	}
	
	
	// 답변글 삭제
	@RequestMapping("/answerRemove/{rno}")
	public String remove(@PathVariable("rno") Integer answer_no, HttpServletRequest request) throws Exception {

		service.removeAnswer(answer_no);

		String referer = request.getHeader("Referer");

		return "redirect:" + referer;

	}
}
