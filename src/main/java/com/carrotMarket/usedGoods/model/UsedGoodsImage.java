package com.carrotMarket.usedGoods.model;

import java.util.Date;

public class UsedGoodsImage {

	private int id;
	private int usedGoodsId;
	private String imageUrl;
	private Date createdAt;
	private Date updatedAt;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUsedGoodsId() {
		return usedGoodsId;
	}
	public void setUsedGoodsId(int usedGoodsId) {
		this.usedGoodsId = usedGoodsId;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
}
