package org.nojo.bizDomain;

public class ScoreVO {

	private String clz_domain;
	private String mem_id;
	private String mem_name;
	private int comprehension_score;
	private int teacherquestion_no;
	private String teacherquestion_content;
	private int comprehension_replycnt;

	public String getClz_domain() {
		return clz_domain;
	}

	public void setClz_domain(String clz_domain) {
		this.clz_domain = clz_domain;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public int getComprehension_score() {
		return comprehension_score;
	}

	public void setComprehension_score(int comprehension_score) {
		this.comprehension_score = comprehension_score;
	}

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

	public int getComprehension_replycnt() {
		return comprehension_replycnt;
	}

	public void setComprehension_replycnt(int comprehension_replycnt) {
		this.comprehension_replycnt = comprehension_replycnt;
	}

	@Override
	public String toString() {
		return "ScoreVO [clz_domain=" + clz_domain + ", mem_id=" + mem_id + ", mem_name=" + mem_name
				+ ", comprehension_score=" + comprehension_score + ", teacherquestion_no=" + teacherquestion_no
				+ ", teacherquestion_content=" + teacherquestion_content + ", comprehension_replycnt="
				+ comprehension_replycnt + "]";
	}

}
