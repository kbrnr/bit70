package org.nojo.controller;

import javax.inject.Inject;

import org.nojo.service.SeatService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/{domain}/seat")
public class SeatController {
	@Inject
	SeatService seatService;

	@RequestMapping(method = RequestMethod.GET)
	public String seatPage(@PathVariable("domain") String clz_domain, Model model) throws Exception {
		
		model.addAttribute("list", seatService.listMember(clz_domain));
		return "/seat/seat";
	}
}
