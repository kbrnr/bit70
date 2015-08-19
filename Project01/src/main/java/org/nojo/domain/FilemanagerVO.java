package org.nojo.domain;

public class FilemanagerVO {
	
	
	//tbl_filemanager VO
	private int curri_no;
	
	//tbl_question_filemanager VO
	private int question_no;
	
	//tbl_answer_filemanager VO
	private int answer_no;
	
	//common VO
	private Integer attachfile_no;
	private String clz_domain;
	
	//
	private String attachfile_name;
	private String attachfile_path;
	
	
	
	public String getAttachfile_name() {
		return attachfile_name;
	}

	public void setAttachfile_name(String attachfile_name) {
		this.attachfile_name = attachfile_name;
	}

	public String getAttachfile_path() {
		return attachfile_path;
	}

	public void setAttachfile_path(String attachfile_path) {
		this.attachfile_path = attachfile_path;
	}

	//region Getter Start
	public int getCurri_no() {
		return curri_no;
	}

	public Integer getAttachfile_no() {
		return attachfile_no;
	}

	public String getClz_domain() {
		return clz_domain;
	}

	public int getQuestion_no() {
		return question_no;
	}

	public int getAnswer_no() {
		return answer_no;
	}
	//region End

	
	
	//region Setter Start
	public void setCurri_no(int curri_no) {
		this.curri_no = curri_no;
	}

	public void setAttachfile_no(Integer attachfile_no) {
		this.attachfile_no = attachfile_no;
	}

	public void setClz_domain(String clz_domain) {
		this.clz_domain = clz_domain;
	}

	public void setQuestion_no(int question_no) {
		this.question_no = question_no;
	}

	public void setAnswer_no(int answer_no) {
		this.answer_no = answer_no;
	}
	//region End
	
	
}
