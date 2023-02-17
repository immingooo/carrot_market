package com.carrotMarket.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carrotMarket.main.bo.MainBO;
import com.carrotMarket.main.model.PostView;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	private MainBO mainBO;
	
	@GetMapping("/main_view")
	public String mainView(Model model) {
		
		//List<PostView> postViewList = mainBO.generatePostViewList();
		
		model.addAttribute("viewName", "main/main");
		return "template/layout";
	}
	
	@GetMapping("/search_view")
	public String searchView(Model model) {
		model.addAttribute("viewName", "main/search");
		return "template/layout";
	}
}
