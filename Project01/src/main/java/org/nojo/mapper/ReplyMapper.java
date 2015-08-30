package org.nojo.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
import org.nojo.domain.ReplyVO;

public interface ReplyMapper {
	
	@Insert("insert into tbl_reply (reply_content, comprehension_no) values(#{reply_content}, #{comprehension_no})")
	public void insertReply(ReplyVO vo) ;
	
	@Update("update tbl_comprehension set comprehension_replycnt = comprehension_replycnt + 1 where comprehension_no = #{comprehension_no}")
	public void updateReplyCnt(ReplyVO vo) ;

	

}
