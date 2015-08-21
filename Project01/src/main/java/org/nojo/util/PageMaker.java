package org.nojo.util;

public class PageMaker {

	private int page;
	private int totalCount;
	
	private int perPageNum = 10;	
	private int displayNum = 10;
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	public PageMaker(int page, int totalCount){
		this.page = page;
		this.totalCount = totalCount;
		calc();
	}
	public PageMaker(Criteria cri, int totalCount){
		this.page = cri.getPage();
		this.perPageNum = cri.getPerPageNum();
		this.totalCount = totalCount;
		calc();
	}
	private void calc(){
		
		endPage = (int)(Math.ceil(page/(double)10)) * displayNum;		
		startPage = endPage - (displayNum -1);
		
		if(endPage * perPageNum < totalCount){
			next = true;
		}else{
			endPage = (int)(Math.ceil(totalCount/(double)perPageNum));
		}
		
		if(startPage != 1){
			prev = true;
		}
		
	}
	public int getPage() {
		return page;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public int getDisplayNum() {
		return displayNum;
	}
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}
	

}
