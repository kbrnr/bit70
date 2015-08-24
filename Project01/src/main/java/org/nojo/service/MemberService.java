package org.nojo.service;

import org.nojo.domain.MemberVO;

public interface MemberService {
	
	public void signIn(MemberVO vo) throws Exception;
	
	public MemberVO personalInfo(String mem_id) throws Exception;
}
