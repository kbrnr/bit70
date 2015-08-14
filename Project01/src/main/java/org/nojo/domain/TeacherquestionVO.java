package org.nojo.domain;

public class TeacherquestionVO {

	private int teacherquestion_no;
	private int curri_no;
	private int curri_gpno;
	private String teacherquestion_content;
	private String teacherquestion_reg_date;
	
	public int getTeacherquestion_no() {
		return teacherquestion_no;
	}
	public void setTeacherquestion_no(int teacherquestion_no) {
		this.teacherquestion_no = teacherquestion_no;
	}
	public int getCurri_no() {
		return curri_no;
	}
	public void setCurri_no(int curri_no) {
		this.curri_no = curri_no;
	}
	public int getCurri_gpno() {
		return curri_gpno;
	}
	public void setCurri_gpno(int curri_gpno) {
		this.curri_gpno = curri_gpno;
	}
	public String getTeacherquestion_content() {
		return teacherquestion_content;
	}
	public void setTeacherquestion_content(String teacherquestion_content) {
		this.teacherquestion_content = teacherquestion_content;
	}
	public String getTeacherquestion_reg_date() {
		return teacherquestion_reg_date;
	}
	public void setTeacherquestion_reg_date(String teacherquestion_reg_date) {
		this.teacherquestion_reg_date = teacherquestion_reg_date;
	}

	@Override
	public String toString() {
		return "TeacherquestionVO [teacherquestion_no=" + teacherquestion_no
				+ ", curri_no=" + curri_no + ", curri_gpno=" + curri_gpno
				+ ", teacherquestion_content=" + teacherquestion_content
				+ ", teacherquestion_reg_date=" + teacherquestion_reg_date
				+ "]";
	}
}
