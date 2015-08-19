package org.nojo.domain;

import java.util.Date;

public class AttachfileVO {

	//파일 번호
	private int attachfile_no;
	
	//파일경로	
	private String attachfile_path;
	
	//파일이름
	private String attachfile_name;
	
	//파일크기
	private long attachfile_size;
	
	//등록일
	private Date attachfile_reg_date;
	
		
	//region Getter Start
	public int getAttachfile_no() {
		return attachfile_no;
	}
	public String getAttachfile_path() {
		return attachfile_path;
	}
	public String getAttachfile_name() {
		return attachfile_name;
	}
	public long getAttachfile_size() {
		return attachfile_size;
	}
	public Date getAttachfile_reg_date() {
		return attachfile_reg_date;
	}
	//region End
	
	
	
	
	//region Setter Start
	public void setAttachfile_no(int attachfile_no) {
		this.attachfile_no = attachfile_no;
	}
	public void setAttachfile_path(String attachfile_path) {
		this.attachfile_path = attachfile_path;
	}
	public void setAttachfile_name(String attachfile_name) {
		this.attachfile_name = attachfile_name;
	}
	public void setAttachfile_size(long attachfile_size) {
		this.attachfile_size = attachfile_size;
	}
	public void setAttachfile_reg_date(Date attachfile_reg_date) {
		this.attachfile_reg_date = attachfile_reg_date;
	}
	//region End
	

}
