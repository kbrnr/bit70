package org.nojo.service;

import java.util.List;

import org.nojo.domain.MemberVO;
import org.nojo.util.Criteria;

public interface MemberService {
	
	public List<MemberVO> getTeacherList(Criteria cri) throws Exception;
	
	public int getTeacherTotalCnt() throws Exception;
	
}
