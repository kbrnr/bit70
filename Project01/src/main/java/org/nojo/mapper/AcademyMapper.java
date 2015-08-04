package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.nojo.domain.MemberVO;

public interface AcademyMapper {

	@Select("SELECT * FROM project01.tbl_member WHERE mem_gb='member_teacher'")
	public List<MemberVO> selectTeacherList();	
}
