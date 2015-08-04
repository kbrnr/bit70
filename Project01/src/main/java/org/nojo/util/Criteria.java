package org.nojo.util;


public class Criteria {

	private int page;
	private int perPageNum;
	
	// select * from tbl_board order by bno desc limit 10, 10;
	public Criteria() {
		this.page=1;
		this.perPageNum=10;
	}
	
	public int getFirst(){
		return (this.page-1) * this.perPageNum ;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		if(page < 1){
			this.page = 1 ;
		}else {
			this.page = page;
		}
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}
