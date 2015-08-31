package org.nojo.controller;

import java.util.List;

import javax.inject.Inject;

import org.nojo.bizDomain.ReplypopVO;
import org.nojo.domain.ReplyVO;
import org.nojo.service.ReplyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/{domain}/reply")
public class ReplyController {

	@Inject
	public ReplyService replyservice;
	
	@ResponseBody
	@RequestMapping(value="", method=RequestMethod.POST)
	public void scoreReply(@PathVariable String domain, @RequestBody ReplyVO vo) throws Exception{
		System.out.println("vo" + vo.getReply_writer());
		replyservice.addReply(vo);
	}	
	
	@ResponseBody
	@RequestMapping(value="/replyall", method=RequestMethod.GET)
	public List<ReplypopVO> replyAll(int comprehension_no){
		System.out.println("aaa"+replyservice.getReply(comprehension_no).toString());
		return replyservice.getReply(comprehension_no) ; 		
	}
	
}
