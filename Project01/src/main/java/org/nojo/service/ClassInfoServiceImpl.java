package org.nojo.service;

import java.util.List;

import javax.inject.Inject;

import org.nojo.bizDomain.ClassListVO;
import org.nojo.domain.ClassVO;
import org.nojo.domain.CourseVO;
import org.nojo.domain.MemberVO;
import org.nojo.mapper.ClassInfoMapper;
import org.nojo.mapper.MembershipMapper;
import org.nojo.mapper.SecurityMapper;
import org.nojo.util.SearchCriteria;
import org.springframework.stereotype.Service;

@Service
public class ClassInfoServiceImpl implements ClassInfoService {

	@Inject
	private ClassInfoMapper classinfoMapper;
	
	@Inject
	private MembershipMapper membershipMapper;
	
	@Inject
	private SecurityMapper securiryMapper;
	
	
	public boolean domainCheck(String domain){
		return !securiryMapper.isExistDomain(domain); 
	}
	
	public void makeClass(ClassVO classVO, String[] mem_ids) {
		classinfoMapper.insertClass(classVO);
		String domain = classVO.getClz_domain();
		
		CourseVO courseVO = new CourseVO();
		for(int i=0; i<mem_ids.length; i++){
			courseVO.setMem_id(mem_ids[i]);
			courseVO.setClz_domain(domain);
			courseVO.setCourse_state(2); //가입여부(승인전0, 승인요청1, 가입완료2, 정지3)
			courseVO.setCourse_gb("member_teacher");
			classinfoMapper.insertCourseTeacher(courseVO);
		}				
	}
	
	
	public void modifyClass(ClassVO classVO, String[] mem_ids) {
		//특정반 선생님 정보삭제 tbl_course
		String domain = classVO.getClz_domain();
		classinfoMapper.deleteCourseTeacher(domain);
		
		//classVO 업데이트 tbl_class 수정
		classinfoMapper.updateClass(classVO);

		//선생님리스트 등록 tbl_course 등록
		CourseVO courseVO = new CourseVO();
		for(int i=0; i<mem_ids.length; i++){
			courseVO.setMem_id(mem_ids[i]);
			courseVO.setClz_domain(domain);
			courseVO.setCourse_state(2); //가입여부(승인전0, 승인요청1, 가입완료2, 정지3)
			courseVO.setCourse_gb("member_teacher");
			classinfoMapper.insertCourseTeacher(courseVO);
		}	
	}
	
	
	public List<ClassListVO> getClassList(SearchCriteria cri) {		
		List<ClassListVO> classlist;
		List<MemberVO> teacherlist;
		String domain;
		
		classlist = classinfoMapper.selectClass(cri);
		
		for(int i=0; i<classlist.size(); i++){
			domain=classlist.get(i).getClz_domain();
			teacherlist=membershipMapper.selectTeacherByDomain(domain);
			classlist.get(i).setTeacherlist(teacherlist);			
		System.out.println(domain);
		System.out.println(teacherlist.size());
		}
		return classlist;	
	}
	
	
	public List<ClassListVO> getClassListJoin(SearchCriteria cri, String userid){
		List<ClassListVO> classlist;
		List<MemberVO> teacherlist;
		String domain;		
		
		classlist = classinfoMapper.selectClassJoin(cri, userid);
		
		for(int i=0; i<classlist.size(); i++){
			domain=classlist.get(i).getClz_domain();
			teacherlist=membershipMapper.selectTeacherByDomain(domain);
			classlist.get(i).setTeacherlist(teacherlist);		
		}
		return classlist;
	}
	
	
	
	public int getClassTotalCnt(SearchCriteria cri) {
		return classinfoMapper.selectClassTotalCnt(cri);
	}
	
	
	public List<ClassListVO> getClassListByID(String mem_id, SearchCriteria cri) {		
		List<ClassListVO> classlist;
		List<MemberVO> teacherlist;
		classlist = classinfoMapper.selectClassByID(mem_id, cri);
		String domain;
		
		
		//for(int i=0; i<classlist.size(); i++){
		for(int i=0; i<3; i++){
			domain=classlist.get(i).getClz_domain();
			teacherlist=membershipMapper.selectTeacherByDomain(domain);
			classlist.get(i).setTeacherlist(teacherlist);			
		System.out.println(domain);
		System.out.println(teacherlist.size());
		}
		return classlist;	
	}
	
	
	public ClassListVO getClassOne(String domain){
		ClassListVO clzVO;
		List<MemberVO> teacherlist;
		
		clzVO = classinfoMapper.selectClassOne(domain);
		teacherlist = membershipMapper.selectTeacherByDomain(domain);
	
		clzVO.setTeacherlist(teacherlist);
		
		return clzVO;	
	}
	
	
	public int getClassListTotalCntByID(String mem_id, SearchCriteria cri) {
		return classinfoMapper.selectClassTotalCntByID(mem_id,cri);
	}




}
