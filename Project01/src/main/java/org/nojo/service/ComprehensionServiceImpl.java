package org.nojo.service;

import java.util.ArrayList;
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
		mapper.registQuestion(vo);
		return vo.getTeacherquestion_no();
	}

	@Override
	public int registComprehension(ComprehensionVO vo) throws Exception {
		mapper.registComprehension(vo);
		return vo.getComprehension_no();
	}
	
	////tmp///////////////////////////
	@Override
	public HashMap<String, Object> getComprehension(String domain) throws Exception {
		HashMap<String, Object> comprehensionmap= new HashMap<String, Object>();

		List<JoinMemberVO> namelist ;
		List<TeacherQuestionVO> tqlist ;
		List<ScoreVO> scorelist ;
		List<List<ScoreVO>> scorelistset = new ArrayList<List<ScoreVO>>();

		namelist = mapper.selectName(domain);
		tqlist = mapper.selectQuestion(domain);
		
		for(int i=0; i<tqlist.size(); i++){
			scorelist = mapper.selectScore(domain, tqlist.get(i).getTeacherquestion_no());
			scorelistset.add(scorelist);
		}
		
		comprehensionmap.put("namelist", namelist);
		comprehensionmap.put("tqlist", tqlist);
		comprehensionmap.put("scorelistset", scorelistset);

		System.out.println("이름갯수:" +namelist.get(0).getMem_name());
		System.out.println("질문갯수:" +tqlist.size());
		System.out.println("점수셋갯수:" +scorelistset.size());
		System.out.println("점수셋갯수:" +scorelistset.get(0).size());
		return comprehensionmap;
				
	}
	
}
