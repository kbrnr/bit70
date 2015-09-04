package org.nojo.controller;

import java.util.List;

import javax.inject.Inject;

import org.nojo.domain.NotificationVO;
import org.nojo.mapper.NotificationMapper;
import org.nojo.security.SecurityUtil;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/{domain}/notification")
public class NotificationController {

	@Inject
	private NotificationMapper mapper;
	
	@RequestMapping(method = RequestMethod.GET)
	public List<NotificationVO> getNotifications(@PathVariable String domain) {
		return mapper.getNotifications(domain, SecurityUtil.getUser().getId());
	}
	
	@RequestMapping(value="/{notiNo}", method = RequestMethod.GET)
	public List<NotificationVO> getNotification(@PathVariable String domain, @PathVariable int notiNo) {
		return mapper.getNotification(domain, SecurityUtil.getUser().getId(), notiNo);
	}
	
	@RequestMapping(value="/updateReadState/{notiNo}" ,method = RequestMethod.PATCH)
	public void updateReadState(@PathVariable int notiNo) {
		mapper.updateReadState(notiNo);
	}
	
	@RequestMapping(value="/setInside/{notiNo}" ,method = RequestMethod.PATCH)
	public void setInside(@PathVariable int notiNo) {
		mapper.setInside(notiNo);
	}
	
	@RequestMapping(value="/setAside/{notiNo}" ,method = RequestMethod.PATCH)
	public void setAside(@PathVariable int notiNo) {
		mapper.setAside(notiNo);
	}
	
	@RequestMapping(value="/{notiNo}" ,method = RequestMethod.DELETE)
	public void removeNotification(@PathVariable int notiNo) {
		mapper.removeNotification(notiNo);
	}
	
}
