package org.nojo.mapper;

import org.apache.ibatis.annotations.Insert;
import org.nojo.domain.CourseVO;

public interface CourseMapper {

	//학생 수업참여
	@Insert("Insert into tbl_course (clz_domain, mem_id, course_state, course_gb) values (#{clz_domain}, #{mem_id}, #{course_state}, #{course_gb})")
	public void insertCourse(CourseVO vo);
	
	
	//학생 수업참여
	@Insert("Update tbl_course set course_state=#{course_state} where clz_domain = #{clz_domain} and mem_id = #{mem_id}")
	public void updateCourse(CourseVO vo);
}
