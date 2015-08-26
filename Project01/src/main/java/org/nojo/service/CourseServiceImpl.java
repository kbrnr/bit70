package org.nojo.service;

import java.util.List;

import javax.inject.Inject;

import org.nojo.bizDomain.JoinMemberVO;
import org.nojo.domain.CourseVO;
import org.nojo.domain.SeatVO;
import org.nojo.mapper.CourseMapper;
import org.nojo.mapper.SeatMapper;
import org.nojo.util.SearchCriteria;
import org.springframework.stereotype.Service;

@Service
public class CourseServiceImpl implements CourseService {
	
	@Inject
	private CourseMapper courseMapper;
	
	@Inject
	private SeatMapper seatMapper;
	
	
	public List<JoinMemberVO> getMemberByDomain(SearchCriteria cri, String domain){
		return courseMapper.selcetMemberByDomain(cri, domain);
	}
	
	public int getTotalCntByDomain(SearchCriteria cri, String domain){
		return courseMapper.selectTotalCntByDomain(cri, domain);
	}
	
	
	public void setCourse(CourseVO vo){
		vo.setCourse_state(1); //[승인대기]
		vo.setCourse_gb("member_student");
		courseMapper.insertCourseStudent(vo);
	}
	
	
	public void setCourseOK(CourseVO vo){
	
		SeatVO svo = new SeatVO();
		
		vo.setCourse_state(2); //[가입완료]
		
		svo.setClz_domain(vo.getClz_domain());
		svo.setMem_id(vo.getMem_id());
		
		courseMapper.updateCourse(vo);
		seatMapper.insertSeat(svo);
		//시트에 정보넣어주기
	}
	
}
