package com.carrotMarket.main.model;

import java.util.List;

import com.carrotMarket.usedGoods.model.UsedGoods;
import com.carrotMarket.usedGoods.model.UsedGoodsDone;
import com.carrotMarket.usedGoods.model.UsedGoodsImage;
import com.carrotMarket.user.model.User;

public class PostView {

	// 글쓴이 정보
	private User user;
	
	// 글 1개
	private UsedGoods usedGoods;

	// 글에 대한 사진 여러개 - list
	private List<UsedGoodsImage> usedGoodsImageList;
	
	// 내가(로그인 된 사람) 좋아요를 눌렀는지(boolean)
	private boolean filledLike;
	
	// 좋아요 개수
	private int likeCount;
	
	// 거래완료됐는지
	private UsedGoodsDone usedGoodsDone;
	
	// 채팅 개수
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UsedGoods getUsedGoods() {
		return usedGoods;
	}

	public void setUsedGoods(UsedGoods usedGoods) {
		this.usedGoods = usedGoods;
	}

	public List<UsedGoodsImage> getUsedGoodsImageList() {
		return usedGoodsImageList;
	}

	public void setUsedGoodsImageList(List<UsedGoodsImage> usedGoodsImageList) {
		this.usedGoodsImageList = usedGoodsImageList;
	}

	public boolean isFilledLike() {
		return filledLike;
	}

	public void setFilledLike(boolean filledLike) {
		this.filledLike = filledLike;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public UsedGoodsDone getUsedGoodsDone() {
		return usedGoodsDone;
	}

	public void setUsedGoodsDone(UsedGoodsDone usedGoodsDone) {
		this.usedGoodsDone = usedGoodsDone;
	}
}
