package com.carrotMarket.usedGoods;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/used_goods")
public class UsedGoodsController {

	@GetMapping("/used_goods_create_view")
	public String usedGoodsCreateView(Model model) {
		model.addAttribute("viewName", "usedGoods/usedGoodsCreate");
		return "template/layout";
	}
	
	@GetMapping("/used_goods_detail_view")
	public String usedGoodsDetailView(Model model) {
		model.addAttribute("viewName", "usedGoods/usedGoodsDetail");
		return "template/layout";
	}
}
