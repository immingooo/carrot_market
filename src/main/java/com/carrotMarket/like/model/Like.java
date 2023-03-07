package com.carrotMarket.like.model;

import java.util.Date;

public class Like {

	private int userId;
	private int usedGoodsId;
	private Date createdAt;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getUsedGoodsId() {
		return usedGoodsId;
	}
	public void setUsedGoodsId(int usedGoodsId) {
		this.usedGoodsId = usedGoodsId;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
}
