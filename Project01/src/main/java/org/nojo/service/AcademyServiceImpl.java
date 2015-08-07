package org.nojo.service;

import java.util.List;

import javax.inject.Inject;

import org.nojo.bizDomain.ClassFormVO;
import org.nojo.domain.ClassVO;
import org.nojo.domain.CourseVO;
import org.nojo.domain.MemberVO;
import org.nojo.mapper.AcademyMapper;
import org.nojo.util.Criteria;
import org.springframework.stereotype.Service;

@Service
public class AcademyServiceImpl implements AcademyService {
	
	@Inject
	private AcademyMapper acdmMapper;

	public void updateClass(){
		
	}
	
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
		
		ClassVO classVO = new ClassVO();
		classVO.setClz_domain(vo.getClz_domain());
		classVO.setClz_name(vo.getClz_name());
		classVO.setClz_room(vo.getClz_room());
		classVO.setClz_start_date(vo.getClz_start_date());
		classVO.setClz_end_date(vo.getClz_end_date());
		classVO.setClz_state(vo.getClz_state()); //1.준비중, 2강의중, 3.종료, 4.일시정지
		acdmMapper.insertClass(classVO);
		
		//선생님참가 반복 
		//for
		//mem_id=[user02, user122, user121],	
		//clz_domain=java99999,
		//course_state=?(가입완료)
		//course_gb=?선생님
		//course_reg_date=?(now)
		
		CourseVO courseVO = new CourseVO();
		for(int i=0; i<vo.getMem_id().length; i++){
			courseVO.setMem_id(vo.getMem_id()[i]);
			courseVO.setClz_domain(vo.getClz_domain());
			courseVO.setCourse_state(1); //0가입요청,  1가입완료
			courseVO.setCourse_gb("member_teacher");
			acdmMapper.insertCourse(courseVO);
		}
		
		
	}
	
	public List<ClassFormVO> getClassList(Criteria cri) {		
		List<ClassFormVO> classFormList;
		classFormList = acdmMapper.selectClass(cri);
		
//		System.out.println("******수업갯수**********");
//		System.out.println(classFormList.size());
//		System.out.println("*************************************");
		
		List<MemberVO> memberlist =null;
		for(int i=0 ; i<classFormList.size() ; i++ ){
//			System.out.println("******현재수업의 도메인**********");
//			System.out.println(classFormList.get(i).getClz_domain());
//			System.out.println("*************************************");
			String domain=classFormList.get(i).getClz_domain();
			
			memberlist=acdmMapper.selectClassTeacherInfo(domain);
//			System.out.println("******현재수업의 맴버수 와 리스트*******************************");
//			System.out.println(memberlist.size());
//			System.out.println(memberlist.toString());
			
			
//			System.out.println("====================================================");
//			System.out.println("====================================================");
//			System.out.println("====================================================");
//			System.out.println("====================================================");
//			System.out.println("====================================================");
			String[] ids = new String[memberlist.size()];
			String[] names = new String[memberlist.size()];
			for(int j=0 ; j<memberlist.size() ; j++ ){
				System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
				System.out.println(memberlist.get(j).getMem_id());
				System.out.println(memberlist.get(j).getMem_name());	
					
				ids[j]=memberlist.get(j).getMem_id();
				names[j]=memberlist.get(j).getMem_name();
				System.out.println(j+"번째 아이디값"+ids[j]);
				System.out.println(j+"번째 이름값"+names[j]);
				System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
			}
			
			classFormList.get(i).setMem_id(ids);
			classFormList.get(i).setMem_name(names);
		}
		return classFormList;	
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