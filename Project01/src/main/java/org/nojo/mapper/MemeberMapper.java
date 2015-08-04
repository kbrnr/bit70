package org.nojo.mapper;

import org.apache.ibatis.annotations.Select;
import org.nojo.domain.MemberVO;

public interface MemeberMapper {
	
	@Select("select * from tbl_member where mem_id=#{name}")
	public MemberVO findUserById(String name);
}
