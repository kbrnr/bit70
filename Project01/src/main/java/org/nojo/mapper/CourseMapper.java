package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.nojo.bizDomain.JoinMemberVO;
import org.nojo.domain.CourseVO;
import org.nojo.util.SearchCriteria;

public interface CourseMapper {
	
	//수업별 참여인원
	public List<JoinMemberVO> selcetMemberByDomain(@Param("cri") SearchCriteria cri, @Param("domain") String domain);
	
	//수업별 참여인원 토탈수
	public int selectTotalCntByDomain(@Param("cri") SearchCriteria cri, @Param("domain") String domain);	
	
	
	//해당 수업의 담당선생님 리스트 삭제
	@Select("select mem_id from tbl_course "
			+ "where course_gb in('member_student', 'member_clz_president') "
			+ "and clz_domain = #{domain}"
			)
	public List<String> getStudentIdList(String domain);

	
	

	
	
	//학생 수업참여(승인요청 ajax) 
	@Insert("Insert into tbl_course (clz_domain, mem_id, course_state, course_gb) values (#{clz_domain}, #{mem_id}, #{course_state}, #{course_gb})")
	public void insertCourseStudent(CourseVO vo);
	
	
	//선생님-->학생승인(가입승인ajax) 
	@Update("Update tbl_course set course_state=#{course_state} where clz_domain = #{clz_domain} and mem_id = #{mem_id}")
	public void updateCourse(CourseVO vo);
}
