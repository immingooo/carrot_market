package com.carrotMarket.like;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.carrotMarket.like.bo.LikeBO;
import com.carrotMarket.like.model.Like;
import com.carrotMarket.main.model.PostView;
import com.carrotMarket.usedGoods.bo.UsedGoodsBO;

import javax.servlet.http.HttpSession;

@Controller
public class LikeController {
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private UsedGoodsBO usedGoodsBO;

	@GetMapping("/like_view")
	public String likeView(Model model, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		List<PostView> postViewList = new ArrayList<>();
		
		// 사용자가 누른 좋아요 가져오기 - 없을 수도 있음
		List<Like> likeList = likeBO.getLikeByUserId(userId);
		if (!likeList.isEmpty()) {
			for (Like like : likeList) {
				PostView postView = usedGoodsBO.generatePostView(like.getUsedGoodsId(), userId);
				postViewList.add(postView);
			}
		}
		
		//List<LikeView> likeViewList = likeBO.generateLikeView(userId);
		model.addAttribute("postViewList", postViewList);
		model.addAttribute("viewName", "like/likeList");
		return "template/layout";
	}
}
