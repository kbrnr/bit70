package org.nojo.service;

import java.util.List;

import org.nojo.bizDomain.JoinMemberVO;
import org.nojo.domain.MemberVO;
import org.nojo.util.Criteria;
import org.nojo.util.Search;

public interface MemberService {
	
	public List<MemberVO> getTeacherList(Criteria cri, Search scri) throws Exception;
	
	public int getTeacherTotalCnt(Search scri) throws Exception;
	
	public void signIn(MemberVO vo) throws Exception;
	
	public List<JoinMemberVO> getMemberByDomain(Criteria cri, String domain);
	
	public int getTotalCntByDomain(String domain);
}
