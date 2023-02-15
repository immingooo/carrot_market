package com.carrotMarket.usedGoods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carrotMarket.main.model.PostView;
import com.carrotMarket.usedGoods.bo.UsedGoodsBO;

@Controller
@RequestMapping("/used_goods")
public class UsedGoodsController {
	
	@Autowired
	private UsedGoodsBO usedGoodsBO;

	@GetMapping("/used_goods_create_view")
	public String usedGoodsCreateView(Model model) {
		model.addAttribute("viewName", "usedGoods/usedGoodsCreate");
		return "template/layout";
	}
	
	@GetMapping("/used_goods_detail_view")
	public String usedGoodsDetailView(Model model) {
		
		int usedGoodsId = 18; // 임시로 18번째 글을 가져올 거임
		
		// 글 번호에 해당하는 postView객체를 가져와야 함(로그인/비로그인 모두 들어갈 수 있음)
		PostView postView = usedGoodsBO.generatePostView(usedGoodsId);
		
		model.addAttribute("postView", postView);
		model.addAttribute("viewName", "usedGoods/usedGoodsDetail");
		return "template/layout";
	}
}
