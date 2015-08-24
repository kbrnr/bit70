package org.nojo.controller;

import javax.inject.Inject;

import org.nojo.domain.MemberVO;
import org.nojo.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Inject
	private MemberService memberService;

	@RequestMapping("/login")
	public void login() {
	}

	@RequestMapping(value = "/signIn", method = RequestMethod.POST)
	public void signIn(MemberVO vo, MultipartFile file) throws Exception {
		System.out.println("========================================================");
		System.out.println("vo: " + vo);
		System.out.println("file: " + file);
		System.out.println("========================================================");
		vo.setMem_photo(file.getBytes());
		memberService.signIn(vo);
	}

	@RequestMapping("/register")
	public void register() {
	}

	
	//개인정보 보기
	@RequestMapping(value = "/read", method = RequestMethod.POST)
	public void read(String userid, Model model) throws Exception {
		
	}
}
