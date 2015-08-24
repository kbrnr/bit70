package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.nojo.domain.CourseVO;

public interface CourseMapper {
	
	//해당 수업의 학생 ID리스트
	@Select("select mem_id from tbl_course "
			+ "where course_gb in('member_student', 'member_clz_president') "
			+ "and clz_domain = #{domain}"
			)
	public List<String> getStudentIdList(String domain);
	
	
	//학생 수업참여
	@Insert("Insert into tbl_course (clz_domain, mem_id, course_state, course_gb) values (#{clz_domain}, #{mem_id}, #{course_state}, #{course_gb})")
	public void insertCourse(CourseVO vo);
	
	
	//학생 수업참여
	@Insert("Update tbl_course set course_state=#{course_state} where clz_domain = #{clz_domain} and mem_id = #{mem_id}")
	public void updateCourse(CourseVO vo);
}
