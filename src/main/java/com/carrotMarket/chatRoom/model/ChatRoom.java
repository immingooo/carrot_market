package com.carrotMarket.chatRoom.model;

import java.util.Date;

public class ChatRoom {

	private int id;
	private int usedGoodsId;
	private int sellerId;
	private int buyerId;
	private String sellerNickname;
	private String sellerProfileImageUrl;
	private String buyerNickname;
	private String buyerProfileImageUrl;
	private String usedGoodsImageUrl;
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
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public int getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(int buyerId) {
		this.buyerId = buyerId;
	}
	public String getSellerNickname() {
		return sellerNickname;
	}
	public void setSellerNickname(String sellerNickname) {
		this.sellerNickname = sellerNickname;
	}
	public String getSellerProfileImageUrl() {
		return sellerProfileImageUrl;
	}
	public void setSellerProfileImageUrl(String sellerProfileImageUrl) {
		this.sellerProfileImageUrl = sellerProfileImageUrl;
	}
	public String getBuyerNickname() {
		return buyerNickname;
	}
	public void setBuyerNickname(String buyerNickname) {
		this.buyerNickname = buyerNickname;
	}
	public String getBuyerProfileImageUrl() {
		return buyerProfileImageUrl;
	}
	public void setBuyerProfileImageUrl(String buyerProfileImageUrl) {
		this.buyerProfileImageUrl = buyerProfileImageUrl;
	}
	public String getUsedGoodsImageUrl() {
		return usedGoodsImageUrl;
	}
	public void setUsedGoodsImageUrl(String usedGoodsImageUrl) {
		this.usedGoodsImageUrl = usedGoodsImageUrl;
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
