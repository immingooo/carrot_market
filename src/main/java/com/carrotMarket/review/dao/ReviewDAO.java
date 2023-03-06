package com.carrotMarket.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewDAO {

	public void insertReview(Map<String, Object> map);
	
	public int selectReviewByUsedGoodsId(int usedGoodsId);
	
	public void insertManner(
			@Param("reviewId") int reviewId, 
			@Param("mannerContentArray") List<String> mannerContentArray);
}
