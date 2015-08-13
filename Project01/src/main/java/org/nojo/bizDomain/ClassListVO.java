package org.nojo.bizDomain;

import java.util.Date;
import java.util.List;

import org.nojo.domain.MemberVO;
import org.springframework.format.annotation.DateTimeFormat;

public class ClassListVO {
	private String clz_name;
	private String clz_domain;
	private String clz_room;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date clz_start_date;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date clz_end_date;
	private int clz_state;
	private List<MemberVO> teacherlist;

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

	public List<MemberVO> getTeacherlist() {
		return teacherlist;
	}

	public void setTeacherlist(List<MemberVO> teacherlist) {
		this.teacherlist = teacherlist;
	}

	@Override
	public String toString() {
		final int maxLen = 10;
		return "ClassListVO [clz_name="
				+ clz_name
				+ ", clz_domain="
				+ clz_domain
				+ ", clz_room="
				+ clz_room
				+ ", clz_start_date="
				+ clz_start_date
				+ ", clz_end_date="
				+ clz_end_date
				+ ", clz_state="
				+ clz_state
				+ ", teacherlist="
				+ (teacherlist != null ? teacherlist.subList(0,
						Math.min(teacherlist.size(), maxLen)) : null) + "]";
	}
	
}
