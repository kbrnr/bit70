package org.nojo.service;

import java.util.List;

import org.nojo.domain.QuestionVO;
import org.nojo.util.Criteria;
import org.nojo.util.Search;

public interface QuestionService {
	
	//질문추가
	public void addQuestion(QuestionVO vo) throws Exception;
	
	//질문리스트
	public List<QuestionVO> listQuestion(Criteria cri) throws Exception;
	
	//질문수정
	public void modifyQuestion(QuestionVO vo) throws Exception;

	//질문삭제
	public void removeQuestion(int question_no) throws Exception;

	//리스트 개수
	public int getList() throws Exception;
	
	//질문 글 조회
	public QuestionVO getReadQuestion(int question_no) throws Exception;
	
	//질문 검색 결과 개수
	public int getSearchQuestion(Search search) throws Exception;
	
	//질문 검색 결과 리스트
	public List<QuestionVO> searchQuestion(Criteria cri, Search search) throws Exception;

}
