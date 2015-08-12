package org.nojo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	//선생님 관련
	@RequestMapping(value="/teacher/index", method=RequestMethod.GET)
	public void tindex(){
	}
	
	@RequestMapping(value="/teacher/main", method=RequestMethod.GET)
	public void tmain(){
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
