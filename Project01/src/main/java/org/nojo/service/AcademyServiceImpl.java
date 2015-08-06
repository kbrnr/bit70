package org.nojo.service;

import java.util.List;

import javax.inject.Inject;

import org.nojo.bizDomain.ClassFormVO;
import org.nojo.domain.ClassVO;
import org.nojo.domain.MemberVO;
import org.nojo.mapper.AcademyMapper;
import org.nojo.util.Criteria;
import org.springframework.stereotype.Service;

@Service
public class AcademyServiceImpl implements AcademyService {
	
	@Inject
	private AcademyMapper acdmMapper;

	public void makeClass(ClassFormVO vo){
		System.out.println("@Service:"+ vo.toString());
		//class저장
		//clz_domain=java99999,
		//clz_name=자바9999,    
		//clz_room=903호,
		//clz_start_date=Mon Sep 07 00:00:00 KST 2015,
		//clz_end_date=Thu Sep 15 00:00:00 KST 2005,
		//clz_state=2
		//clz_reg_date=?(now)
		
		//선생님참가 반복 
		//for
		//mem_id=[user02, user122, user121],	
		//clz_domain=java99999,
		//course_state=?(가입완료)
		//course_gb=?선생님
		//course_reg_date=?(now)
		
		
	}
	
	public List<ClassVO> getClassList(Criteria cri) {
		return acdmMapper.selectClass(cri);
	}
	
	public int getClassTotalCnt() {
		return acdmMapper.selectClassTotalCnt();
	}
	
	public List<MemberVO> getTeacherList(Criteria cri) throws Exception {
		return acdmMapper.selcetTeacher(cri);
	}

	public int getTeacherTotalCnt() throws Exception {
		return acdmMapper.selectTeacherTotalCnt();
	}
}
