package org.nojo.controller;

import javax.inject.Inject;

import org.nojo.mapper.NotificationMapper;
import org.nojo.security.Authority;
import org.nojo.security.SecurityUtil;
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
	
	//카페/메인(main만)
	@RequestMapping(value="/{domain}/main", method=RequestMethod.GET)
	public String tmain(@PathVariable String domain, Model model){
		model.addAttribute("notifications", notiMapper.getNotifications(domain, SecurityUtil.getUser().getId()));
		return "/main";
	}

	
}
