package com.carrotMarket.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.carrotMarket.review.bo.ReviewBO;

import javax.servlet.http.HttpSession;

@RestController
public class ReviewRestController {
	
	@Autowired
	private ReviewBO reviewBO;

	@PostMapping("/review/create")
	public Map<String, Object> create(
			@RequestParam("usedGoodsId") int usedGoodsId,
			@RequestParam("rating") String rating,
			@RequestParam("chkArray[]") List<String> mannerContentArray,
			@RequestParam(value="reviewContent", required=false) String reviewContent,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인해주세요");
		}
		
		// review DB insert
		int reviewId = reviewBO.addReview(usedGoodsId, userId, rating, reviewContent);
		
		// manner DB insert
		reviewBO.addManner(reviewId, mannerContentArray);
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
}
