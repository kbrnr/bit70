package org.nojo.domain;

import java.util.Date;

public class CurriculumVO {
	private int curri_no;
	private String curri_name;
	private int curri_pno;
	private int curri_depth;
	private Date curri_reg_date;
	private Date curri_mod_date;
	private String clz_domain;
	private String mem_id;
	
	public int getCurri_no() {
		return curri_no;
	}
	public void setCurri_no(int curri_no) {
		this.curri_no = curri_no;
	}
	public String getCurri_name() {
		return curri_name;
	}
	public void setCurri_name(String curri_name) {
		this.curri_name = curri_name;
	}
	public int getCurri_pno() {
		return curri_pno;
	}
	public void setCurri_pno(int curri_pno) {
		this.curri_pno = curri_pno;
	}
	public int getCurri_depth() {
		return curri_depth;
	}
	public void setCurri_depth(int curri_depth) {
		this.curri_depth = curri_depth;
	}
	public Date getCurri_reg_date() {
		return curri_reg_date;
	}
	public void setCurri_reg_date(Date curri_reg_date) {
		this.curri_reg_date = curri_reg_date;
	}
	public Date getCurri_mod_date() {
		return curri_mod_date;
	}
	public void setCurri_mod_date(Date curri_mod_date) {
		this.curri_mod_date = curri_mod_date;
	}
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
	
	@Override
	public String toString() {
		return "CurriculumVO [curri_no=" + curri_no + ", curri_name="
				+ curri_name + ", curri_pno=" + curri_pno + ", curri_depth="
				+ curri_depth + ", curri_reg_date=" + curri_reg_date
				+ ", curri_mod_date=" + curri_mod_date + ", clz_domain="
				+ clz_domain + ", mem_id=" + mem_id + "]";
	}
}
