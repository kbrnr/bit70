package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.nojo.bizDomain.JoinMemberVO;
import org.nojo.domain.MemberVO;
import org.nojo.util.Criteria;

public interface MemberMapper {
	
	@Select("select * from tbl_member where mem_id=#{name}")
	public MemberVO findUserById(String name);
	
	//수업별(도메인별) 선생님 리스트
	@Select("select tbl_member.mem_id,tbl_member.mem_name from tbl_course join tbl_member on tbl_course.mem_id = tbl_member.mem_id where tbl_course.clz_domain=#{domain} and tbl_member.mem_gb='member_teacher'")
	public List<MemberVO> selectTeacherByDomain(String domain);	
	
	//선생님전체리스트
	@Select("select mem_id, mem_name, mem_reg_date, mem_email, mem_tel from tbl_member where mem_gb='member_teacher' order by mem_reg_date desc limit #{first}, #{perPageNum} ")
	public List<MemberVO> selcetTeacher(Criteria cri);
	
	//선생님 토탈수
	@Select("select count(mem_gb) from tbl_member where mem_gb='member_teacher'")
	public int selectTeacherTotalCnt() throws Exception;

	//수업별 학생 리스트
	@Select("select mem_id, mem_name, mem_reg_date, mem_email, mem_tel from tbl_member where tbl_member. mem_gb='member_student' or 'mem_gb='member_clz_president' order by mem_reg_date desc limit #{cri.first}, #{cri.perPageNum} ")
	public List<MemberVO> selcetStudentByDomain(@Param("cri") Criteria cri, @Param("domain") String domain);
		
	//수업별 참여인원
	@Select("select * from tbl_course c, tbl_member m where c.mem_id = m.mem_id and c.clz_domain = #{domain} limit #{cri.first}, #{cri.perPageNum} ")
	public List<JoinMemberVO> selcetMemberByDomain(@Param("cri") Criteria cri, @Param("domain") String domain);

	//수업별 참여인원 토탈수
	@Select("select count(c.mem_id) from tbl_course c, tbl_member m where c.mem_id = m.mem_id and c.clz_domain = #{domain}")
	public int selectTotalCntByDomain(String domain);
		
	//회원가입
	@Insert("insert into tbl_member(mem_id, mem_name, mem_pw, mem_photo) values(#{mem_id}, #{mem_name}, #{mem_pw}, #{mem_photo})")
	public void signIn(MemberVO vo) throws Exception;
	
}
