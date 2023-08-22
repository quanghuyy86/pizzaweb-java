package com.devpro.javaweb.dto;

public class ProductSearch {
	private String keyword;
	private Integer categoryId;
	
	private Integer currentPage;
	
	
	public Integer getCurrentPage() { 
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	
	
}
