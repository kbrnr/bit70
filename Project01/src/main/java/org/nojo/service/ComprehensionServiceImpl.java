package org.nojo.service;

import java.util.List;

import javax.inject.Inject;

import org.nojo.mapper.ComprehensionMapper;
import org.springframework.stereotype.Service;

@Service
public class ComprehensionServiceImpl implements ComprehensionService{

	@Inject		//주입
	private ComprehensionMapper mapper;
	
	@Override
	public List<String> listName(String name) throws Exception {
		return mapper.listName(name);
	}

	@Override
	public List<String> listQuestion(String question) throws Exception{
		return mapper.listQuestion(question);
	}
	
	@Override
	public List<String> listScore(int questionNo, String score) throws Exception{
		return mapper.listScore(questionNo, score); 
	}
	
	
}
