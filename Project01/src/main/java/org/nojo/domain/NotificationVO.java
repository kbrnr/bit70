package org.nojo.domain;

import java.util.Date;

public class NotificationVO {
	
	private int noti_no;
	private String noti_service_name;
	private String noti_service_link;
	private String noti_sender_id;
	private String noti_receiver_id;
	private String noti_summation;
	private boolean noti_read_gb;
	private Date noti_regdate;
	private String clz_domain;

	public int getNoti_no() {
		return noti_no;
	}

	public void setNoti_no(int noti_no) {
		this.noti_no = noti_no;
	}

	public String getNoti_service_name() {
		return noti_service_name;
	}

	public void setNoti_service_name(String noti_service_name) {
		this.noti_service_name = noti_service_name;
	}

	public String getNoti_service_link() {
		return noti_service_link;
	}

	public void setNoti_service_link(String noti_service_link) {
		this.noti_service_link = noti_service_link;
	}

	public String getNoti_sender_id() {
		return noti_sender_id;
	}

	public void setNoti_sender_id(String noti_sender_id) {
		this.noti_sender_id = noti_sender_id;
	}

	public String getNoti_receiver_id() {
		return noti_receiver_id;
	}

	public void setNoti_receiver_id(String noti_receiver_id) {
		this.noti_receiver_id = noti_receiver_id;
	}

	public String getNoti_summation() {
		return noti_summation;
	}

	public void setNoti_summation(String noti_summation) {
		this.noti_summation = noti_summation;
	}

	public boolean isNoti_read_gb() {
		return noti_read_gb;
	}

	public void setNoti_read_gb(boolean noti_read_gb) {
		this.noti_read_gb = noti_read_gb;
	}

	public Date getNoti_regdate() {
		return noti_regdate;
	}

	public void setNoti_regdate(Date noti_regdate) {
		this.noti_regdate = noti_regdate;
	}

	public String getClz_domain() {
		return clz_domain;
	}

	public void setClz_domain(String clz_domain) {
		this.clz_domain = clz_domain;
	}

	@Override
	public String toString() {
		return "NotificationVO [noti_no=" + noti_no + ", noti_service_name=" + noti_service_name + ", noti_service_link=" + noti_service_link
				+ ", noti_sender_id=" + noti_sender_id + ", noti_receiver_id=" + noti_receiver_id + ", noti_summation=" + noti_summation
				+ ", noti_read_gb=" + noti_read_gb + ", noti_regdate=" + noti_regdate + ", clz_domain=" + clz_domain + "]";
	}

}
