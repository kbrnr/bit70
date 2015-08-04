package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.nojo.domain.QuestionVO;

public interface QuestionMapper {

	// 게시글 생성
	@Insert("insert into tbl_question (question_title, question_content, question_gb, clz_domain, mem_id) "
			+ "values (#{question_title},#{question_content}, #{question_gb} , #{clz_domain}, #{mem_id}")
	public void create(QuestionVO vo) throws Exception;

	
	public List<QuestionVO> listPage() throws Exception;

	public void update(QuestionVO vo) throws Exception;

	public void delete(int question_no) throws Exception;

	public int getTotalCnt() throws Exception;

	public QuestionVO readBoard(int Question_bno) throws Exception;
	
	public void updateAnsCnt(int Question_bno) throws Exception;
	
	public int getSearchCnt() throws Exception;	
	
	// reply
	/*
	 * 
	 * public List<BoardVO> listPage(Criteria cri) throws Exception;
	 * 
	 * 
	 * 
	 * // 게시글 총 갯수 조회 ps. 추후 추가로 주석달아보자.
	 * 
	 * @Select("select count(bno) from tbl_board where bno > 0 and bno < 1000")
	 * public int getTotalCount() throws Exception;
	 * 
	 * // 게시글 한 개를 조회, parameter로 게시글의 번호 bno를 받아 조회한다.
	 * 
	 * @Select(
	 * "select bno, title,content,writer from tbl_board where bno = #{bno}")
	 * public BoardVO readBoard(int bno) throws Exception;
	 * 
	 * // 게시글에 댓글이 하나 달릴때, 게시글의 댓글 총 개수
	 * 
	 * @Update("update tbl_board set replycnt = replycnt +1 where bno = #{bn0}")
	 * public void updateReplyCnt(int bno) throws Exception;
	 * 
	 * // 게시글 조회 // ${search.searchKey} $를 사용하였을때..Injection 공격을 방지해야대... // ' '
	 * 을 제거..해야대... %를 사용하였을때 ' 를 잘 써야돼.. public List<BoardVO>
	 * searchPage(@Param("cri") Criteria cri,
	 * 
	 * @Param("search") Search search) throws Exception;
	 * 
	 * // 검색 결과 총 개수 public int getSearchCount(Search search) throws Exception;
	 */

}
