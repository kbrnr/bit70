package org.nojo.service;

import java.util.List;

import org.nojo.domain.AnswerVO;
import org.nojo.util.Criteria;

public interface AnswerService {

	public void addAnswer(AnswerVO vo) throws Exception;

	public List<AnswerVO> getAllAnswers(String domain, Integer no, Criteria cri) throws Exception;

	public void modifyAnswer(AnswerVO vo) throws Exception;

	public void removeAnswer(Integer answer_no) throws Exception;

	public int getCntList(Integer no) throws Exception;

	public AnswerVO readAnswer(Integer no, String domain, Integer rno) throws Exception;
	
	public void voteRecommend(AnswerVO vo) throws Exception;

}
