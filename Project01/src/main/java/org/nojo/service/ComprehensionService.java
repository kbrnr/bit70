package org.nojo.service;

import java.util.List;
import java.util.Map;

import org.nojo.bizDomain.TQuestionScoreListVO;
import org.nojo.domain.ComprehensionVO;
import org.nojo.domain.TeacherquestionVO;

public interface ComprehensionService {

	public List<String> listName(String name) throws Exception;
	
	public List<String> listQuestion(String question) throws Exception;
	
	public List<String> listScore(String score) throws Exception;
	
	public int registQuestion(String domain, TeacherquestionVO vo) throws Exception;

	public int registComprehension(ComprehensionVO vo) throws Exception;

	/////tmp
	//public HashMap<String, Object> getComprehension(String domain) throws Exception;

	public List<TQuestionScoreListVO> getComprehension(String domain) throws Exception;
}
