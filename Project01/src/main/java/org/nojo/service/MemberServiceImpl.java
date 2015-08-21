package org.nojo.service;

import java.util.List;

import javax.inject.Inject;

import org.nojo.bizDomain.JoinMemberVO;
import org.nojo.domain.MemberVO;
import org.nojo.mapper.MemberMapper;
import org.nojo.util.Criteria;
import org.nojo.util.Search;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberMapper membermapper;

	
	public List<MemberVO> getTeacherList(Criteria cri, Search scri) throws Exception {
		return membermapper.selcetTeacher(cri, scri);
	}

	public int getTeacherTotalCnt(Search scri) throws Exception {
		return membermapper.selectTeacherTotalCnt(scri);
	}
	
	
	public List<JoinMemberVO> getMemberByDomain(Criteria cri, String domain){
		return membermapper.selcetMemberByDomain(cri, domain);
	}
	
	public int getTotalCntByDomain(String domain){
		return membermapper.selectTotalCntByDomain(domain);
	}
	
	

	@Override
	public void signIn(MemberVO vo) throws Exception {
		membermapper.signIn(vo);
	}


}
