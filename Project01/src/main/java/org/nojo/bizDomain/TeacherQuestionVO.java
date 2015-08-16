package org.nojo.bizDomain;

public class TeacherQuestionVO {

	private int teacherquestion_no ;
	private String teacherquestion_content ;
	private String clz_domain ;
	
	
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
	public String getClz_domain() {
		return clz_domain;
	}
	public void setClz_domain(String clz_domain) {
		this.clz_domain = clz_domain;
	}
	
	@Override
	public String toString() {
		return "TeacherQuestionVO [teacherquestion_no=" + teacherquestion_no
				+ ", teacherquestion_content=" + teacherquestion_content
				+ ", clz_domain=" + clz_domain + "]";
	}
	
	
	
	
}
