package org.nojo.service;

import java.util.List;

import javax.inject.Inject;

import org.nojo.domain.CurriculumVO;
import org.nojo.mapper.CurriculumMapper;

public class CurriculumServiceImpl {

	@Inject		//주입
	CurriculumMapper curriculumMapper;
	
	public List<CurriculumVO> listCurriculum(CurriculumVO vo) throws Exception{
		return curriculumMapper.listCurriculum(vo);
	}
}
