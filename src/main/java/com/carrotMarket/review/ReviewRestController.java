package com.carrotMarket.review;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReviewRestController {

	@PostMapping("/review/create")
	public Map<String, Object> create() {
		Map<String, Object> result = new HashMap<>();
		
		return result;
	}
}
