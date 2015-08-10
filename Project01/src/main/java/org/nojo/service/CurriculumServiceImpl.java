package org.nojo.service;

import java.util.ArrayList;
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
    //딜리트 로직
    
    Map<Integer, Integer> work = null;
    for (CurriculumVO vo : list) {
      Integer depth = vo.getCurri_depth();
      if(depth == 1){
        work = new HashMap<>();
      }else{
        vo.setCurri_pno(work.get(depth-2));
      }
      curriculumMapper.add(vo, domain);
      work.put(depth-1, vo.getCurri_no());
    }
  }
  /*
   if (depth == 1) {
        work = [];
        list.push(curri);
    } else {
        if (!work[depth - 2].children) {
            work[depth - 2].children = [];
        }
        work[depth - 2].children.push(curri);
    }
   
   */
}
