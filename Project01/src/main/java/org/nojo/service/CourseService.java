package org.nojo.service;

import java.util.List;

import org.nojo.bizDomain.JoinMemberVO;
import org.nojo.domain.CourseVO;
import org.nojo.util.SearchCriteria;

public interface CourseService {

	public List<JoinMemberVO> getMemberByDomain(SearchCriteria cri, String domain);
	
	public int getTotalCntByDomain(SearchCriteria cri, String domain);
	
	public void setCourse(CourseVO vo);
	
	public void setCourseOK(CourseVO vo);

	public CourseVO getCourse(String domain, String mem_id);
	
}