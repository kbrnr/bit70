package org.nojo.domain;

import java.util.Date;

public class AnswerVO {

	private int answer_no;
	private int question_no;
	private String answer_title;
	private String answer_content;
	private Date answer_reg_date;
	private boolean answer_visible;
	private int answer_recommend;
	private String clz_domain;
	private String mem_id;

	// region Getter Start
	public int getAnswer_no() {
		return answer_no;
	}

	public int getQuestion_no() {
		return question_no;
	}

	public String getAnswer_title() {
		return answer_title;
	}

	public String getAnswer_content() {
		return answer_content;
	}

	public Date getAnswer_reg_date() {
		return answer_reg_date;
	}

	public boolean getAnswer_visible() {
		return answer_visible;
	}

	public int getAnswer_recommend() {
		return answer_recommend;
	}

	public String getClz_domain() {
		return clz_domain;
	}

	public String getMem_id() {
		return mem_id;
	}
	//region End
	
	
	//region Setter Start
	public void setAnswer_no(int answer_no) {
		this.answer_no = answer_no;
	}

	public void setQuestion_no(int question_no) {
		this.question_no = question_no;
	}

	public void setAnswer_title(String answer_title) {
		this.answer_title = answer_title;
	}

	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}

	public void setAnswer_reg_date(Date answer_reg_date) {
		this.answer_reg_date = answer_reg_date;
	}

	public void setAnswer_visible(boolean answer_visible) {
		this.answer_visible = answer_visible;
	}

	public void setAnswer_recommend(int answer_recommend) {
		this.answer_recommend = answer_recommend;
	}

	public void setClz_domain(String clz_domain) {
		this.clz_domain = clz_domain;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	//region End
	
}
