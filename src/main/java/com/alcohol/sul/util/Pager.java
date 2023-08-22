package com.alcohol.sul.util;

public class Pager {
	private Long startRow;		// data 첫번째 번호
	private Long lastRow;		// data 마지막 번호
	private Long page;			// 페이지 번호
	private Long perPage;		// 한 페이지당 보여줄 갯수
	private Long totalPage;		// 총 페이지 갯수	
	private Long startNum;		// 해당 페이지의 첫번째 번호
	private Long lastNum;		// 해당 페이지의 마지막 번호
	private boolean pre;		// 이전 btn [true=중간블럭 | false=첫블럭]
	private boolean next;		// 다음 btn [true=중간블럭 | false=마지막블럭]
	private String kind;		// 검색 분류
	private String search;		// 검색 내용
	
	
	
	
	
	public Long getStartRow() {
		return startRow;
	}
	public void setStartRow(Long startRow) {
		this.startRow = startRow;
	}
	public Long getLastRow() {
		return lastRow;
	}
	public void setLastRow(Long lastRow) {
		this.lastRow = lastRow;
	}
	public Long getPage() {
		if(this.page==null) {	// 1page
			this.page=1L;		
		}
		return page;
	}
	public void setPage(Long page) {
		this.page = page;
	}
	public Long getPerPage() {
		if(this.perPage==null) {	// 게시글 10개
			this.perPage=10L;
		}
		return perPage;
	}
	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}
	public Long getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Long totalPage) {
		this.totalPage = totalPage;
	}
	public Long getStartNum() {
		return startNum;
	}
	public void setStartNum(Long startNum) {
		this.startNum = startNum;
	}
	public Long getLastNum() {
		return lastNum;
	}
	public void setLastNum(Long lastNum) {
		this.lastNum = lastNum;
	}
	public boolean isPre() {
		return pre;
	}
	public void setPre(boolean pre) {
		this.pre = pre;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getSearch() {
		if(search==null) {		// LIKE %% 실행위해 빈칸 기본 
			this.search="";
		}
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
}
