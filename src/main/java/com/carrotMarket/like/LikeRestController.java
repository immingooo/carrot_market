package com.carrotMarket.like;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.carrotMarket.like.bo.LikeBO;

import javax.servlet.http.HttpSession;

@RestController
public class LikeRestController {
	
	@Autowired
	private LikeBO likeBO;

	/**
	 * 좋아요 API
	 * @param usedGoodsId
	 * @param session
	 * @return
	 */
	@GetMapping("/like/{usedGoodsId}")
	public Map<String, Object> like(
			@PathVariable int usedGoodsId,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인 해주세요.");
			return result;
		}
		
		likeBO.likeToggle(usedGoodsId, userId);
		
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
}
