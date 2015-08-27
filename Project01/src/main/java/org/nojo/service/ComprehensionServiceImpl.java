package org.nojo.service;

import java.util.List;

import javax.inject.Inject;

import org.nojo.bizDomain.ScoreVO;
import org.nojo.bizDomain.TQuestionScoreListVO;
import org.nojo.domain.ComprehensionVO;
import org.nojo.domain.NotificationVO;
import org.nojo.domain.TeacherquestionVO;
import org.nojo.mapper.ComprehensionMapper;
import org.nojo.mapper.CourseMapper;
import org.nojo.mapper.NotificationMapper;
import org.nojo.security.SecurityUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ComprehensionServiceImpl implements ComprehensionService{

	@Inject		//주입
	private ComprehensionMapper mapper;
	
	@Inject
	private CourseMapper courseMapper;
	
	@Inject
	private NotificationMapper notiMapper;
	
	
	@Override
	public List<String> listName(String name) throws Exception {
		return mapper.listName(name);
	}

	@Override
	public List<String> listQuestion(String question) throws Exception{
		return mapper.listQuestion(question);
	}
	
	@Override
	public List<String> listScore(String score) throws Exception{
		return mapper.listScore(score);
	}
	
	@Override
	@Transactional
	public int registQuestion(String domain, TeacherquestionVO vo) throws Exception {
		mapper.registQuestion(vo);
		List<String> idList = courseMapper.getStudentIdList(domain);
		String senderId = SecurityUtil.getUser().getId();
		String link = "/"+domain+"/comprehension";
		String summation = vo.getTeacherquestion_content();
		for (String id : idList) {
			NotificationVO nvo = new NotificationVO();
			nvo.setNoti_service_name("이해도");
			nvo.setNoti_service_link(link);
			nvo.setNoti_receiver_id(id);
			nvo.setNoti_summation(summation);
			nvo.setNoti_sender_id(senderId);
			nvo.setClz_domain(domain);
			notiMapper.insert(nvo);
		}
		return vo.getTeacherquestion_no();
	}

	@Override
	public int registComprehension(ComprehensionVO vo) throws Exception {
		mapper.registComprehension(vo);
		return vo.getComprehension_no();
	}
	
//	////tmp///////////////////////////
//	@Override
//	public HashMap<String, Object> getComprehension(String domain) throws Exception {
//		HashMap<String, Object> comprehensionmap= new HashMap<String, Object>();
//
//		List<JoinMemberVO> namelist ;
//		List<TeacherQuestionVO> tqlist ;
//		List<ScoreVO> scorelist ;
//		List<List<ScoreVO>> scorelistset = new ArrayList<List<ScoreVO>>();
//
//		namelist = mapper.selectName(domain);
//		tqlist = mapper.selectQuestion(domain);
//		
//		for(int i=0; i<tqlist.size(); i++){
//			scorelist = mapper.selectScore(domain, tqlist.get(i).getTeacherquestion_no());
//			scorelistset.add(scorelist);
//		}
//		
//		comprehensionmap.put("namelist", namelist);
//		comprehensionmap.put("tqlist", tqlist);
//		comprehensionmap.put("scorelistset", scorelistset);
//
//		System.out.println("이름갯수:" +namelist.get(0).getMem_name());
//		System.out.println("질문갯수:" +tqlist.size());
//		System.out.println("점수셋갯수:" +scorelistset.size());
//		System.out.println("점수셋갯수:" +scorelistset.get(0).size());
//		return comprehensionmap;
//				
//	}
	
	
	////tmp///////////////////////////
	@Override
	public List<TQuestionScoreListVO> getComprehension(String domain) throws Exception {
		List<TQuestionScoreListVO> tqscorelist ; //bit70의 특정 선생님 질문하나에 학생들의 점수들  의  리스트  
		List<ScoreVO> scorelist ; 
		//특정반의 선생님 질문 리스트
		tqscorelist = mapper.selectQuestion(domain);  //질문들을 가져옴

		for(int i=0; i<tqscorelist.size(); i ++ ){ //질문수만큼 반복
			scorelist = mapper.selectScore(domain, tqscorelist.get(i).getTeacherquestion_no()); //특정 질문의 점수들
			tqscorelist.get(i).setScorelist(scorelist); //질문에 학생들 점수 리스트 추가  --> 특정질문에 학생들 점수들이 리스트로 있음
		}
		return tqscorelist;	
	}
	
	@Override
	public List<ScoreVO> getComprehensionByID(String domain, String mem_id) throws Exception {
		List<ScoreVO> tqscorebyidlist ; 
		tqscorebyidlist = mapper.selectScoreByID(domain, mem_id);
		
		return tqscorebyidlist;	
	}
	
	
	

	
}
