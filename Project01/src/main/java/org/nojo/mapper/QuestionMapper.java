package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.nojo.domain.QuestionVO;
import org.nojo.util.Criteria;
import org.nojo.util.Search;

public interface QuestionMapper {

	// 게시글 생성
	@Insert("insert into tbl_question(question_title, question_content, question_gb, clz_domain, mem_id) "
			+ "values (#{question_title}, #{question_content}, #{question_gb}, #{clz_domain}, #{mem_id})")
	public void create(QuestionVO vo) throws Exception;

	//게시글 리스트
	@Select("set @rownum=0;"
			+ "select @rownum:=@rownum+1 as rownum, question_title, question_content, mem_id , question_reg_date, question_visible "
					+ "from tbl_question "
					+ "where clz_domain like #{clz_domain} "
					+ "order by rownum desc")
	public List<QuestionVO> listPage(Criteria Cri) throws Exception;

	//게시글 업데이트
	@Update("update tbl_question "
					+ "set "
					+ "question_title= #{question_title} , "
					+ "question_content= #{question_content}, "
					+ "question_reg_date= now(), "
					+ "question_visible = #{question_visible} "
					+ "where"
					+ "question_no = #{question_no};")
	public void update(QuestionVO vo) throws Exception;

	//게시글 삭제
	@Delete("delete from tbl_question "
					+ "where "
					+ "question_no = #{question_no}")
	public void delete(int question_no) throws Exception;

	//게시글 개수
	@Select("select count(question_no) "
					+ "from tbl_question "
					+ "where clz_domain "
					+ "like #{clz_domain}")
	public int getTotalCnt() throws Exception;

	//게시글 조회
	@Select("select question_no, question_title, question_content, mem_id"
					+ "from tbl_question "
					+ "where question_no = #{question_no}")
	public QuestionVO readBoard(int Question_bno) throws Exception;
	
	//게시글 검색 조회 리스트
	public List<QuestionVO> serachPage(@Param("cri") Criteria cri, 
									@Param("search") Search search) throws Exception;
	
	//검색 결과 개수
	public int getSearchCnt(Search search) throws Exception;	
	

	/*
	// ${search.searchKey} $를 사용하였을때..Injection 공격을 방지해야대...
	// ' ' 을 제거..해야대... %를 사용하였을때 ' 를 잘 써야돼..
	public List<BoardVO> searchPage(@Param("cri") Criteria cri,
			@Param("search") Search search) throws Exception;

	// 검색 결과 총 개수
	public int getSearchCount(Search search) throws Exception;
	*/
}
