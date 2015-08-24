package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.nojo.domain.MemberVO;
import org.nojo.util.SearchCriteria;

public interface MembershipMapper {

	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//선생님관련
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//*선생님전체리스트
public List<MemberVO> selcetTeacher(SearchCriteria cri);

//*선생님 토탈수
public int selectTeacherTotalCnt(SearchCriteria cri) throws Exception;


//수업별(도메인별) 선생님 리스트
@Select("select tbl_member.mem_id,tbl_member.mem_name from tbl_course join tbl_member on tbl_course.mem_id = tbl_member.mem_id where tbl_course.clz_domain=#{domain} and tbl_member.mem_gb='member_teacher'")
public List<MemberVO> selectTeacherByDomain(String domain);	



}
