package org.nojo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.nojo.domain.CurriculumVO;
import org.nojo.mapper.CurriculumMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CurriculumServiceImpl implements CurriculumService {

	@Inject
	private CurriculumMapper curriculumMapper;

	public List<CurriculumVO> list(String domain) {
		return curriculumMapper.list(domain);
	}

	@Override
	@Transactional
	public void edit(List<CurriculumVO> list, String domain) {
		
		Map<Integer, Integer> work = null;
		for (CurriculumVO vo : list) {
			System.out.println(vo);
			String mode = vo.getMode();
			if (mode == null) {
				continue;
			} else if (mode.equals("remove")) {
				curriculumMapper.delete(vo.getCurri_no());
			} else if (mode.equals("modify")) {
				curriculumMapper.update(vo);
			} else {
				if(vo.getCurri_pno() != 0){
					curriculumMapper.insert(vo, domain);
					continue;
				}
				int depth = vo.getCurri_depth();
				if (depth == 1) {
					work = new HashMap<>();
				} else {
					vo.setCurri_pno(work.get(depth - 1));
				}
				curriculumMapper.insert(vo, domain);
				work.put(depth, vo.getCurri_no());
			}
		}
	}
	
}
