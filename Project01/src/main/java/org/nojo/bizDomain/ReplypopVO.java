package org.nojo.bizDomain;

import java.util.Date;

public class ReplypopVO {

	public String reply_writer;
	public String mem_name;
	public String reply_content;
	public Date reply_reg_date;
	public int comprehension_no;
	public String clz_domain;

	public String getReply_writer() {
		return reply_writer;
	}

	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Date getReply_reg_date() {
		return reply_reg_date;
	}

	public void setReply_reg_date(Date reply_reg_date) {
		this.reply_reg_date = reply_reg_date;
	}

	public int getComprehension_no() {
		return comprehension_no;
	}

	public void setComprehension_no(int comprehension_no) {
		this.comprehension_no = comprehension_no;
	}

	public String getClz_domain() {
		return clz_domain;
	}

	public void setClz_domain(String clz_domain) {
		this.clz_domain = clz_domain;
	}

	@Override
	public String toString() {
		return "ReplypopVO [reply_writer=" + reply_writer + ", mem_name=" + mem_name + ", reply_content="
				+ reply_content + ", reply_reg_date=" + reply_reg_date + ", comprehension_no=" + comprehension_no
				+ ", clz_domain=" + clz_domain + "]";
	}

}
