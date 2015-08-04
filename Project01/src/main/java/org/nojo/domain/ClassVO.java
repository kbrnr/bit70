package org.nojo.domain;

import java.util.Date;

public class ClassVO {
	private String clz_domain;
	private String clz_name;
	private String clz_room;
	private Date clz_start_date;
	private Date clz_end_date;
	private int clz_state;
	private Date clz_reg_date;
	
	public String getClz_domain() {
		return clz_domain;
	}
	public void setClz_domain(String clz_domain) {
		this.clz_domain = clz_domain;
	}
	public String getClz_name() {
		return clz_name;
	}
	public void setClz_name(String clz_name) {
		this.clz_name = clz_name;
	}
	public String getClz_room() {
		return clz_room;
	}
	public void setClz_room(String clz_room) {
		this.clz_room = clz_room;
	}
	public Date getClz_start_date() {
		return clz_start_date;
	}
	public void setClz_start_date(Date clz_start_date) {
		this.clz_start_date = clz_start_date;
	}
	public Date getClz_end_date() {
		return clz_end_date;
	}
	public void setClz_end_date(Date clz_end_date) {
		this.clz_end_date = clz_end_date;
	}
	public int getClz_state() {
		return clz_state;
	}
	public void setClz_state(int clz_state) {
		this.clz_state = clz_state;
	}
	public Date getClz_reg_date() {
		return clz_reg_date;
	}
	public void setClz_reg_date(Date clz_reg_date) {
		this.clz_reg_date = clz_reg_date;
	}

	@Override
	public String toString() {
		return "ClassVO [clz_domain=" + clz_domain + ", clz_name=" + clz_name + ", clz_room=" + clz_room + ", clz_start_date=" + clz_start_date
				+ ", clz_end_date=" + clz_end_date + ", clz_state=" + clz_state + ", clz_reg_date=" + clz_reg_date + "]";
	}
}
