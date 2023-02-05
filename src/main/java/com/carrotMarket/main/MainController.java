package com.carrotMarket.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {

	@GetMapping("/main_view")
	public String mainView(Model model) {
		model.addAttribute("viewName", "main/main");
		return "template/layout";
	}
	
	@GetMapping("/search_view")
	public String searchView(Model model) {
		model.addAttribute("viewName", "main/search");
		return "template/layout";
	}
}
