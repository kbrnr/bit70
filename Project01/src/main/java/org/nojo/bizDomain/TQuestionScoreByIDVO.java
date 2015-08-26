package org.nojo.bizDomain;


public class TQuestionScoreByIDVO {

	private int teacherquestion_no;
	private String teacherquestion_content;
	private int comprehension_score;
	private String mem_id;
	private String clz_domain;

	public int getTeacherquestion_no() {
		return teacherquestion_no;
	}

	public void setTeacherquestion_no(int teacherquestion_no) {
		this.teacherquestion_no = teacherquestion_no;
	}

	public String getTeacherquestion_content() {
		return teacherquestion_content;
	}

	public void setTeacherquestion_content(String teacherquestion_content) {
		this.teacherquestion_content = teacherquestion_content;
	}

	public int getComprehension_score() {
		return comprehension_score;
	}

	public void setComprehension_score(int comprehension_score) {
		this.comprehension_score = comprehension_score;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getClz_domain() {
		return clz_domain;
	}

	public void setClz_domain(String clz_domain) {
		this.clz_domain = clz_domain;
	}

	@Override
	public String toString() {
		return "TQuestionScoreByIDVO [teacherquestion_no=" + teacherquestion_no
				+ ", teacherquestion_content=" + teacherquestion_content
				+ ", comprehension_score=" + comprehension_score + ", mem_id="
				+ mem_id + ", clz_domain=" + clz_domain + "]";
	}

}
