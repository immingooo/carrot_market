package com.carrotMarket.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carrotMarket.main.bo.MainBO;
import com.carrotMarket.main.model.PostView;
import com.carrotMarket.usedGoods.bo.UsedGoodsBO;
import com.carrotMarket.usedGoods.model.UsedGoods;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	private MainBO mainBO;
	
	@Autowired
	private UsedGoodsBO usedGoodsBO;
	
	@GetMapping("/main_view")
	public String mainView(Model model) {
		
		List<PostView> postViewList = mainBO.generatePostViewList();
		
		model.addAttribute("postViewList", postViewList);
		model.addAttribute("viewName", "main/main");
		return "template/layout";
	}
	
	@GetMapping("/search_view")
	public String searchView(Model model) {
		model.addAttribute("viewName", "main/search");
		return "template/layout";
	}
	
	@GetMapping("/search_result_view")
	public String searchResultView(Model model,
			@RequestParam("keyword") String keyword) {
		
		List<UsedGoods> usedGoodsList = usedGoodsBO.getUsedGoodsListByKeyword(keyword);
		
		model.addAttribute("usedGoodsList", usedGoodsList);
		return "main/searchContent";
	}
}
