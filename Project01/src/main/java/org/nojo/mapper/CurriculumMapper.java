package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.nojo.domain.CurriculumVO;

public interface CurriculumMapper {
	
	@Select("select curri_name, curri_pno, curri_depth, curri_reg_date, curri_mod_date, clz_domain, mem_id from tbl_curriculum")
	public List<CurriculumVO> listCurriculum(CurriculumVO vo) throws Exception;
}
