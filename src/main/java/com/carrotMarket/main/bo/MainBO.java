package com.carrotMarket.main.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrotMarket.main.model.PostView;
import com.carrotMarket.usedGoods.bo.UsedGoodsBO;
import com.carrotMarket.usedGoods.model.UsedGoods;

@Service
public class MainBO {
	
	@Autowired
	private UsedGoodsBO usedGoodsBO;

	public List<PostView> generatePostViewList(String keyword, String category) {
		List<PostView> postViewList = new ArrayList<>();
		
		List<UsedGoods> usedGoodsList;
		if (keyword != null) {
			usedGoodsList = usedGoodsBO.getUsedGoodsListByKeyword(keyword);
		} else if (category != null) {
			usedGoodsList = usedGoodsBO.getUsedGoodsListByCategory(category);
		} else {
			usedGoodsList = usedGoodsBO.getUsedGoodsList();
		}
		
		for (UsedGoods usedGoods : usedGoodsList) {
			PostView postView = usedGoodsBO.generatePostView(usedGoods.getId(), null); // 비로그인 회원도 메인화면접속가능
		
			postViewList.add(postView);
		}
		
		return postViewList;
	}
}
