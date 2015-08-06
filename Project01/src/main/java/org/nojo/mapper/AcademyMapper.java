package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.nojo.domain.ClassVO;
import org.nojo.domain.CourseVO;
import org.nojo.domain.MemberVO;
import org.nojo.util.Criteria;

public interface AcademyMapper {

	//수업생성
	@Insert("Insert into tbl_class (clz_domain, clz_name, clz_room, clz_start_date, clz_end_date, clz_state) values (#{clz_domain}, #{clz_name}, #{clz_room}, #{clz_start_date}, #{clz_end_date}, #{clz_state})")
	public void insertClass(ClassVO vo);
	
	//수업에 선생님 참여
	@Insert("Insert into tbl_course (clz_domain, mem_id, course_state, course_gb) values (#{clz_domain}, #{mem_id}, #{course_state}, #{course_gb})")
	public void insertCourse(CourseVO vo);
	
	//수업리스트
	@Select("select * from tbl_class order by clz_reg_date desc limit #{first}, #{perPageNum}")
	public List<ClassVO> selectClass(Criteria cri);
	
	//수업 토탈갯수
	@Select("select count(clz_domain) from tbl_class")
	public int selectClassTotalCnt();
	
	//선생님리스트
	@Select("select mem_id, mem_name, mem_reg_date, mem_email, mem_tel from tbl_member where mem_gb='member_teacher' order by mem_reg_date desc limit #{first}, #{perPageNum} ")
	public List<MemberVO> selcetTeacher(Criteria cri);
	
	//선생님 토탈갯수
	@Select("select count(mem_gb) from tbl_member where mem_gb='member_teacher'")
	public int selectTeacherTotalCnt() throws Exception;
	
	
}
