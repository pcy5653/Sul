package com.alcohol.sul.main.product.review;

import java.sql.Date;
import java.util.List;



public class ReviewDTO {

	private Long reviewNum;   
	private String id;
	private Long productNum;
	private String productName;
	private String reviewContents;
	private Integer reviewStar;
	private Date reviewTime;	
	private List<ReviewFileDTO> reviewFileDTOs;
	
	
	
	
	
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public List<ReviewFileDTO> getReviewFileDTOs() {
		return reviewFileDTOs;
	}
	public void setReviewFileDTOs(List<ReviewFileDTO> reviewFileDTOs) {
		this.reviewFileDTOs = reviewFileDTOs;
	}
	public Long getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(Long reviewNum) {
		this.reviewNum = reviewNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public String getReviewContents() {
		return reviewContents;
	}
	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}
	public Integer getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(Integer reviewStar) {
		this.reviewStar = reviewStar;
	}
	public Date getReviewTime() {
		return reviewTime;
	}
	public void setReviewTime(Date reviewTime) {
		this.reviewTime = reviewTime;
	}
	
	
	
}
