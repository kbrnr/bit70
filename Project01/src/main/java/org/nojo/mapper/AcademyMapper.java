package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.nojo.bizDomain.ClassListVO;
import org.nojo.domain.ClassVO;
import org.nojo.domain.CourseVO;
import org.nojo.domain.MemberVO;
import org.nojo.util.Criteria;

public interface AcademyMapper {

	//도메인체크
	@Select("select count(clz_domain) from tbl_class where clz_domain=#{domain}")  //1이면 사용불가능 0이면 사용가능
	public int countDomain(String domain);
	
	//수업리스트
	@Select("select * from tbl_class order by clz_reg_date desc limit #{first}, #{perPageNum}")
	public List<ClassListVO> selectClass(Criteria cri);
	
	//수업 토탈갯수
	@Select("select count(clz_domain) from tbl_class")
	public int selectClassTotalCnt();
	
	//수업별(도메인별) 선생님 정보
	@Select("select tbl_member.mem_id,tbl_member.mem_name from tbl_course join tbl_member on tbl_course.mem_id = tbl_member.mem_id where tbl_course.clz_domain=#{domain} and tbl_member.mem_gb='member_teacher'")
	public List<MemberVO> selectClassTeacher(String domain);
	
	//수업생성
	@Insert("Insert into tbl_class (clz_domain, clz_name, clz_room, clz_start_date, clz_end_date, clz_state) values (#{clz_domain}, #{clz_name}, #{clz_room}, #{clz_start_date}, #{clz_end_date}, #{clz_state})")
	public void insertClass(ClassVO vo);
	
	//수업에 선생님 참여
	@Insert("Insert into tbl_course (clz_domain, mem_id, course_state, course_gb) values (#{clz_domain}, #{mem_id}, #{course_state}, #{course_gb})")
	public void insertCourse(CourseVO vo);
	
	//선생님전체리스트
	@Select("select mem_id, mem_name, mem_reg_date, mem_email, mem_tel from tbl_member where mem_gb='member_teacher' order by mem_reg_date desc limit #{first}, #{perPageNum} ")
	public List<MemberVO> selcetTeacher(Criteria cri);
	
	//선생님 토탈수
	@Select("select count(mem_gb) from tbl_member where mem_gb='member_teacher'")
	public int selectTeacherTotalCnt() throws Exception;
	

	
	
	
	//수업에 담당선생님들 삭제
	@Delete("Delete form tbl_course where clz_domain=domain and course_gb='member_teacher'")
	public void deleteCourse(String domain);

	//수업수정
	@Update("update tbl_class set clz_name=#{clz_name}, clz_room=#{clz_room}, clz_start_date=#{clz_start_date}, clz_end_date=#{clz_end_date}, clz_state=#{clz_state} where clz_domain=#{clz_domain}")
	public void updateClass(ClassVO vo);
	
	//참고
	@Update("update tbl_attach set bno=#{bno} where fno=#{fno}")
	public void updateBno(@Param("fno") int fno,@Param("bno") int bno);
}
