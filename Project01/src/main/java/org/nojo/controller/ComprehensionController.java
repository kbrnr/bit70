package org.nojo.controller;

import java.util.List;

import javax.inject.Inject;

import org.nojo.service.ComprehensionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping("/{domain}/comprehension")
public class ComprehensionController {
	@Inject
	ComprehensionService service;
	
	@RequestMapping(method=RequestMethod.GET)
	public String comprehension(@PathVariable("domain")String domain, @PathVariable("domain")String content, String comprehension, Model model) throws Exception{

		List<String> name = null;
		List<String> question = null;
		List<String> score = null;
		
		name = service.listName(domain);
		question = service.listQuestion(content);
		score = service.listScore(comprehension);
		
		System.out.println(name);
		System.out.println(question);
		System.out.println(score);
		
		model.addAttribute("listName", name);
		model.addAttribute("listQuestion", question);
		model.addAttribute("listScore", score);
		
		return "/comprehension/comprehension";
	}	

}

