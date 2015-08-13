package org.nojo.domain;

import java.util.Arrays;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberVO {
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_email;
	private String mem_tel;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date mem_reg_date;
	private String mem_gb;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date mem_login_date;
	private byte[] mem_photo;

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
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

	public Date getMem_login_date() {
		return mem_login_date;
	}

	public void setMem_login_date(Date mem_login_date) {
		this.mem_login_date = mem_login_date;
	}

	public byte[] getMem_photo() {
		return mem_photo;
	}

	public void setMem_photo(byte[] mem_photo) {
		this.mem_photo = mem_photo;
	}

	@Override
	public String toString() {
		return "MemberVO [mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name + ", mem_email="
				+ mem_email + ", mem_tel=" + mem_tel + ", mem_reg_date=" + mem_reg_date + ", mem_gb=" + mem_gb
				+ ", mem_login_date=" + mem_login_date + ", mem_photo=" + Arrays.toString(mem_photo) + "]";
	}

}