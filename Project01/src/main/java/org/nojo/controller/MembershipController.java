package org.nojo.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.nojo.bizDomain.JoinMemberVO;
import org.nojo.domain.MemberVO;
import org.nojo.service.MemberService;
import org.nojo.util.Criteria;
import org.nojo.util.PageMaker;
import org.nojo.util.SearchCriteria;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/membership")
public class MembershipController {

	@Inject
	private MemberService memberService;
	
	// 선생님리스트
	@RequestMapping(value = "/teacherlist", method = RequestMethod.GET)
	public String teacherlist(SearchCriteria cri, Model model) throws Exception {
				
		System.out.println("SearchType: " + cri.getSearchType());
		System.out.println("Keyword: " + cri.getKeyword());
		List<MemberVO> list;
		PageMaker pageMaker;

		list = memberService.getTeacherList(cri);
		pageMaker = new PageMaker(cri, memberService.getTeacherTotalCnt(cri));
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);

		return "/membership/teacherlist";
	}
	
	// 선생님리스트팝업
	@ResponseBody
	@RequestMapping(value = "/modalteacherlist/{page}", method = RequestMethod.POST)
	public ResponseEntity<HashMap<String, Object>> modalteacherlist(SearchCriteria cri, @PathVariable("page") Integer page) throws Exception {
		ResponseEntity<HashMap<String, Object>> entity = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<MemberVO> list;
		PageMaker pagemaker;
		cri.setPage(page);
		list = memberService.getTeacherList(cri);
		pagemaker = new PageMaker(cri, memberService.getTeacherTotalCnt(cri));

		map.put("poplist", list);
		map.put("poppageMaker", pagemaker);

		try {
			entity = new ResponseEntity<HashMap<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<HashMap<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	// 수업참여인원
	@RequestMapping(value = "/joinmemberlist/{domain}", method = RequestMethod.GET) 
	public String joinlist(Criteria cri, @PathVariable("domain") String domain, Model model) {	
		List<JoinMemberVO> list ;
		PageMaker pagemaker;

		list = memberService.getMemberByDomain(cri, domain);
		pagemaker = new PageMaker(cri, memberService.getTotalCntByDomain(domain));

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pagemaker);
		
		return "/member/joinmemberlist";
	}
	//프로필 수정
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public void personalInfo() {
		
	}

	
}
