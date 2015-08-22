package org.nojo.service;

import java.util.List;

import javax.inject.Inject;

import org.nojo.bizDomain.JoinMemberVO;
import org.nojo.domain.MemberVO;
import org.nojo.mapper.MemberMapper;
import org.nojo.util.Criteria;
import org.nojo.util.SearchCriteria;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberMapper memberMapper;

	
	public List<MemberVO> getTeacherList(SearchCriteria cri) throws Exception {
		return memberMapper.selcetTeacher(cri);
	}

	public int getTeacherTotalCnt(SearchCriteria cri) throws Exception {
		return memberMapper.selectTeacherTotalCnt(cri);
	}
	
	public List<JoinMemberVO> getMemberByDomain(Criteria cri, String domain){
		return memberMapper.selcetMemberByDomain(cri, domain);
	}
	
	public int getTotalCntByDomain(String domain){
		return memberMapper.selectTotalCntByDomain(domain);
	}

	@Override
	public void signIn(MemberVO vo) throws Exception {
		memberMapper.signIn(vo);
	}


}
