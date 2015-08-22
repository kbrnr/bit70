package org.nojo.controller;

import javax.inject.Inject;

import org.nojo.domain.CourseVO;
import org.nojo.service.CourseService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/course")
public class CourseController {

	@Inject
	private CourseService courseService;
	
	//학생 수업 참여 
	@ResponseBody
	@RequestMapping(value="/joinclass", method=RequestMethod.POST)
	public void joinclass(@RequestBody CourseVO vo){
		System.out.println("@Controller:"+ vo.getClz_domain());	
		System.out.println("@Controller:"+ vo.getMem_id());	
		
		courseService.setCourse(vo);	
	}
	
	//학생 수업 승인 
	@ResponseBody
	@RequestMapping(value="/joinclassOK", method=RequestMethod.PUT)
	public void joinclassOK(@RequestBody CourseVO vo){
		System.out.println("@joinclassOK:"+ vo.getClz_domain());	
		System.out.println("@joinclassOK:"+ vo.getMem_id());	
		
		courseService.setCourseOK(vo);	
	}
	
	
	
}
