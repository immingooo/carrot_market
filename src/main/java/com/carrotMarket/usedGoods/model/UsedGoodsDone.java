package com.carrotMarket.usedGoods.model;

import java.util.Date;

public class UsedGoodsDone {

	private int id;
	private int usedGoodsId;
	private int buyerId;
	private Date createdAt;
	
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
	public int getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(int buyerId) {
		this.buyerId = buyerId;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
}
