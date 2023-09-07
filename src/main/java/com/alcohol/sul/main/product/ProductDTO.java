package com.alcohol.sul.main.product;

import java.util.List;

import com.alcohol.sul.main.product.review.ReviewDTO;

public class ProductDTO {
	
	private Long productNum;
	private String productName;
	private Long price;
	private String kind;
	private Double proof;
	private String contents;
	private Long stock;
	private String carbonicAcid;
	private String taste;
	private String base;
	private Double score;
	private Long savePoint;
	private Integer capacity;
	private String expiryDate;
	private String storageMethod;
	private List<ProductImgDTO> imgDTOs;
	private List<ReviewDTO> reviews;	
	private int productCount;
	private Long basketNum;
	
	
	
	public Integer getCapacity() {
		return capacity;
	}
	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getStorageMethod() {
		return storageMethod;
	}
	public void setStorageMethod(String storageMethod) {
		this.storageMethod = storageMethod;
	}
	public Long getBasketNum() {
		return basketNum;
	}
	public void setBasketNum(Long basketNum) {
		this.basketNum = basketNum;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public List<ReviewDTO> getReviews() {
		return reviews;
	}
	public void setReviews(List<ReviewDTO> reviews) {
		this.reviews = reviews;
	}
	public List<ProductImgDTO> getImgDTOs() {
		return imgDTOs;
	}
	public void setImgDTOs(List<ProductImgDTO> imgDTOs) {
		this.imgDTOs = imgDTOs;
	}

	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public Double getProof() {
		return proof;
	}
	public void setProof(Double proof) {
		this.proof = proof;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Long getStock() {
		return stock;
	}
	public void setStock(Long stock) {
		this.stock = stock;
	}
	public String getCarbonicAcid() {
		return carbonicAcid;
	}
	public void setCarbonicAcid(String carbonicAcid) {
		this.carbonicAcid = carbonicAcid;
	}
	public String getTaste() {
		return taste;
	}
	public void setTaste(String taste) {
		this.taste = taste;
	}
	public String getBase() {
		return base;
	}
	public void setBase(String base) {
		this.base = base;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	public Long getSavePoint() {
		return savePoint;
	}
	public void setSavePoint(Long savePoint) {
		this.savePoint = savePoint;
	}
	
	
}
