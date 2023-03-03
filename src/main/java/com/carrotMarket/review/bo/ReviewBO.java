package com.carrotMarket.review.bo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrotMarket.review.dao.ReviewDAO;

@Service
public class ReviewBO {
	
	@Autowired
	private ReviewDAO reviewDAO;

	public int addReview(int usedGoodsId, int userId, String rating, String reviewContent) {
		Map<String, Object> map = new HashMap<>();
		map.put("usedGoodsId", usedGoodsId);
		map.put("userId", userId);
		map.put("rating", rating);
		map.put("reviewContent", reviewContent);
		
		reviewDAO.insertReview(map);
		int id = (int)map.get("id");
		
		return id;
	}
	
	public void addManner(int reviewId, List<String> mannerContentArray) {
		reviewDAO.insertManner(reviewId, mannerContentArray);
	}
}
