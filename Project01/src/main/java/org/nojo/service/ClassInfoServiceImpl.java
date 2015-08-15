package org.nojo.service;

import java.util.List;

import javax.inject.Inject;

import org.nojo.bizDomain.ClassListVO;
import org.nojo.domain.ClassVO;
import org.nojo.domain.CourseVO;
import org.nojo.domain.MemberVO;
import org.nojo.mapper.ClassInfoMapper;
import org.nojo.mapper.DomainMapper;
import org.nojo.mapper.MemberMapper;
import org.nojo.util.Criteria;
import org.springframework.stereotype.Service;

@Service
public class ClassInfoServiceImpl implements ClassInfoService {

	@Inject
	private ClassInfoMapper classinfomapper;
	
	@Inject
	private MemberMapper membermapper;
	
	@Inject
	private DomainMapper  domainMapper;
	
	
	public boolean domainCheck(String domain){
		return !domainMapper.isExistDomain(domain); 
	}
	
	public void makeClass(ClassVO classVO, String[] mem_ids) {
		classinfomapper.insertClass(classVO);
		String domain = classVO.getClz_domain();
		
		CourseVO courseVO = new CourseVO();
		for(int i=0; i<mem_ids.length; i++){
			courseVO.setMem_id(mem_ids[i]);
			courseVO.setClz_domain(domain);
			courseVO.setCourse_state(1); //0가입요청,  1가입완료
			courseVO.setCourse_gb("member_teacher");
			classinfomapper.insertCourse(courseVO);
		}				
	}
	
	public List<ClassListVO> getClassList(Criteria cri) {		
		List<ClassListVO> classlist;
		List<MemberVO> teacherlist;
		classlist = classinfomapper.selectClass(cri);
		String domain;
		for(int i=0; i<classlist.size(); i++){
			domain=classlist.get(i).getClz_domain();
			teacherlist=membermapper.selectTeacherByDomain(domain);
			classlist.get(i).setTeacherlist(teacherlist);			
		System.out.println(domain);
		System.out.println(teacherlist.size());
		}
		return classlist;	
	}
	
	public int getClassTotalCnt() {
		return classinfomapper.selectClassTotalCnt();
	}
	
	
	public List<ClassListVO> getClassListByID(String mem_id, Criteria cri) {		
		List<ClassListVO> classlist;
		List<MemberVO> teacherlist;
		classlist = classinfomapper.selectClassByID(mem_id, cri);
		String domain;
		for(int i=0; i<classlist.size(); i++){
			domain=classlist.get(i).getClz_domain();
			teacherlist=membermapper.selectTeacherByDomain(domain);
			classlist.get(i).setTeacherlist(teacherlist);			
		System.out.println(domain);
		System.out.println(teacherlist.size());
		}
		return classlist;	
	}
	
	
	public ClassListVO getClassOne(String domain){
		ClassListVO clzVO;
		List<MemberVO> teacherlist;
		
		clzVO = classinfomapper.selectClassOne(domain);
		teacherlist = membermapper.selectTeacherByDomain(domain);
	
		clzVO.setTeacherlist(teacherlist);
		
		return clzVO;	
	}
	
	
	
	
	
	public int getClassListTotalCntByID(String mem_id) {
		return classinfomapper.selectClassTotalCntByID(mem_id);
	}

	@Override
	public int getClassListByID(String mem_id) {
		// TODO Auto-generated method stub
		return 0;
	}
		
}
