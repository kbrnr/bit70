package org.nojo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

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
}
