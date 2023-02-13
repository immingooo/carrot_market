package com.carrotMarket.usedGoods.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.carrotMarket.usedGoods.model.UsedGoods;

@Repository
public interface UsedGoodsDAO {

	public UsedGoods insertUsedGoods(
			@Param("userId") int userId, 
			@Param("title") String title, 
			@Param("category") String category, 
			@Param("price") Integer price, 
			@Param("content") String content, 
			@Param("place") String place);
	
	//public UsedGoods selectUsedGoods(int userId);
}
