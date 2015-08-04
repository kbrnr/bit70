package org.nojo.util;

public class Search {
	//Search 클래스 K/V값으로 찾는다.
	
	
	private int id;
	
	private String[] searchKey;
	private String searchValue;
	
	
	@Override
	public String toString() {
		return "Search [id=" + id + ", searchKey=" + searchKey
				+ ", searchValue=" + searchValue + "]";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String[] getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String[] searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	
	
	
	

}
