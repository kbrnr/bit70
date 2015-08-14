package org.nojo.domain;

public class FilemanagerVO {
	
	
	//tbl_filemanager VO
	private int curri_no;
	
	//tbl_question_filemanager VO
	private int question_no;
	
	//tbl_answer_filemanager VO
	private int answer_no;
	
	//common VO
	private int attachfile_no;
	private String clz_domain;
	

	
	
	
	//region Getter Start
	public int getCurri_no() {
		return curri_no;
	}

	public int getAttachfile_no() {
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

	public void setAttachfile_no(int attachfile_no) {
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
