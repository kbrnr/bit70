package org.nojo.service;

import java.util.List;

import javax.inject.Inject;

import org.nojo.domain.AnswerVO;
import org.nojo.domain.NotificationVO;
import org.nojo.domain.QuestionVO;
import org.nojo.mapper.AnswerMapper;
import org.nojo.mapper.NotificationMapper;
import org.nojo.util.Criteria;
import org.springframework.stereotype.Service;

@Service
public class AnswerServiceImpl implements AnswerService {

	@Inject
	private AnswerMapper mapper;
	@Inject
	private NotificationMapper notiMapper;

	@Override
	public NotificationVO addAnswer(AnswerVO vo, String reciver_id) throws Exception {
		
		mapper.create(vo);
		
		String link = "/"+vo.getClz_domain()+"/"+"qna/detail?no="+vo.getQuestion_no();
		String title = vo.getAnswer_title();

		NotificationVO nvo = new NotificationVO();
		nvo.setNoti_service_name("답변등록");
		nvo.setNoti_service_link(link);
		nvo.setNoti_sender_id(vo.getMem_id());
		nvo.setNoti_receiver_id(reciver_id);
		nvo.setClz_domain(vo.getClz_domain());
		
		if (title.length() > 30) {
			nvo.setNoti_summation(vo.getAnswer_title().substring(0, 30));
		}else {
			nvo.setNoti_summation(title.substring(0, title.length()));
		}
		notiMapper.insert(nvo);
		
		return nvo;
	}

	@Override
	public List<AnswerVO> getAllAnswers(String domain, Integer no, Criteria cri) throws Exception {

		return mapper.listAns(domain, no, cri);
	}

	@Override
	public void modifyAnswer(AnswerVO vo) throws Exception {

		mapper.update(vo);
	}

	@Override
	public void removeAnswer(Integer answer_no) throws Exception {

		mapper.delete(answer_no);
	}

	@Override
	public int getCntList(Integer no) throws Exception {

		return mapper.getTotalCnt(no);
	}

	@Override
	public AnswerVO readAnswer(Integer no, String domain, Integer rno) throws Exception {

		return mapper.readAns(no, domain, rno);
	}

	@Override
	public void voteRecommend(Integer no) throws Exception {

		mapper.UpdateReCommend(no);
	}

}
