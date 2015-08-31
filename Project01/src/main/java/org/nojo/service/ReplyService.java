package org.nojo.service;

import java.util.List;

import org.nojo.bizDomain.ReplypopVO;
import org.nojo.domain.ReplyVO;

public interface ReplyService {

	public void addReply(ReplyVO vo);
	
	public List<ReplypopVO> getReply(int comprehension_no);
}
