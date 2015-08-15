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
import org.nojo.util.Criteria;

public interface ClassInfoMapper {
	
	//수업리스트
	@Select("select * from tbl_class order by clz_reg_date desc limit #{first}, #{perPageNum}")
	public List<ClassListVO> selectClass(Criteria cri);
	
	//수업 토탈갯수
	@Select("select count(clz_domain) from tbl_class")
	public int selectClassTotalCnt();
	
	//수업생성
	@Insert("Insert into tbl_class (clz_domain, clz_name, clz_room, clz_start_date, clz_end_date, clz_state) values (#{clz_domain}, #{clz_name}, #{clz_room}, #{clz_start_date}, #{clz_end_date}, #{clz_state})")
	public void insertClass(ClassVO vo);
	
	//수업에 담당선생님 지정
	@Insert("Insert into tbl_course (clz_domain, mem_id, course_state, course_gb) values (#{clz_domain}, #{mem_id}, #{course_state}, #{course_gb})")
	public void insertCourse(CourseVO vo);
	
	//수업에 담당선생님들 삭제
	@Delete("Delete form tbl_course where clz_domain=domain and course_gb='member_teacher'")
	public void deleteCourse(String domain);

	//수정정보 상세정보
	@Select("select * from tbl_class where tbl_class.clz_domain = #{domain}")
	public ClassListVO selectClassOne(String domain);
	
	//수업수정
	@Update("update tbl_class set clz_name=#{clz_name}, clz_room=#{clz_room}, clz_start_date=#{clz_start_date}, clz_end_date=#{clz_end_date}, clz_state=#{clz_state} where clz_domain=#{clz_domain}")
	public void updateClass(ClassVO vo);
	
	
	//아이디(담당자)별 수업리스트
	@Select("select * from tbl_course join tbl_class on tbl_course.clz_domain = tbl_class.clz_domain where tbl_course.mem_id = #{mem_id} order by clz_reg_date desc limit #{cri.first}, #{cri.perPageNum}")
	public List<ClassListVO> selectClassByID(@Param("mem_id") String mem_id, @Param("cri") Criteria cri);
	
	//아이디(담당자)별 수업 토탈갯수
	@Select("select count(tbl_course.clz_domain) from tbl_course join tbl_class on tbl_course.clz_domain = tbl_class.clz_domain where tbl_course.mem_id = #{mem_id}")
	public int selectClassTotalCntByID(String mem_id);
	
	
	//참고
	@Update("update tbl_attach set bno=#{bno} where fno=#{fno}")
	public void updateBno(@Param("fno") int fno,@Param("bno") int bno);

}
