package org.nojo.service;

import java.util.List;

import javax.inject.Inject;

import org.nojo.bizDomain.ClassListVO;
import org.nojo.domain.ClassVO;
import org.nojo.domain.CourseVO;
import org.nojo.domain.MemberVO;
import org.nojo.mapper.AcademyMapper;
import org.nojo.mapper.DomainMapper;
import org.nojo.util.Criteria;
import org.springframework.stereotype.Service;

@Service
public class AcademyServiceImpl implements AcademyService {
	
	@Inject
	private AcademyMapper acdmMapper;
	
	@Inject
	private DomainMapper  domainMapper;

	public boolean domainCheck(String domain){
		return !domainMapper.isExistDomain(domain); 
	}
	
	
	public void makeClass(ClassVO classVO, String[] mem_ids) {
		acdmMapper.insertClass(classVO);
		String domain = classVO.getClz_domain();
		
		CourseVO courseVO = new CourseVO();
		for(int i=0; i<mem_ids.length; i++){
			courseVO.setMem_id(mem_ids[i]);
			courseVO.setClz_domain(domain);
			courseVO.setCourse_state(1); //0가입요청,  1가입완료
			courseVO.setCourse_gb("member_teacher");
			acdmMapper.insertCourse(courseVO);
		}				
	}
	
	public List<ClassListVO> getClassList(Criteria cri) {		
		List<ClassListVO> classlist;
		List<MemberVO> teacherlist;
		classlist = acdmMapper.selectClass(cri);
		String domain;
		for(int i=0; i<classlist.size(); i++){
			domain=classlist.get(i).getClz_domain();
			teacherlist=acdmMapper.selectClassTeacher(domain);
			classlist.get(i).setTeacherlist(teacherlist);			
		System.out.println(domain);
		System.out.println(teacherlist.size());
		}
		return classlist;	
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
