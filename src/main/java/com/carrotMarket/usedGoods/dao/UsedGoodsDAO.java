package com.carrotMarket.usedGoods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UsedGoodsDAO {
	
	public void insertUsedGoods(Map<String, Object> map);
	
	public void insertUsedGoodsImage(
			@Param("id") int id, 
			@Param("imagePathList") List<String> imagePathList);
}
