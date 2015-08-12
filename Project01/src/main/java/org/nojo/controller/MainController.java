package org.nojo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
///////////////////////////////////////////////////////////////
//  mypage
///////////////////////////////////////////////////////////////

	//학원 mypage
	@RequestMapping(value="/mypage/{userid}/a", method=RequestMethod.GET)
	public String amypage(@PathVariable String userid, Model model){
		model.addAttribute("userid", userid);
		return "/mypage/amypage";
	}
	
	//선생님 mypage
	@RequestMapping(value="/mypage/{userid}/t", method=RequestMethod.GET)
	public String tmypage(@PathVariable String userid, Model model){
		model.addAttribute("userid", userid);
		return "/mypage/tmypage";
	}
	
	//학생 mypage
	@RequestMapping(value="/mypage/{userid}/s", method=RequestMethod.GET)
	public String smypage(@PathVariable String userid, Model model){
		model.addAttribute("userid", userid);
		return "/mypage/smypage";
	}	
	
	
	
	

	
///////////////////////////////////////////////////////////////
// 카페메인
///////////////////////////////////////////////////////////////	

	//선생님/카페/메인(aheader,footer)
	@RequestMapping(value="/{domain}/{userid}/t", method=RequestMethod.GET)
	public String tindex(@PathVariable String domain, @PathVariable String userid, Model model){
		model.addAttribute("domain", domain);
		model.addAttribute("userid", userid);
		return "/index/tindex";
	}
	
	
	//선생님/카페/메인(sheader,footer)
	@RequestMapping(value="/{domain}/{userid}/s", method=RequestMethod.GET)
	public String sindex(@PathVariable String domain, @PathVariable String userid, Model model){
		model.addAttribute("domain", domain);
		model.addAttribute("userid", userid);
		return "/index/sindex";
	}
	
	
	
	
	
	
	//선생님/카페//설정
	@RequestMapping(value="/{domain}/setting", method=RequestMethod.GET)
	public String cmypage(@PathVariable("domain") String domain, Model model){
		model.addAttribute("domain", domain);	
		return "/setting/mypage";
	}


	
	//선생님/카페/메인(main만)
	@RequestMapping(value="/{domain}/{userid}/t/main", method=RequestMethod.GET)
	public String tmain(@PathVariable("domain") String domain, @PathVariable("userid") String userid, Model model){
		model.addAttribute("domain", domain);
		model.addAttribute("userid", userid);
		return "/teacher/main";
	}
	


	

	
	
	
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public void mypage(){
	}

	@RequestMapping(value="/mypage2", method=RequestMethod.GET)
	public void mypage2(){
	}
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public void index(){
	}
	
	@RequestMapping(value="/index2", method=RequestMethod.GET)
	public void index2(){
	}
	
	@RequestMapping(value="/include/header", method=RequestMethod.GET)
	public void header(){
	}
	
	@RequestMapping(value="/include/aside", method=RequestMethod.GET)
	public void aside(){
	}
	
	@RequestMapping(value="/include/footer", method=RequestMethod.GET)
	public void footer(){
	}
	
	
}
