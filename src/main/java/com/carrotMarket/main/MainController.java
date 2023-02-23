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

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	private MainBO mainBO;
	
	@Autowired
	private UsedGoodsBO usedGoodsBO;
	
	@GetMapping("/main_view")
	public String mainView(Model model) {
		
		List<PostView> postViewList = mainBO.generatePostViewList(null, null, null);
		
		model.addAttribute("postViewList", postViewList);
		model.addAttribute("viewName", "main/main");
		return "template/layout";
	}
	
	@GetMapping("/search_view")
	public String searchView(Model model,
			@RequestParam("keyword") String keyword) {
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("viewName", "main/search");
		return "template/layout";
	}
	
	@GetMapping("/search_result_view")
	public String searchResultView(Model model,
			@RequestParam("keyword") String keyword) {
		
		List<PostView> postViewList = mainBO.generatePostViewList(keyword, null, null);
		
		model.addAttribute("postViewList", postViewList);
		return "main/searchContent"; // 레이아웃이 아예 없는 html
	}
	
	@GetMapping("/category_view")
	public String categoryView(Model model,
			@RequestParam("category") String category) {
		
		List<PostView> postViewList = mainBO.generatePostViewList(null, category, null);
		
		model.addAttribute("postViewList", postViewList);
		return "main/category";
	}
	
	@GetMapping("/area_view")
	public String areaView(Model model,
			@RequestParam("area") String area) {
		
		List<PostView> postViewList = mainBO.generatePostViewList(null, null, area);
		
		model.addAttribute("postViewList", postViewList);
		return "main/area";
	}
	
	@GetMapping("/chat_message_view")
	public String chatMessageView(Model model) {
		
		model.addAttribute("viewName", "chat/chatMessage");
		return "template/layout";
	}
}
