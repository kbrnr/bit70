package org.nojo.domain;

import java.util.Date;

public class ReplyVO {

	private int reply_no;
	private String reply_content;
	private Date reply_reg_date;
	private int comprehension_no;
	private String reply_writer;

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
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

	public String getReply_writer() {
		return reply_writer;
	}

	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}

	@Override
	public String toString() {
		return "ReplyVO [reply_no=" + reply_no + ", reply_content=" + reply_content + ", reply_reg_date="
				+ reply_reg_date + ", comprehension_no=" + comprehension_no + ", reply_writer=" + reply_writer + "]";
	}

}
