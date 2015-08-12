package org.nojo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	//선생님/카페/메인(index)
	@RequestMapping(value="/{domain}/{userid}", method=RequestMethod.GET)
	public String tindex(@PathVariable("domain") String domain, @PathVariable("userid") String userid, Model model){
		model.addAttribute("domain", domain);
		model.addAttribute("userid", userid);
		return "/teacher/index";
	}
	
	//선생님/카페/메인만 볼때
	@RequestMapping(value="/{domain}/{userid}/t/main", method=RequestMethod.GET)
	public String tmain(@PathVariable("domain") String domain, @PathVariable("userid") String userid, Model model){
		model.addAttribute("domain", domain);
		model.addAttribute("userid", userid);
		return "/teacher/main";
	}
	
	
	//선생님/마이페이지
	@RequestMapping(value="/mypage/{userid}", method=RequestMethod.GET)
	public String tmypage(@PathVariable("userid") String userid, Model model){
		model.addAttribute("userid", userid);	
		return "/teacher/mypage";
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
