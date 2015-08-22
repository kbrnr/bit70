package org.nojo.service;

import javax.inject.Inject;

import org.nojo.domain.CourseVO;
import org.nojo.mapper.CourseMapper;
import org.springframework.stereotype.Service;

@Service
public class CourseServiceImpl implements CourseService {
	
	@Inject
	private CourseMapper courseMapper;
	
	public void setCourse(CourseVO vo){
		vo.setCourse_state(1); //[승인대기]
		vo.setCourse_gb("member_student");
		courseMapper.insertCourse(vo);
	}
	
}
