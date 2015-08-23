package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.nojo.bizDomain.JoinMemberVO;
import org.nojo.bizDomain.ScoreVO;
import org.nojo.bizDomain.TQuestionScoreListVO;
import org.nojo.domain.ComprehensionVO;
import org.nojo.domain.TeacherquestionVO;

public interface ComprehensionMapper {
	
	@Select("select m.mem_name "
			+ "from tbl_member m, "
			+ "(select * from tbl_course where clz_domain = #{domain} "
			+ "and course_gb = 'member_student' "
			+ "or course_gb = 'member_clz_president') temp "
			+ "where m.mem_id = temp.mem_id "
			+ "order by m.mem_id") 
	public List<String> listName(String name) throws Exception;
	
	@Select("select t.teacherquestion_content "
			+ "from tbl_teacherquestion t, tbl_curriculum c "
			+ "where t.curri_no = c.curri_no "
			+ "and c.clz_domain = #{domain}")
	public List<String> listQuestion(String question) throws Exception;
	
	@Select("select comprehension_score "
			+ "from "
			+ "(select m.mem_id, m.mem_name from tbl_member m, "
			+ "(select * from tbl_course "
			+ "where clz_domain = 'bit70' "
			+ "and course_gb = 'member_student' "
			+ "or course_gb = 'member_clz_president') temp "
			+ "where m.mem_id = temp.mem_id order by m.mem_id) l "
			+ "left join "
			+ "(select c.mem_id, c.comprehension_score "
			+ "from tbl_comprehension c, tbl_teacherquestion t "
			+ "where c.teacherquestion_no = t.teacherquestion_no "
			+ "and c.teacherquestion_no = '1' order by mem_id) r "
			+ "on l.mem_id = r.mem_id")
	public List<String> listScore(String score) throws Exception;
	
	
	////tmp////////////////////////////////////////////////////////////////////////
	@Select("select m.mem_id, m.mem_name, clz_domain, course_gb "
			+ "from tbl_member m, "
			+ "(select * from tbl_course where clz_domain = #{domain} "
			+ "and course_gb = 'member_student' "
			+ "or course_gb = 'member_clz_president') temp "
			+ "where m.mem_id = temp.mem_id "
			+ "order by m.mem_id") 
	public List<JoinMemberVO> selectName(String domain) throws Exception;
	
	@Select("select t.teacherquestion_no, t.teacherquestion_content, clz_domain "
			+ "from tbl_teacherquestion t, tbl_curriculum c "
			+ "where t.curri_no = c.curri_no "
			+ "and c.clz_domain = #{domain} "
			+ "order by t.teacherquestion_no")
	public List<TQuestionScoreListVO> selectQuestion(String domain) throws Exception;
	
	@Select("select l.mem_id, mem_name, comprehension_score, teacherquestion_no "
			+ "from "
			+ "(select m.mem_id, m.mem_name from tbl_member m, "
			+ "(select * from tbl_course "
			+ "where clz_domain = #{domain}"
			+ "and course_gb = 'member_student' "
			+ "or course_gb = 'member_clz_president') temp "
			+ "where m.mem_id = temp.mem_id order by m.mem_id) l "
			+ "left join "
			+ "(select c.mem_id, c.comprehension_score, c.teacherquestion_no "
			+ "from tbl_comprehension c, tbl_teacherquestion t "
			+ "where c.teacherquestion_no = t.teacherquestion_no "
			+ "and c.teacherquestion_no = #{teacherqno} order by mem_id) r "
			+ "on l.mem_id = r.mem_id "
			+ "order by l.mem_id")
	public List<ScoreVO> selectScore(@Param("domain") String domain, @Param("teacherqno") int teacherqno) throws Exception;
	
	
	//특정반 특정ID 의 이해도
	@Select("select l.teacherquestion_no, l.teacherquestion_content, r.comprehension_score, r.mem_id, l.clz_domain"
	+ "from "
	+ "(select t.teacherquestion_no, t.teacherquestion_content, clz_domain "
	+ "from tbl_teacherquestion t, tbl_curriculum c "
	+ "where t.curri_no = c.curri_no "
	+ "and c.clz_domain = #{domain}) l "
	+ "left join "
	+ "(select t.teacherquestion_no, t.teacherquestion_content, c.comprehension_score, c.mem_id "
	+ "from tbl_comprehension c, tbl_teacherquestion t "
	+ "where c.teacherquestion_no = t.teacherquestion_no "
	+ "and c.clz_domain = #{domain} "
	+ "and c.mem_id = #{mem_id}) r "
	+ "on l.teacherquestion_no = r.teacherquestion_no "
	+ "order by l.teacherquestion_no")
	public List<ScoreVO> selectScoreByID(@Param("domain") String domain, @Param("mem_id") String mem_id) throws Exception;
	
	
	
	@SelectKey(before=false, keyProperty="teacherquestion_no", resultType=Integer.class, statement="select last_insert_id()")
	@Insert("insert into tbl_teacherquestion(curri_gpno, curri_no, teacherquestion_content) values(#{curri_gpno}, #{curri_no}, #{teacherquestion_content})")
	public void registQuestion(TeacherquestionVO vo);

	@SelectKey(before=false, keyProperty="comprehension_no", resultType=Integer.class, statement="select last_insert_id()")
	@Insert("insert into tbl_comprehension(teacherquestion_no, comprehension_score, mem_id, clz_domain) values(#{teacherquestion_no}, #{comprehension_score}, #{mem_id}, #{clz_domain})")
	public void registComprehension(ComprehensionVO vo);
	
	
//	select l.teacherquestion_no, l.teacherquestion_content, r.comprehension_score, r.mem_id, l.clz_domain, r.comprehension_replycnt
//	from
//	(
//	select t.teacherquestion_no, t.teacherquestion_content, clz_domain
//	from tbl_teacherquestion t, tbl_curriculum c
//	where t.curri_no = c.curri_no
//	and c.clz_domain = 'bit70'
//	) l left join
//	(
//	select t.teacherquestion_no, t.teacherquestion_content, c.comprehension_score, c.mem_id, c.comprehension_replycnt
//	from tbl_comprehension c, tbl_teacherquestion t
//	where c.teacherquestion_no = t.teacherquestion_no
//	and c.clz_domain = 'bit70' 
//	and c.mem_id = '김현빈'
//	) r
//	on l.teacherquestion_no = r.teacherquestion_no
//	order by l.teacherquestion_no;
	
	
}
