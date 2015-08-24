package org.nojo.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.nojo.domain.MemberVO;

public interface MemberMapper {
	
	@Select("select * from tbl_member where mem_id=#{name}")
	public MemberVO findUserById(String name);
	
	//회원가입
	@Insert("insert into tbl_member(mem_id, mem_name, mem_pw, mem_photo) values(#{mem_id}, #{mem_name}, #{mem_pw}, #{mem_photo})")
	public void signIn(MemberVO vo) throws Exception;
	
	//회원정보보기
	@Select("select mem_id, mem_pw, mem_name, mem_email, mem_tel from tbl_member where mem_id=#{mem_id}")
	public MemberVO personalInfo(String mem_id) throws Exception;
	
	//회원정보수정
	public void personalInfoModify(MemberVO vo)throws Exception;
	
}
