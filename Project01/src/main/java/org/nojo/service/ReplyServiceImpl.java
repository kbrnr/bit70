package org.nojo.service;

import javax.inject.Inject;

import org.nojo.domain.ReplyVO;
import org.nojo.mapper.ReplyMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject
	private ReplyMapper replyMapper;
	
	@Transactional
	public void addReply(ReplyVO vo) {
		System.out.println(vo.toString());
		replyMapper.insertReply(vo);
		replyMapper.updateReplyCnt(vo);
	}


}
