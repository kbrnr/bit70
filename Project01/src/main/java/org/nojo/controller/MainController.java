package org.nojo.controller;

import javax.inject.Inject;

import org.nojo.mapper.NotificationMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	@Inject
	private NotificationMapper notiMapper;
	
///////////////////////////////////////////////////////////////
//  mypage
///////////////////////////////////////////////////////////////

	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public void mypage(){}

///////////////////////////////////////////////////////////////
//카페index
///////////////////////////////////////////////////////////////	

	//선생님/카페//설정
	@RequestMapping(value="/{domain}", method=RequestMethod.GET)
	public String tsetting(@PathVariable String domain){
		
		return "/index";
	}
	
	
	
///////////////////////////////////////////////////////////////
//카페 홈(메인)
///////////////////////////////////////////////////////////////	
	
	//선생님/카페/메인(main만)
	@RequestMapping(value="/{domain}/{userid}/t/main", method=RequestMethod.GET)
	public String tmain(@PathVariable("domain") String domain, @PathVariable("userid") String userid, Model model){
		model.addAttribute("notifications", notiMapper.getNotifications(domain, userid));
		model.addAttribute("domain", domain);
		model.addAttribute("userid", userid);
		return "/index/tmain";
	}
	
	//선생님/카페/메인(main만)
	@RequestMapping(value="/{domain}/{userid}/s/main", method=RequestMethod.GET)
	public String smain(@PathVariable("domain") String domain, @PathVariable("userid") String userid, Model model){
		model.addAttribute("domain", domain);
		model.addAttribute("userid", userid);
		return "/index/smain";
	}
	
///////////////////////////////////////////////////////////////
//기타
///////////////////////////////////////////////////////////////	
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public void index(){
	}
	

	
	
}
