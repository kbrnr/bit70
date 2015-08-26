package org.nojo.service;

import java.util.List;

import org.nojo.bizDomain.ClassListVO;
import org.nojo.domain.ClassVO;
import org.nojo.util.SearchCriteria;

public interface ClassInfoService {

	public boolean domainCheck(String domain) ;
	
	public void makeClass(ClassVO classVO, String[] mem_ids) ;
	
	public List<ClassListVO> getClassList(SearchCriteria cri) ;

	public List<ClassListVO> getClassListJoin(SearchCriteria cri, String userid);
	
	public int getClassTotalCnt(SearchCriteria cri);

	public List<ClassListVO> getClassListByID(String mem_id, SearchCriteria cri);

	public int getClassListTotalCntByID(String mem_id, SearchCriteria cri) ;
	
	public ClassListVO getClassOne(String clz_no);

	public void modifyClass(ClassVO vo, String[] mem_ids);
	

}
