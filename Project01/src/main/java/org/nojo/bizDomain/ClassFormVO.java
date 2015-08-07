package org.nojo.bizDomain;

import java.util.Arrays;
import java.util.Date;

public class ClassFormVO {
	private String clz_name;
	private String clz_domain;
	private String[] mem_id;
	private String[] mem_name;
	private String clz_room;
	private Date clz_start_date;
	private Date clz_end_date;
	private int clz_state;

	public String getClz_name() {
		return clz_name;
	}

	public void setClz_name(String clz_name) {
		this.clz_name = clz_name;
	}

	public String getClz_domain() {
		return clz_domain;
	}

	public void setClz_domain(String clz_domain) {
		this.clz_domain = clz_domain;
	}

	public String[] getMem_id() {
		return mem_id;
	}

	public void setMem_id(String[] mem_id) {
		this.mem_id = mem_id;
	}

	public String[] getMem_name() {
		return mem_name;
	}

	public void setMem_name(String[] mem_name) {
		this.mem_name = mem_name;
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

	@Override
	public String toString() {
		final int maxLen = 10;
		return "ClassFormVO [clz_name="
				+ clz_name
				+ ", clz_domain="
				+ clz_domain
				+ ", mem_id="
				+ (mem_id != null ? Arrays.asList(mem_id).subList(0,
						Math.min(mem_id.length, maxLen)) : null)
				+ ", mem_name="
				+ (mem_name != null ? Arrays.asList(mem_name).subList(0,
						Math.min(mem_name.length, maxLen)) : null)
				+ ", clz_room=" + clz_room + ", clz_start_date="
				+ clz_start_date + ", clz_end_date=" + clz_end_date
				+ ", clz_state=" + clz_state + "]";
	}

}
