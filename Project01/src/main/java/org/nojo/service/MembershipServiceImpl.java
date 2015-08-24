package org.nojo.service;

import java.util.List;

import javax.inject.Inject;

import org.nojo.domain.MemberVO;
import org.nojo.mapper.MembershipMapper;
import org.nojo.util.SearchCriteria;
import org.springframework.stereotype.Service;

@Service
public class MembershipServiceImpl implements MembershipService {

	@Inject
	private MembershipMapper membershipMapper;
	
	public List<MemberVO> getTeacherList(SearchCriteria cri) throws Exception {
		return membershipMapper.selcetTeacher(cri);
	}

	public int getTeacherTotalCnt(SearchCriteria cri) throws Exception {
		return membershipMapper.selectTeacherTotalCnt(cri);
	}
	
}
