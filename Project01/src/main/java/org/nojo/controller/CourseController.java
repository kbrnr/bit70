package org.nojo.controller;

import java.util.List;

import javax.inject.Inject;

import org.nojo.bizDomain.JoinMemberVO;
import org.nojo.domain.CourseVO;
import org.nojo.service.CourseService;
import org.nojo.util.PageMaker;
import org.nojo.util.SearchCriteria;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/{domain}/course")
public class CourseController {

	@Inject
	private CourseService courseService;
	
	// 우리반학생
	@RequestMapping(value = "/joinmemberlist", method = RequestMethod.GET)
	public String teacherlist(@PathVariable("domain") String domain, SearchCriteria cri, Model model) throws Exception {
		List<JoinMemberVO> list;
		PageMaker pageMaker;

		System.out.println("*********************************************************");
		System.out.println(cri.getSearchType());
		System.out.println(cri.getKeyword());
		System.out.println("*********************************************************");
		
		cri.setPerPageNum(12);
		
		list = courseService.getMemberByDomain(cri, domain);
		pageMaker = new PageMaker(cri, courseService.getTotalCntByDomain(cri, domain));
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);

		return "/course/joinmemberlist";
	}
	
	

	
	//학생 수업 승인 
	@ResponseBody
	@RequestMapping(value="/joinclassOK", method=RequestMethod.PUT)
	public void joinclassOK(@RequestBody CourseVO vo){
		courseService.setCourseOK(vo);
	}
	
	
	
}
