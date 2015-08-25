package org.nojo.controller;

import java.util.List;

import javax.inject.Inject;

import org.nojo.bizDomain.ClassListVO;
import org.nojo.domain.ClassVO;
import org.nojo.security.SecurityUtil;
import org.nojo.service.ClassInfoService;
import org.nojo.util.PageMaker;
import org.nojo.util.SearchCriteria;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/classinfo")
public class ClassInfoController {

	@Inject
	private ClassInfoService classInfoService;

	
	//전체수업리스트
	@RequestMapping(value="/classlist", method=RequestMethod.GET)
	public String classlist(SearchCriteria cri, Model model){
		List<ClassListVO> list;
		PageMaker pagemaker;
		
		list = classInfoService.getClassList(cri);
		pagemaker = new PageMaker(cri, classInfoService.getClassTotalCnt(cri));
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pagemaker);
		model.addAttribute("cri", cri);

		return "/classinfo/classlist" ;
	}

	
	//수업등록폼
	@RequestMapping(value="/classform", method=RequestMethod.GET)
	public String classform(){
		return "/classinfo/classform";
	}

	//수업등록
	@RequestMapping(value="/classregister", method=RequestMethod.POST)
	public String classregister(ClassVO vo, String[] mem_id){
		classInfoService.makeClass(vo, mem_id);
		return "redirect:/classinfo/classread?domain=" + vo.getClz_domain();
	}
	
	//도메인체크
	@ResponseBody
	@RequestMapping(value="/domaincheck", method= RequestMethod.POST)
	public boolean canusedomain(String clz_domain) {
		System.out.println(clz_domain);
		return classInfoService.domainCheck(clz_domain);
	}

	//수업상세
	@RequestMapping(value="/classread", method=RequestMethod.GET)
	public String classread(String domain, Model model){
		ClassListVO clzVO ;
		clzVO = classInfoService.getClassOne(domain);
		
		System.out.println("===============================================");
		System.out.println(clzVO.getTeacherlist().size());
		System.out.println("===============================================");
		
		model.addAttribute("clzinfo", clzVO);
		
		return "/classinfo/classread" ;
	}



	//my페이지 학생 전체수업리스트 수업신청 기능 포함
	@RequestMapping(value="/sclasslistjoin", method=RequestMethod.GET)
	public String classlistjoin(SearchCriteria cri, Model model){
		List<ClassListVO> list;
		PageMaker pagemaker;
		
		list = classInfoService.getClassListJoin(cri, SecurityUtil.getUser().getId());
		pagemaker = new PageMaker(cri, classInfoService.getClassTotalCnt(cri));

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pagemaker);
		model.addAttribute("cri", cri);
		
		return "/classinfo/sclasslistjoin" ;
	}


	//개인별(선생님, 학생) 수업리스트
	@RequestMapping(value="/myclasslist", method=RequestMethod.GET)
	public String myclasslist(SearchCriteria cri, Model model){
		List<ClassListVO> list;
		PageMaker pagemaker;
		
		list = classInfoService.getClassListByID(SecurityUtil.getUser().getId(), cri); 
		pagemaker = new PageMaker(cri, classInfoService.getClassListTotalCntByID(SecurityUtil.getUser().getId(),cri));
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pagemaker);
		model.addAttribute("cri", cri);
		
		return "/classinfo/myclasslist" ;
	}
	
	
	
	
	

	
	
	
	
	

	
	
	//개인별(학생) 수업리스트
	@RequestMapping(value="/sclasslist", method=RequestMethod.GET)
	public String sclasslistbyid(SearchCriteria cri, Model model){
		List<ClassListVO> list;
		PageMaker pagemaker;
		
		list = classInfoService.getClassListByID(SecurityUtil.getUser().getId(), cri); 
		pagemaker = new PageMaker(cri, classInfoService.getClassListTotalCntByID(SecurityUtil.getUser().getId(),cri));
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pagemaker);
		
		return "/classinfo/sclasslist" ;
	}
	
	
	

	
}
