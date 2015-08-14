package org.nojo.bizDomain;

import java.util.Arrays;
import java.util.Date;

public class JoinMemberVO {

	private String mem_id;
	private String mem_name;
	private String mem_email;
	private String mem_tel;
	private Date mem_reg_date;
	private String mem_gb;

	private byte[] mem_photo;
	private String clz_domain;
	private int course_state;
	private String course_gb;
	private Date course_reg_date;
	private int team_no;

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

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_tel() {
		return mem_tel;
	}

	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}

	public Date getMem_reg_date() {
		return mem_reg_date;
	}

	public void setMem_reg_date(Date mem_reg_date) {
		this.mem_reg_date = mem_reg_date;
	}

	public String getMem_gb() {
		return mem_gb;
	}

	public void setMem_gb(String mem_gb) {
		this.mem_gb = mem_gb;
	}

	public byte[] getMem_photo() {
		return mem_photo;
	}

	public void setMem_photo(byte[] mem_photo) {
		this.mem_photo = mem_photo;
	}

	public String getClz_domain() {
		return clz_domain;
	}

	public void setClz_domain(String clz_domain) {
		this.clz_domain = clz_domain;
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
		return "JoinMemberVO [mem_id=" + mem_id + ", mem_name=" + mem_name + ", mem_email=" + mem_email + ", mem_tel="
				+ mem_tel + ", mem_reg_date=" + mem_reg_date + ", mem_gb=" + mem_gb + ", mem_photo="
				+ Arrays.toString(mem_photo) + ", clz_domain=" + clz_domain + ", course_state=" + course_state
				+ ", course_gb=" + course_gb + ", course_reg_date=" + course_reg_date + ", team_no=" + team_no + "]";
	}

}
