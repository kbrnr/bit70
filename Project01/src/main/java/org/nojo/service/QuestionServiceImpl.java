package org.nojo.service;

import java.util.List;

import javax.inject.Inject;

import org.nojo.domain.MemberVO;
import org.nojo.domain.NotificationVO;
import org.nojo.domain.QuestionVO;
import org.nojo.mapper.MembershipMapper;
import org.nojo.mapper.NotificationMapper;
import org.nojo.mapper.QuestionMapper;
import org.nojo.util.Criteria;
import org.nojo.util.Search;
import org.springframework.stereotype.Service;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Inject
	private QuestionMapper mapper;
	@Inject 
	private NotificationMapper notiMapper;
	@Inject 
	private MembershipMapper memberMapper;
	
	@Override
	public int addQuestion(QuestionVO vo) throws Exception {

		NotificationVO nvo = new NotificationVO();
		mapper.create(vo);
		
		if(vo.isQuestion_visible() == false)
		{
			String domain = vo.getClz_domain();
			List<MemberVO> teacher = memberMapper.selectTeacherByDomain(domain);
			
			for (MemberVO mvo : teacher) {
				String t = mvo.getMem_id();
				String link = "/"+vo.getClz_domain()+"/"+"qna/detail?no="+vo.getQuestion_no(); 
				nvo.setNoti_service_name("질문등록");
				nvo.setNoti_service_link(link);
				nvo.setNoti_sender_id(vo.getMem_id());
				nvo.setNoti_receiver_id(t);
			
				String title = vo.getQuestion_title();
				
				if (title.length() > 30) {
					nvo.setNoti_summation(vo.getQuestion_title().substring(0, 30));
				}else {
					nvo.setNoti_summation(title.substring(0, title.length()));
				}
				
				nvo.setClz_domain(vo.getClz_domain());
				
				notiMapper.insert(nvo);
			}
		}
		int qno = vo.getQuestion_no();
		return qno;
		
	}

	@Override
	public List<QuestionVO> listQuestion(String domain, Criteria cri) throws Exception {
		return mapper.listPage(domain, cri) ;
	}

	@Override
	public void modifyQuestion(QuestionVO vo) throws Exception {
		
		mapper.update(vo);
	}

	@Override
	public void removeQuestion(int no) throws Exception {

		mapper.delete(no);
	}

	@Override
	public int getCnt(String domain) throws Exception {
		return mapper.getTotalCnt(domain);
	}

	@Override
	public QuestionVO getReadQuestion(int no) throws Exception {
		
		return mapper.readBoard(no);
	}

	@Override
	public int getSearchCnt(String domain, Search search) throws Exception {
		
		return mapper.getSearchCnt(domain, search);
	}

	@Override
	public List<QuestionVO> searchQuestion(String domain, Criteria cri, Search search) throws Exception {

		return mapper.searchPage(domain, cri, search);
	}


	
}
