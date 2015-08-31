package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.nojo.bizDomain.ReplypopVO;
import org.nojo.domain.ReplyVO;

public interface ReplyMapper {
	
	@Insert("insert into tbl_reply (reply_content, comprehension_no, reply_writer) values(#{reply_content}, #{comprehension_no}, #{reply_writer})")
	public void insertReply(ReplyVO vo) ;
	
	@Update("update tbl_comprehension set comprehension_replycnt = comprehension_replycnt + 1 where comprehension_no = #{comprehension_no}")
	public void updateReplyCnt(ReplyVO vo) ;
	
	
	@Select("select r.reply_writer, m.mem_name, r.reply_content, r.reply_reg_date, c.comprehension_no, c.clz_domain from tbl_reply r, tbl_comprehension c, tbl_member m where r.comprehension_no = c.comprehension_no and r.reply_writer = m.mem_id and r.comprehension_no = #{comprehension_no}")
	public List<ReplypopVO> selectReply(int comprehension_no);

}
