package com.carrotMarket.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.carrotMarket.like.model.Like;

@Repository
public interface LikeDAO {

	public boolean existLike (
			@Param("usedGoodsId") int usedGoodsId, 
			@Param("userId") Integer userId);
	
	public void deleteLikeByUsedGoodsIdUserId(
			@Param("usedGoodsId") int usedGoodsId, 
			@Param("userId") int userId);
	
	public void insertLike(
			@Param("usedGoodsId") int usedGoodsId, 
			@Param("userId") int userId);
	
	public int selectLikeCountByUsedGoodsId(int usedGoodsId);
	
	public void deleteLikeByUsedGoodsId(int usedGoodsId);
	
	public List<Like> selectLikeByUserId(int userId);
}
