package org.nojo.controller;

import java.util.List;

import javax.inject.Inject;

import org.nojo.bizDomain.ClassListVO;
import org.nojo.domain.ClassVO;
import org.nojo.service.ClassInfoService;
import org.nojo.util.Criteria;
import org.nojo.util.PageMaker;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/classinfo")
public class ClassInfoController {

	@Inject
	private ClassInfoService classinfoservice;
	
	
	//수업상세
	@RequestMapping(value="/classread", method=RequestMethod.GET)
	public String classread(String domain, Model model){
		ClassListVO clzVO ;
		clzVO = classinfoservice.getClassOne(domain);
		
		System.out.println("===============================================");
		System.out.println(clzVO.getTeacherlist().size());
		System.out.println("===============================================");
		
		model.addAttribute("clzinfo", clzVO);
		
		return "/classinfo/classread" ;
	}
	
	//수업리스트
	@RequestMapping(value="/classlist/{userid}", method=RequestMethod.GET)
	public String classlist(@PathVariable("userid") String userid, Criteria cri, Model model){
		List<ClassListVO> list;
		PageMaker pagemaker;
		
		list = classinfoservice.getClassList(cri);
		pagemaker = new PageMaker(cri, classinfoservice.getClassTotalCnt());
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pagemaker);
		
		return "/classinfo/classlist" ;
	}
	
	//개인별(선생님) 수업리스트
	@RequestMapping(value="/classlist/{userid}/t", method=RequestMethod.GET)
	public String tclasslistbyid(@PathVariable("userid") String userid, Criteria cri, Model model){
		List<ClassListVO> list;
		PageMaker pagemaker;
		
		list = classinfoservice.getClassListByID(userid, cri); 
		pagemaker = new PageMaker(cri, classinfoservice.getClassListTotalCntByID(userid));
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pagemaker);
		
		return "/classinfo/tclasslist" ;
	}
	
	
	//개인별(선생님) 수업리스트
	@RequestMapping(value="/classlist/{userid}/s", method=RequestMethod.GET)
	public String sclasslistbyid(@PathVariable("userid") String userid, Criteria cri, Model model){
		List<ClassListVO> list;
		PageMaker pagemaker;
		
		list = classinfoservice.getClassListByID(userid, cri); 
		pagemaker = new PageMaker(cri, classinfoservice.getClassListTotalCntByID(userid));
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pagemaker);
		
		return "/classinfo/sclasslist" ;
	}
	
	
	
	//수업등록폼
	@RequestMapping(value="/classform", method=RequestMethod.GET)
	public String classform(){
		return "/classinfo/classform";
	}

	//수업등록
	@RequestMapping(value="/classregister", method=RequestMethod.POST)
	public String classregister(ClassVO vo, String[] mem_id){
		System.out.println("@Controller:"+ vo.toString());	
		System.out.println("@Controller:"+ mem_id[0]);	
		System.out.println("@Controller:"+ mem_id[1]);	
		System.out.println("@Controller:"+ mem_id[2]);	
		classinfoservice.makeClass(vo, mem_id);
		
		return "redirect:classmodify";
	}
	
	//도메인체크
	@ResponseBody
	@RequestMapping(value="/domaincheck", method= RequestMethod.POST)
	public boolean canusedomain(String clz_domain) {
		System.out.println(clz_domain);
		return classinfoservice.domainCheck(clz_domain);
	}

	
}
