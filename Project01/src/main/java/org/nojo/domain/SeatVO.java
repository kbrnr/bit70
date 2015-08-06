package org.nojo.domain;

public class SeatVO {
	private String mem_id;
	private String clz_domain;
	private int seat_x;
	private int seat_y;
	private String mem_name;

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getClz_domain() {
		return clz_domain;
	}

	public void setClz_domain(String clz_domain) {
		this.clz_domain = clz_domain;
	}

	public int getSeat_x() {
		return seat_x;
	}

	public void setSeat_x(int seat_x) {
		this.seat_x = seat_x;
	}

	public int getSeat_y() {
		return seat_y;
	}

	public void setSeat_y(int seat_y) {
		this.seat_y = seat_y;
	}

	@Override
	public String toString() {
		return "SeatVO [mem_id=" + mem_id + ", clz_domain=" + clz_domain + ", seat_x=" + seat_x + ", seat_y=" + seat_y + ", mem_name=" + mem_name
				+ "]";
	}

	
}
