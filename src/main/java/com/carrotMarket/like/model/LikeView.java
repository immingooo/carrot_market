package com.carrotMarket.like.model;

import com.carrotMarket.usedGoods.model.UsedGoods;

public class LikeView {

	// 글 1개
	private UsedGoods usedGoods;
	
	// 글에 대한 좋아요 개수
	private int likeCount;
	
	// 글에 대한 채팅 개수
	private int chatRoomCount;

	public UsedGoods getUsedGoods() {
		return usedGoods;
	}

	public void setUsedGoods(UsedGoods usedGoods) {
		this.usedGoods = usedGoods;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getChatRoomCount() {
		return chatRoomCount;
	}

	public void setChatRoomCount(int chatRoomCount) {
		this.chatRoomCount = chatRoomCount;
	}
}
