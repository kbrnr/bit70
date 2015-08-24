package org.nojo.service;

import java.util.List;

import org.nojo.domain.MemberVO;
import org.nojo.util.SearchCriteria;

public interface MembershipService {

	public List<MemberVO> getTeacherList(SearchCriteria cri) throws Exception ;

	public int getTeacherTotalCnt(SearchCriteria cri) throws Exception ;
	
}
