package org.nojo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.nojo.domain.MemberVO;
import org.nojo.security.SecurityUtil;
import org.nojo.service.MemberService;
import org.nojo.service.MembershipService;
import org.nojo.service.SeatService;
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
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/membership")
public class MembershipController {

	@Inject
	private MemberService memberService;

	@Inject
	private MembershipService membershipService;

	// 선생님리스트
	@RequestMapping(value = "/teacherlist", method = RequestMethod.GET)
	public String teacherlist(SearchCriteria cri, Model model) throws Exception {
		List<MemberVO> list;
		PageMaker pageMaker;

		list = membershipService.getTeacherList(cri);
		pageMaker = new PageMaker(cri, membershipService.getTeacherTotalCnt(cri));
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
		list = membershipService.getTeacherList(cri);
		pagemaker = new PageMaker(cri, membershipService.getTeacherTotalCnt(cri));

		map.put("poplist", list);
		map.put("poppageMaker", pagemaker);

		try {
			entity = new ResponseEntity<HashMap<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<HashMap<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	

	//프로필 읽기
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public void personalInfo() throws Exception {
	}
	
	//프로필 수정
	@RequestMapping(value = "/profile", method = RequestMethod.POST)
	public void personalInfoModify(MemberVO vo, MultipartFile file) throws Exception {
		vo.setMem_photo(file.getBytes());
		memberService.personalInfoModify(vo);
	}
	
	//이미지보기
	@RequestMapping(value = "/profileImg", method = RequestMethod.GET)
	public void photo(HttpServletResponse res, Model model) throws IOException {
		byte[] bytes = SecurityUtil.getUser().getPhoto();
		res.getOutputStream().write(bytes);
	}

	
}
