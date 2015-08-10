package org.nojo.service;

import java.util.List;

import org.nojo.domain.AnswerVO;
import org.nojo.util.Criteria;

public interface AnswerService {

	//답변글 등록
	public void addAnswer(AnswerVO vo) throws Exception;

	//답변글 리스트 조회
	public List<AnswerVO> getAllAnswers(String domain, Integer no, Criteria cri) throws Exception;

	
	//답변글 수정
	public void modifyAnswer(AnswerVO vo) throws Exception;

	
	//답변글 삭제
	public void removeAnswer(Integer answer_no) throws Exception;

	
	//답변글 개수 조회
	public int getCntList(Integer no) throws Exception;

	
	//답변글 조회
	public AnswerVO readAnswer(Integer no, String domain, Integer rno) throws Exception;
	
	
	//답변 추천 개수 조회 (미구현)
	public void voteRecommend(AnswerVO vo) throws Exception;

}
