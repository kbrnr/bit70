package org.nojo.service;

import java.util.List;

import javax.inject.Inject;

import org.nojo.domain.MemberVO;
import org.nojo.mapper.MemberMapper;
import org.nojo.util.Criteria;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberMapper membermapper;

	
	public List<MemberVO> getTeacherList(Criteria cri) throws Exception {
		return membermapper.selcetTeacher(cri);
	}

	public int getTeacherTotalCnt() throws Exception {
		return membermapper.selectTeacherTotalCnt();
	}

	@Override
	public void signIn(MemberVO vo) throws Exception {
		membermapper.signIn(vo);
	}
}
