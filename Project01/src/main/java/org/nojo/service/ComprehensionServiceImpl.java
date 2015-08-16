package org.nojo.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.nojo.bizDomain.JoinMemberVO;
import org.nojo.bizDomain.ScoreVO;
import org.nojo.bizDomain.TeacherQuestionVO;
import org.nojo.domain.ComprehensionVO;
import org.nojo.domain.TeacherquestionVO;
import org.nojo.mapper.ComprehensionMapper;
import org.springframework.stereotype.Service;

@Service
public class ComprehensionServiceImpl implements ComprehensionService{

	@Inject		//주입
	private ComprehensionMapper mapper;
	
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
	public int registQuestion(TeacherquestionVO vo) throws Exception {
		return mapper.registQuestion(vo);
	}

	@Override
	public int registComprehension(ComprehensionVO vo) throws Exception {
		return mapper.registComprehension(vo);
	}
	
	////tmp///////////////////////////
	@Override
	public void getComprehension(String domain) throws Exception {
		HashMap<String, Object> comprehensionmap= null ;

		List<JoinMemberVO> namelist = null;
		List<TeacherQuestionVO> tqlist = null;
		List<ScoreVO> scorelist= null;
		List<List<ScoreVO>> scorelistset = null;

		namelist = mapper.selectName(domain);
		tqlist = mapper.selectQuestion(domain);
		
		
		for(int i=0; i<tqlist.size(); i++){
			scorelist = mapper.selectScore(domain, tqlist.get(i).getTeacherquestion_no());
		    scorelistset.add(scorelist);
		}
		comprehensionmap.put("tqlist", tqlist);
		comprehensionmap.put("namelist", namelist);
		comprehensionmap.put("scorelistset", scorelistset);
				
	}
	
}
