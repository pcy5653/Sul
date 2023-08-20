package com.alcohol.sul.util; 

public class Pager {
	
	//검색
	private String kind;
	private String search;
	
	
	private Long startRow;
	private Long lastRow;
	
	private Long page;
	private Long perPage; 
	private Long totalPage;
	private Long startNum;
	private Long lastNum;
	private boolean pre; 
	private boolean next; 
	
	public void makePageNum(Long total) {
		
		this.totalPage = total/this.getPerPage();
		if(total%this.getPerPage()!=0) {
			this.totalPage++; 
			}
		
		long perBlock=5;
		
		long totalBlock = this.totalPage/perBlock;
		if(this.totalPage%perBlock != 0) {
			totalBlock++;
		}
		
		
		long curBlock = this.getPage()/perBlock;
		
		if(this.getPage()%perBlock != 0) {
			curBlock++;
		}
		
		this.startNum= (curBlock-1)*perBlock+1;
		this.lastNum= curBlock*perBlock;
		
		
		if(curBlock>1) {
			this.pre=true;
		}
		
		
		if(curBlock<totalBlock) {
			this.next=true;
		}
		
		if(!this.next) {
			this.lastNum=totalPage;
		}
		
	}
	
	public void makeRowNum() {
		this.startRow=(this.getPage()-1)*this.getPerPage()+1;
		this.lastRow=this.getPage()*this.getPerPage();
	}
	
	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getSearch() {
		if(this.search==null) {
			this.search=""; 
		}
		
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
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

	public Long getTotalPage() {
		return totalPage;
	}



	public void setTotalPage(Long totalPage) {
		this.totalPage = totalPage;
	}



	public Long getPage() {
		if(this.page==null) {
			this.page=1L;
		}
		return page;
	}

	public void setPage(Long page) {
		this.page = page;
	}

	public Long getPerPage() {
		if(this.perPage==null) {
			this.perPage=10L;
		}
		return perPage;
	}

	public void setPerPage(Long perPage) {
		this.perPage = perPage;
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
	
	
	
}
