package org.nojo.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.nojo.bizDomain.ClassListVO;
import org.nojo.domain.ClassVO;
import org.nojo.domain.MemberVO;
import org.nojo.service.AcademyService;
import org.nojo.util.Criteria;
import org.nojo.util.PageMaker;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/academy")
public class AcademyController {

	@Inject
	private AcademyService acdmService;
	
	//수업등록폼
	@RequestMapping(value="/classform", method=RequestMethod.GET)
	public void classform(){
	}

	//수업등록
	@RequestMapping(value="/classregister", method=RequestMethod.GET)
	public String classregister(ClassVO vo, String[] mem_id){
		System.out.println("@Controller:"+ vo.toString());	
		System.out.println("@Controller:"+ mem_id[0]);	
		System.out.println("@Controller:"+ mem_id[1]);	
		System.out.println("@Controller:"+ mem_id[2]);	
		acdmService.makeClass(vo, mem_id);
		
		return "redirect:classmodify";
	}
	
	//수업상세
	@RequestMapping(value="/classmodify", method=RequestMethod.GET)
	public void classmodify(){
	}
	
	//수업리스트
	@RequestMapping(value="/classlist", method=RequestMethod.GET)
	public void classlist(Criteria cri, Model model){
		List<ClassListVO> list;
		PageMaker pagemaker;
		
		list = acdmService.getClassList(cri);
		pagemaker = new PageMaker(cri, acdmService.getClassTotalCnt());
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pagemaker);
	}
	
	//선생님리스트
	@RequestMapping(value="/teacherlist", method=RequestMethod.GET)
	public void teacherlist(Criteria cri, Model model) throws Exception{
		List<MemberVO> list;
		PageMaker pagemaker;
		
		list = acdmService.getTeacherList(cri);
		pagemaker = new PageMaker(cri, acdmService.getTeacherTotalCnt());
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pagemaker);
	}
		
	//도메인체크
	@ResponseBody
	@RequestMapping(value="/domaincheck", method= RequestMethod.POST)
	public boolean canusedomain(String clz_domain) {
		System.out.println(clz_domain);
		return acdmService.domainCheck(clz_domain);
	}
	
	
	//선생님리스트팝업
	@ResponseBody
	@RequestMapping(value="/modalteacherlist/{page}", method= RequestMethod.POST)
	public ResponseEntity<HashMap<String, Object>> modalteacherlist(Criteria cri,@PathVariable("page") Integer page) throws Exception {
		ResponseEntity<HashMap<String, Object>> entity = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<MemberVO> list;
		PageMaker pagemaker;
		cri.setPage(page);
		list = acdmService.getTeacherList(cri);
		pagemaker = new PageMaker(cri, acdmService.getTeacherTotalCnt());
		
		map.put("poplist", list);
		map.put("poppageMaker", pagemaker);
		
		try{
			entity = new ResponseEntity<HashMap<String, Object>>(map, HttpStatus.OK);
			
		}catch(Exception e){
			entity = new ResponseEntity<HashMap<String, Object>>(HttpStatus.BAD_REQUEST);	
		}
		return entity;
		
	}
}
