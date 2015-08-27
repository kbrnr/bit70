package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.nojo.domain.QuestionVO;
import org.nojo.util.Criteria;
import org.nojo.util.Search;

public interface QuestionMapper {

	// 게시글 생성
	@SelectKey(keyColumn="question_no" ,  keyProperty="question_no", before=false, resultType = Integer.class, statement = {"select last_insert_id()" })
	@Insert("insert into tbl_question(question_title, question_content, question_gb, question_visible ,clz_domain, mem_id) "
								+ "values "
								+ "(#{question_title}, "
								+ "#{question_content}, "
								+ "#{question_gb}, "
								+ "#{question_visible}, "
								+ "#{clz_domain}, "
								+ "#{mem_id})")
	public void create(QuestionVO vo) throws Exception;

	//게시글 리스트
	//QuestionMapper.xml
	public List<QuestionVO> listPage(@Param("domain") String domain, @Param("cri") Criteria cri ) throws Exception;

	//게시글 업데이트
	@Update("update tbl_question "
								+ "set "
								+ "question_title= #{question_title} , "
								+ "question_content= #{question_content}, "
								+ "question_reg_date= now(), "
								+ "question_visible = #{question_visible} "
								+ "where "
								+ "question_no = #{question_no}")
	public void update(QuestionVO vo) throws Exception;

	//게시글 삭제
	@Delete("delete from tbl_question "
								+ "where "
								+ "question_no = #{no}")
	public void delete(int no) throws Exception;

	//게시글 개수
/*	@Select("select count(question_no) "
					+ "from tbl_question "
					+ "where clz_domain "
					+ "like #{domain}")*/
	public int getTotalCnt(String domain) throws Exception;

	//게시글 조회
	@Select("select question_no, question_title, question_content, question_visible, mem_id, clz_domain, question_reg_date "
								+ "from tbl_question "
								+ "where question_no = #{no}")
	public QuestionVO readBoard(int no) throws Exception;
	
	//게시글 검색 조회 리스트
	//QuestionMapper.xml
	public List<QuestionVO> searchPage(@Param("domain") String domain, @Param("cri") Criteria cri, @Param("search") Search search) throws Exception;
	
	//검색 결과 개수
	//QuestionMapper.xml
	public int getSearchCnt(@Param("domain") String domain, @Param("search") Search search) throws Exception;	
	

}
