package org.nojo.service;

import javax.inject.Inject;

import org.nojo.domain.AttachfileVO;
import org.nojo.domain.FilemanagerVO;
import org.nojo.mapper.AttachFileMapper;
import org.springframework.stereotype.Service;


@Service
public class AttachFileServiceImpl implements AttachFileService {

	
	@Inject
	private AttachFileMapper mapper;
	
	@Override
	public void addAttachFile(AttachfileVO vo) throws Exception {

		mapper.addAttach(vo);
	}

	@Override
	public void addAttachFileBoard(FilemanagerVO vo) throws Exception {

		mapper.addAttachBoard(vo);
	}

	@Override
	public void removeAttach(int attachfile_no) throws Exception {
		
		mapper.deleteAttach(attachfile_no);
		
	}

	@Override
	public void removeAttachQuestionBoard(int question_no) throws Exception {

		mapper.deleteQuestionAttachBoard(question_no);
	}

	@Override
	public void removeAttachAnswerBoard(int answer_no) throws Exception {

		mapper.deleteAnswerAttachBoard(answer_no);
	}


}
