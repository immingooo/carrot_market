package com.carrotMarket.usedGoods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.carrotMarket.usedGoods.model.UsedGoods;
import com.carrotMarket.usedGoods.model.UsedGoodsDone;
import com.carrotMarket.usedGoods.model.UsedGoodsImage;

@Repository
public interface UsedGoodsDAO {
	
	public void insertUsedGoods(Map<String, Object> map);
	
	public void insertUsedGoodsImage(
			@Param("id") int id, 
			@Param("imagePathList") List<String> imagePathList);
	
	public void insertUsedGoodsDone(
			@Param("usedGoodsId") int usedGoodsId, 
			@Param("buyerId") int buyerId);
	
	public UsedGoodsDone selectUsedGoodsDoneByUsedGoodsId(int usedGoodsId);
	
	public UsedGoods selectUsedGoodsByUsedGoodsId(int usedGoodsId);
	
	public List<UsedGoodsImage> selectUsedGoodsImageListByUsedGoodsId(int usedGoodsId);
	
	public UsedGoodsImage selectUsedGoodsImageByUsedGoodsId(int usedGoodsId);
	
	public List<UsedGoods> selectUsedGoodsList();
	
	public UsedGoods selectUsedGoodsByUsedGoodsIdUserId(
			@Param("usedGoodsId") int usedGoodsId, 
			@Param("userId") int userId);
	
	public void updateUsedGoodsByUserIdUsedGoodsId(
			@Param("userId") int userId, 
			@Param("usedGoodsId") int usedGoodsId, 
			@Param("title") String title, 
			@Param("category") String category, 
			@Param("price") Integer price, 
			@Param("content") String content, 
			@Param("place") String place);
	
	public void deleteUsedGoodsImageByUsedGoodsId(int usedGoodsId);
	
	public void deleteUsedGoodsByUsedGoodsIdUserId(
			@Param("usedGoodsId") int usedGoodsId, 
			@Param("userId") int userId);
	
	public void updateViewCount(int usedGoodsId);
	
	public void updateSoldOut(
			@Param("usedGoodsId") int usedGoodsId, 
			@Param("userId") int userId);
	
	public List<UsedGoods> selectUsedGoodsListByKeyword(String keyword);
	
	public List<UsedGoods> selectUsedGoodsListByCategory(String category);
	
	public List<UsedGoods> selectUsedGoodsListByArea(String area);
}
