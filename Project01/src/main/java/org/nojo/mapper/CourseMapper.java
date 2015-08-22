package org.nojo.mapper;

import org.apache.ibatis.annotations.Insert;
import org.nojo.domain.CourseVO;

public interface CourseMapper {

	//학생 수업참여
	@Insert("Insert into tbl_course (clz_domain, mem_id, course_state, course_gb) values (#{clz_domain}, #{mem_id}, #{course_state}, #{course_gb})")
	public void insertCourse(CourseVO vo);
	
}
