package com.carrotMarket.usedGoods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.carrotMarket.usedGoods.model.UsedGoods;
import com.carrotMarket.usedGoods.model.UsedGoodsImage;

@Repository
public interface UsedGoodsDAO {
	
	public void insertUsedGoods(Map<String, Object> map);
	
	public void insertUsedGoodsImage(
			@Param("id") int id, 
			@Param("imagePathList") List<String> imagePathList);
	
	public UsedGoods selectUsedGoodsByUsedGoodsId(int usedGoodsId);
	
	public List<UsedGoodsImage> selectUsedGoodsImageByUsedGoodsId(int usedGoodsId);
}
