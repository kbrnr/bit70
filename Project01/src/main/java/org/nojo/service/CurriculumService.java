package org.nojo.service;

import java.util.List;

import org.nojo.domain.CurriculumVO;

public interface CurriculumService {

	public List<CurriculumVO> listCurriculum(CurriculumVO vo) throws Exception;
}
