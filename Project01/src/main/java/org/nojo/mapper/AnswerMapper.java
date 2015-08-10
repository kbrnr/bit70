package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.nojo.domain.AnswerVO;
import org.nojo.util.Criteria;

public interface AnswerMapper {

	@Insert("insert into tbl_answer(question_no, answer_title, answer_content, answer_visible, clz_domain, mem_id) "
			+ "values (#{question_no}, #{answer_title}, #{answer_content}, #{answer_visible}, #{clz_domain}, #{mem_id})")
	public void create(AnswerVO vo) throws Exception;

	// AnswerMapper.xml
	public List<AnswerVO> listAns(@Param("domain") String domain, @Param("no") Integer bno, @Param("cri") Criteria cri) throws Exception;

	@Update("update tbl_answer "
								+ "set "
								+ "answer_title = #{answer_title}, "
								+ "answer_content = #{answer_content}, "
								+ "answer_reg_date = now() "
								+ "where answer_no = #{answer_no}")
	public void update(AnswerVO vo) throws Exception;

	@Delete("delete from tbl_answer where answer_no = #{answer_no}")
	public void delete(Integer answer_no) throws Exception;

	// AnswerMapper.xml
	public int getTotalCnt(Integer no) throws Exception;

	@Select("select answer_no, question_no, answer_title, answer_content, answer_reg_date, clz_domain, mem_id "
								+ "from tbl_answer "
								+ "where question_no = #{no} "
								+ "and clz_domain = #{domain} " 
								+ "and answer_no = #{rno} ")
	public AnswerVO readAns(@Param("no") Integer no, @Param("domain") String domain, @Param("rno") Integer rno) throws Exception;
	
	
	@Update("update tbl_answer "
								+ "set "
								+ "answer_recommend = #{answer_recommend} "
								+ "where answer_no = #{answer_no}")
	public void UpdateReCommend(AnswerVO vo) throws Exception;

}
