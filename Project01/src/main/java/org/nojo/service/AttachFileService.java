package org.nojo.service;

import java.util.List;

import org.nojo.domain.AttachfileVO;
import org.nojo.domain.FilemanagerVO;

public interface AttachFileService {

	public void addAttachFile(AttachfileVO vo) throws Exception;
	
	public void addAttachFileBoard(FilemanagerVO vo) throws Exception;
	
	public List<String> getAttachFile(Integer no, String domain) throws Exception;
	
	public void removeAttach(int attachfile_no) throws  Exception;
	
	public void removeAttachQuestionBoard(int question_no) throws Exception;
	
	public void removeAttachAnswerBoard(int answer_no) throws Exception;
	
}
