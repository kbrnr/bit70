package org.nojo.service;

import java.util.List;

import javax.inject.Inject;

import org.nojo.domain.AnswerVO;
import org.nojo.mapper.AnswerMapper;
import org.nojo.util.Criteria;
import org.springframework.stereotype.Service;

@Service
public class AnswerServiceImpl implements AnswerService {

	@Inject
	private AnswerMapper mapper;

	@Override
	public void addAnswer(AnswerVO vo) throws Exception {

		mapper.create(vo);
	}

	@Override
	public List<AnswerVO> getAllAnswers(String domain, Integer no, Criteria cri) throws Exception {

		return mapper.listAns(domain, no, cri);
	}

	@Override
	public void modifyAnswer(AnswerVO vo) throws Exception {

		mapper.update(vo);
	}

	@Override
	public void removeAnswer(Integer answer_no) throws Exception {

		mapper.delete(answer_no);
	}

	@Override
	public int getCntList(Integer no) throws Exception {

		return mapper.getTotalCnt(no);
	}

	@Override
	public AnswerVO readAnswer(Integer no, String domain, Integer rno) throws Exception {

		return mapper.readAns(no, domain, rno);
	}

	@Override
	public void voteRecommend(AnswerVO vo) throws Exception {

		mapper.UpdateReCommend(vo);
	}

}
