package org.nojo.service;

import java.util.List;

public interface ComprehensionService {

	public List<String> listName(String name) throws Exception;
	
	public List<String> listQuestion(String question) throws Exception;
	
	public List<String> listScore(int questionNo, String score) throws Exception;
	
}
