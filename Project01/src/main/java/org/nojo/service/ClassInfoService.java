package org.nojo.service;

import java.util.List;

import org.nojo.bizDomain.ClassListVO;
import org.nojo.domain.ClassVO;
import org.nojo.util.Criteria;

public interface ClassInfoService {

	public boolean domainCheck(String domain) ;
	
	public void makeClass(ClassVO classVO, String[] mem_ids) ;
	
	public List<ClassListVO> getClassList(Criteria cri) ;

	public int getClassTotalCnt();

	public List<ClassListVO> getClassListByID(String mem_id, Criteria cri);

	public int getClassListTotalCntByID(String mem_id);
	
	public int getClassListByID(String mem_id);
	
	public ClassListVO getClassOne(String clz_no);

}
