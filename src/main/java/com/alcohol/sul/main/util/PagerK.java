package com.alcohol.sul.main.util;


public class PagerK {
	
	//검색
	private String kind;
	private String search;

	private Long startRow;
	private Long lastRow;
	
	private Long page;
	
	//한페이지에 보여질 data(row)의 갯수
	private Long perPage;
	
	//총 페이지의 갯수
	private Long totalPage;
	
	//시작번호
	private Long startNum;
	
	//끝번호
	private Long lastNum;
	
	//이전블럭활성화
	private boolean pre; //false -> 1번 block, true -> 1번 아님
	
	//다음블럭 활성화
	private boolean next; //false -> 마지막블럭, true -> 마지막블럭
	
	private Long total;
	
	public void makePageNum(Long total) {
		this.total = total;
		
		//130 -> 13
		//131 ~ 139 -> 14
		//90 -> 9
		//91 ~ 99 -> 10
		
		//1. 전체 갯수로 전체페이지 수 구하기
		this.totalPage = total/this.getPerPage();
		if(total%this.getPerPage() != 0) {
			this.totalPage++;
		}
		
		//2. 전체 페이지수로 전체 block 수 구하기
		long perBlock = 5; // 한페이지에 출력할 번호의 갯수
		
		long totalBlock = this.totalPage / perBlock;
		if(this.totalPage%perBlock != 0) {
			totalBlock++;
		}
		
		//3. 현재 페이지번호로 블럭번호 구하기
		long curBlock = this.getPage() / perBlock; //현재 블럭번호
		if(this.getPage()%perBlock != 0) {
			curBlock++;
		}
		
		//4. 현재 블럭번호의 시작번호와 끝번호 구하기
		// curBlock   startNum   lastNum
		// 1          1          5
		// 2          6          10
		// 3          11         15
		this.startNum = (curBlock - 1)*perBlock + 1;
		this.lastNum = curBlock * perBlock;
		
		//이전 블럭 활성화 여부
		if(curBlock > 1) {
			this.pre = true;
		}
		
		//다음 블럭 활성화 여부
		if(curBlock < totalBlock) {
			this.next = true;
		}
		
		//현재 블럭이 마지막 블럭일때 lastNum을 totalPage숫자로 대입
		//if(curBlock == totalBlock) {
		if(!this.next) {	
			this.lastNum = totalPage;
		}
	}

	public void makeRowNum() {
		this.startRow = (this.getPage() - 1) * this.getPerPage() + 1;
		this.lastRow = this.getPage() * this.getPerPage();
	}

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
		if(this.page == null) {
			this.page = 1L;
		}
		return page;
	}

	public void setPage(Long page) {
		this.page = page;
	}

	public Long getPerPage() {
		if(this.perPage == null) {
			this.perPage = 12L;
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
		if(this.search == null) {
			this.search = "";
		}
		return search;
		//return "%"+search+"%"; -> mapper.xml를 #{search}로 사용, jsp를 ${param.kind}, ${param.search}
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}
}