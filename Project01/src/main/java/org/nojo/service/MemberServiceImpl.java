package org.nojo.service;

import javax.inject.Inject;

import org.nojo.domain.MemberVO;
import org.nojo.mapper.MemberMapper;
import org.nojo.security.CustomUser;
import org.nojo.security.SecurityUtil;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberMapper memberMapper;

	@Override
	public void signIn(MemberVO vo) throws Exception {
		memberMapper.signIn(vo);
	}

	@Override
	public MemberVO personalInfo(String mem_id) throws Exception {
		return memberMapper.personalInfo(mem_id); 
	}
	
	@Override
	public void personalInfoModify(MemberVO vo) throws Exception {
		memberMapper.personalInfoModify(vo);
	}
}
