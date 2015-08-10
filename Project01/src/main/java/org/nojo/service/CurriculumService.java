package org.nojo.service;

import java.util.List;

import org.nojo.domain.CurriculumVO;

public interface CurriculumService {

	public List<CurriculumVO> list(String domain);
	
	public void edit(List<CurriculumVO> list, String domain);
}
