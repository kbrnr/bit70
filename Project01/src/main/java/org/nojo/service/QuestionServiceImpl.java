package org.nojo.service;

import java.util.List;

import javax.inject.Inject;

import org.nojo.domain.QuestionVO;
import org.nojo.mapper.QuestionMapper;
import org.nojo.util.Criteria;
import org.nojo.util.Search;
import org.springframework.stereotype.Service;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Inject
	private QuestionMapper mapper;
	
	@Override
	public void addQuestion(QuestionVO vo) throws Exception {

		mapper.create(vo);
		
	}

	@Override
	public List<QuestionVO> listQuestion(String domain, Criteria cri) throws Exception {
		return mapper.listPage(domain, cri) ;
	}

	@Override
	public void modifyQuestion(QuestionVO vo) throws Exception {
		
		mapper.update(vo);
	}

	@Override
	public void removeQuestion(int no) throws Exception {

		mapper.delete(no);
	}

	@Override
	public int getCnt(String domain) throws Exception {
		return mapper.getTotalCnt(domain);
	}

	@Override
	public QuestionVO getReadQuestion(int no) throws Exception {
		
		return mapper.readBoard(no);
	}

	@Override
	public int getSearchCnt(String domain, Search search) throws Exception {
		
		return mapper.getSearchCnt(domain, search);
	}

	@Override
	public List<QuestionVO> searchQuestion(String domain, Criteria cri, Search search) throws Exception {

		return mapper.searchPage(domain, cri, search);
	}


	
}
