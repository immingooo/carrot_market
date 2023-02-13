package com.carrotMarket.review;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@GetMapping("/review_create_view")
	public String reviewCreateView(Model model) {
		model.addAttribute("viewName", "review/reviewCreate");
		return "template/layout";
	}
}
