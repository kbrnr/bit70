package org.nojo.domain;

import java.util.Date;

public class CourseVO {
	private String clz_domain;
	private String mem_id;
	private int course_state;
	private String course_gb;
	private Date course_reg_date;
	private int team_no;
	
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
	public int getCourse_state() {
		return course_state;
	}
	public void setCourse_state(int course_state) {
		this.course_state = course_state;
	}
	public String getCourse_gb() {
		return course_gb;
	}
	public void setCourse_gb(String course_gb) {
		this.course_gb = course_gb;
	}
	public Date getCourse_reg_date() {
		return course_reg_date;
	}
	public void setCourse_reg_date(Date course_reg_date) {
		this.course_reg_date = course_reg_date;
	}
	public int getTeam_no() {
		return team_no;
	}
	public void setTeam_no(int team_no) {
		this.team_no = team_no;
	}
	
	@Override
	public String toString() {
		return "CourseVO [clz_domain=" + clz_domain + ", mem_id=" + mem_id
				+ ", course_state=" + course_state + ", course_gb=" + course_gb
				+ ", course_reg_date=" + course_reg_date + ", team_no="
				+ team_no + "]";
	}
	

}
