package com.carrotMarket.usedGoods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/used_goods")
public class UsedGoodsRestController {

	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam("title") String title,
			@RequestParam("category") String category,
			@RequestParam(value="price", required=false) String price,
			@RequestParam("content") String content,
			@RequestParam(value="place", required=false) String place,
			@RequestParam("images") List<MultipartFile> files) {
		Map<String, Object> result = new HashMap<>();
		
		return result;
	}
}
