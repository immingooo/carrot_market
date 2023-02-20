package com.carrotMarket.usedGoods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.carrotMarket.usedGoods.bo.UsedGoodsBO;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/used_goods")
public class UsedGoodsRestController {
	
	@Autowired
	private UsedGoodsBO usedGoodsBO;

	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam("title") String title,
			@RequestParam("category") String category,
			@RequestParam(value="price", required=false) Integer price,
			@RequestParam("content") String content,
			@RequestParam(value="place", required=false) String place,
			@RequestParam(value="images", required=false) List<MultipartFile> files,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		Integer userId = (Integer)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		
		if (userId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인을 해주세요");
			return result;
		}
		
		usedGoodsBO.addUsedGoods(userId, userLoginId, title, category, price, content, place, files);
		
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
	
	@PutMapping("/update")
	public Map<String, Object> update(
			@RequestParam("usedGoodsId") int usedGoodsId,
			@RequestParam("title") String title,
			@RequestParam("category") String category,
			@RequestParam(value="price", required=false) Integer price,
			@RequestParam("content") String content,
			@RequestParam(value="place", required=false) String place,
			@RequestParam(value="images", required=false) List<MultipartFile> files,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		Integer userId = (Integer)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		if (userId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인해주세요");
		}
		
		usedGoodsBO.update(userId, userLoginId, usedGoodsId, title, category, price, content, place, files);
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
}
