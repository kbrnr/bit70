package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.nojo.domain.AnswerVO;
import org.nojo.util.Criteria;

public interface AnswerMapper {
	
	//답변 글 작성
	@SelectKey(keyColumn="answer_no" ,  keyProperty="answer_no", before=false, resultType = Integer.class, statement = {"select last_insert_id()" })
	@Insert("insert into tbl_answer(question_no, answer_title, answer_content, answer_visible, clz_domain, mem_id) "
			+ "values (#{question_no}, #{answer_title}, #{answer_content}, #{answer_visible}, #{clz_domain}, #{mem_id})")
	public void create(AnswerVO vo) throws Exception;

	// AnswerMapper.xml
	//답변글 리스트 조회
	public List<AnswerVO> listAns(@Param("domain") String domain, @Param("no") Integer bno, @Param("cri") Criteria cri) throws Exception;

	
	//답변글 수정
	@Update("update tbl_answer set "
								+ "answer_title = #{answer_title}, "
								+ "answer_content = #{answer_content}, "
								+ "answer_visible = #{answer_visible}, "
								+ "answer_reg_date = now() "
								+ "where answer_no = #{answer_no}")
	public void update(AnswerVO vo) throws Exception;

	
	//답변글 삭제
	@Delete("delete from tbl_answer where answer_no = #{answer_no}")
	public void delete(Integer answer_no) throws Exception;

	//답변글 개수 조회
	// AnswerMapper.xml
	public int getTotalCnt(Integer no) throws Exception;

	
	//답변글 조회
	@Select("select answer_no, question_no, answer_title, answer_content, answer_visible, answer_reg_date, clz_domain, mem_id "
								+ "from tbl_answer "
								+ "where question_no = #{no} "
								+ "and clz_domain = #{domain} " 
								+ "and answer_no = #{rno} ")
	public AnswerVO readAns(@Param("no") Integer no, @Param("domain") String domain, @Param("rno") Integer rno) throws Exception;
	
	
	//추천
	@Update("update tbl_answer set "
								+ "answer_recommend = answer_recommend +1 "
								+ "where answer_no = #{no}")
	public void UpdateReCommend(Integer no) throws Exception;

}
