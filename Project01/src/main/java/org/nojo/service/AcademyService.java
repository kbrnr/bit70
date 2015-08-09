package org.nojo.service;

import java.util.List;

import org.nojo.bizDomain.ClassListVO;
import org.nojo.domain.ClassVO;
import org.nojo.domain.MemberVO;
import org.nojo.util.Criteria;

public interface AcademyService {

	public Boolean domainCheck(String domain);
	
	public void makeClass(ClassVO vo, String[] mem_ids);
	
	public List<ClassListVO> getClassList(Criteria cri);
	
	public int getClassTotalCnt();
	
	public List<MemberVO> getTeacherList(Criteria cri) throws Exception;
	
	public int getTeacherTotalCnt() throws Exception;
	
}
