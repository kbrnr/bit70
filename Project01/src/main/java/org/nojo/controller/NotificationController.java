package org.nojo.controller;

import java.util.List;

import javax.inject.Inject;

import org.nojo.domain.NotificationVO;
import org.nojo.mapper.NotificationMapper;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/{domain}/{userId}/notification")
public class NotificationController {

	@Inject
	private NotificationMapper mapper;
	
	@RequestMapping(method = RequestMethod.GET)
	public List<NotificationVO> getNotifications(@PathVariable String domain, @PathVariable String userId) {
		return mapper.getNotifications(domain, userId);
	}
	
	@RequestMapping(value="/{notiNo}", method = RequestMethod.GET)
	public List<NotificationVO> getNotification(@PathVariable String domain, @PathVariable String userId, @PathVariable int notiNo) {
		return mapper.getNotification(domain, userId, notiNo);
	}
	
	@RequestMapping(value="/{notiNo}" ,method = RequestMethod.PATCH)
	public void updateReadState(@PathVariable int notiNo) {
		mapper.updateReadState(notiNo);
	}
	
}
