package org.nojo.domain;

import java.util.Date;

public class ComprehensionVO {
	private int comprehension_no;
	private int curri_no;
	private int comprehension_score;
	private Date comprehension_reg_date;
	private String clz_domain;
	private String mem_id;

	public int getComprehension_no() {
		return comprehension_no;
	}
	public void setComprehension_no(int comprehension_no) {
		this.comprehension_no = comprehension_no;
	}
	public int getCurri_no() {
		return curri_no;
	}
	public void setCurri_no(int curri_no) {
		this.curri_no = curri_no;
	}
	public int getComprehension_score() {
		return comprehension_score;
	}
	public void setComprehension_score(int comprehension_score) {
		this.comprehension_score = comprehension_score;
	}
	public Date getComprehension_reg_date() {
		return comprehension_reg_date;
	}
	public void setComprehension_reg_date(Date comprehension_reg_date) {
		this.comprehension_reg_date = comprehension_reg_date;
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
		return "ComprehensionVO [comprehension_no=" + comprehension_no
				+ ", curri_no=" + curri_no + ", comprehension_score="
				+ comprehension_score + ", comprehension_reg_date="
				+ comprehension_reg_date + ", clz_domain=" + clz_domain
				+ ", mem_id=" + mem_id + "]";
	}
}
