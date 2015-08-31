package org.nojo.service;

import java.util.List;

import javax.inject.Inject;

import org.nojo.bizDomain.ReplypopVO;
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

	public List<ReplypopVO> getReply(int comprehension_no) {
		return replyMapper.selectReply(comprehension_no) ;
	}
}
