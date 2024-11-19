package com.example.sakila.vo;

import lombok.Data;

@Data
public class Page {
	private Integer currentPage;
	private Integer rowPerPage;
	private Integer numPerPage;
	
	public int getBeginRow() {
		return (this.currentPage-1)*this.rowPerPage;
	}
	public int getStartPage() {
		return (this.currentPage-1) / 10 * 10 +1;
	}
	
	public int getEndPage() {
		return this.getStartPage()+(this.numPerPage-1);
	}
	public int getLastPage(int totalRow) {
		int lastPage = totalRow / this.rowPerPage;
		if (totalRow % this.rowPerPage != 0) {
			lastPage++;
		}

		return lastPage;
	}
}
