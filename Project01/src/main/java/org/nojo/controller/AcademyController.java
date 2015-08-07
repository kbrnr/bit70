package org.nojo.controller;

import java.util.List;

import javax.inject.Inject;

import org.nojo.bizDomain.ClassFormVO;
import org.nojo.domain.MemberVO;
import org.nojo.service.AcademyService;
import org.nojo.util.Criteria;
import org.nojo.util.PageMaker;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/academy")
public class AcademyController {

	@Inject
	private AcademyService acdmService;
	
	//수업등록폼
	@RequestMapping(value="/classform", method=RequestMethod.GET)
	public void classform(){
	}

	//수업등록
	@RequestMapping(value="/classregister", method=RequestMethod.GET)
	public String classregister(ClassFormVO vo){
		System.out.println("@Controller:"+ vo.toString());	
		acdmService.makeClass(vo);
		return "redirect:classmodify";
	}
	
	//수업상세
	@RequestMapping(value="/classmodify", method=RequestMethod.GET)
	public String classmodify(){
		return "redirect:classmodify";
	}
	
	//수업리스트
	@RequestMapping(value="/classlist", method=RequestMethod.GET)
	public void classlist(Criteria cri, Model model){
		List<ClassFormVO> list;
		PageMaker pagemaker;
		
		list = acdmService.getClassList(cri);
		pagemaker = new PageMaker(cri, acdmService.getClassTotalCnt());
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pagemaker);
	}
	
	
//	//수업리스트
//	@RequestMapping(value="/classlist", method=RequestMethod.GET)
//	public void classlist(Criteria cri, Model model){
//		List<ClassVO> list;
//		PageMaker pagemaker;
//		
//		list = acdmService.getClassList(cri);
//		pagemaker = new PageMaker(cri, acdmService.getClassTotalCnt());
//		model.addAttribute("list", list);
//		model.addAttribute("pageMaker", pagemaker);
//	}
	
	
	//선생님리스트
	@RequestMapping(value="/teacherlist", method=RequestMethod.GET)
	public void teacherlist(Criteria cri, Model model) throws Exception{
		List<MemberVO> list;
		PageMaker pagemaker;
		
		list = acdmService.getTeacherList(cri);
		pagemaker = new PageMaker(cri, acdmService.getTeacherTotalCnt());
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pagemaker);
	}
	
}
