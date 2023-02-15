package com.carrotMarket.main.model;

import com.carrotMarket.usedGoods.model.UsedGoods;
import com.carrotMarket.user.model.User;

public class PostView {

	// 글쓴이 정보
	private User user;
	
	// 글 1개
	private UsedGoods usedGoods;

	// 글에 대한 사진 여러개
	
	
	// 내가(로그인 된 사람) 좋아요를 눌렀는지(boolean)
	
	// 좋아요 개수
	
	// 조회수
	
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
	
}