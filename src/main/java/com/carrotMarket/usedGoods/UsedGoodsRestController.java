package com.carrotMarket.usedGoods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.carrotMarket.chatRoom.bo.ChatRoomBO;
import com.carrotMarket.usedGoods.bo.UsedGoodsBO;
import com.carrotMarket.usedGoods.model.UsedGoodsImage;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/used_goods")
public class UsedGoodsRestController {
	
	@Autowired
	private UsedGoodsBO usedGoodsBO;
	
	@Autowired
	private ChatRoomBO chatRoomBO;

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
			return result;
		}
		
		// DB update - usedGoods, usedGoodsImage DB update
		usedGoodsBO.updateUsedGoods(userId, userLoginId, usedGoodsId, title, category, price, content, place, files);
		
		// update된 사진들 중 첫번째 사진 가져오기
		UsedGoodsImage usedGoodsImage = usedGoodsBO.getUsedGoodsImageByUsedGoodsId(usedGoodsId);
		// 채팅목록, 채팅 대화창에도 사진 update해야함 - chatRoom update(usedGoodsImageUrl를 update해야함)
		if (usedGoodsImage != null) {
			chatRoomBO.updateChatRoomUsedGoodsImageUrlByUsedGoodsId(usedGoodsId, usedGoodsImage.getImageUrl());
		}
		
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
	
	@PostMapping("/done")
	public Map<String, Object> done(
			@RequestParam("usedGoodsId") int usedGoodsId,
			@RequestParam("buyerId") int buyerId,
			HttpSession session) {

		Map<String, Object> result = new HashMap<>();
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인해주세요.");
			return result;
		}
		
		// DB update
		//usedGoodsBO.updateSoldOut(usedGoodsId, userId);
		// DB insert
		usedGoodsBO.addUsedGoodsDone(usedGoodsId, buyerId);
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
	
	@DeleteMapping("/delete")
	public Map<String, Object> delete(
			@RequestParam("usedGoodsId") int usedGoodsId,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();

		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인 해주세요");
			return result;
		}
		
		usedGoodsBO.deleteUsedGoods(usedGoodsId, userId);
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
}
