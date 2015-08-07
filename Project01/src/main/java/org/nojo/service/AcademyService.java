package org.nojo.service;

import java.util.List;

import org.nojo.bizDomain.ClassFormVO;
import org.nojo.domain.MemberVO;
import org.nojo.util.Criteria;

public interface AcademyService {

	public void makeClass(ClassFormVO vo);
	
	public List<ClassFormVO> getClassList(Criteria cri);
	
	public int getClassTotalCnt();
	
	public List<MemberVO> getTeacherList(Criteria cri) throws Exception;
	
	public int getTeacherTotalCnt() throws Exception;
	
}
