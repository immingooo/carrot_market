package com.carrotMarket.usedGoods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carrotMarket.main.model.PostView;
import com.carrotMarket.review.bo.ReviewBO;
import com.carrotMarket.usedGoods.bo.UsedGoodsBO;
import com.carrotMarket.usedGoods.model.UsedGoods;
import com.carrotMarket.usedGoods.model.UsedGoodsDone;
import com.carrotMarket.usedGoods.model.UsedGoodsImage;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/used_goods")
public class UsedGoodsController {
	
	@Autowired
	private UsedGoodsBO usedGoodsBO;
	
	@Autowired
	private ReviewBO reviewBO;

	@GetMapping("/used_goods_create_view")
	public String usedGoodsCreateView(Model model) {
		model.addAttribute("viewName", "usedGoods/usedGoodsCreate");
		return "template/layout";
	}
	
	@GetMapping("/used_goods_detail_view")
	public String usedGoodsDetailView(
			@RequestParam("usedGoodsId") int usedGoodsId,
			Model model, 
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response) {

		// 조회수 update
		usedGoodsBO.addViewCount(usedGoodsId, request, response);
		
		// 글 번호에 해당하는 postView객체를 가져와야 함(로그인/비로그인 모두 들어갈 수 있음)
		PostView postView = usedGoodsBO.generatePostView(usedGoodsId, (Integer)session.getAttribute("userId"));
		// 거래완료가 된 글인지 확인하기(거래완료버튼클릭 -> 글 삭제 숨기기)
		//UsedGoodsDone usedGoodsDone = usedGoodsBO.getUsedGoodsDoneByUsedGoodsId(usedGoodsId);
		// 후기가 작성된 글인지 확인하기(후기작성O -> 글 삭제 숨기기)
		int reviewRowCount = reviewBO.getReviewByUsedGoodsId(usedGoodsId);
		
		
		model.addAttribute("postView", postView);
		//model.addAttribute("usedGoodsDone", usedGoodsDone);
		model.addAttribute("reviewRowCount", reviewRowCount);
		model.addAttribute("viewName", "usedGoods/usedGoodsDetail");
		return "template/layout";
	}
	
	@GetMapping("/used_goods_update_view")
	public String usedGoodsUpdateView(
			@RequestParam("usedGoodsId") int usedGoodsId,
			Model model,
			HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		// usedGoods 가져오기(DB select)
		UsedGoods usedGoods = usedGoodsBO.getUsedGoodsByUsedGoodsIdUserId(usedGoodsId, userId);
		
		// usedGoodsImage 객체 보내기
		List<UsedGoodsImage> usedGoodsImageList = usedGoodsBO.getUsedGoodsImageListByUsedGoodsId(usedGoodsId);
		
		model.addAttribute("usedGoods", usedGoods);
		model.addAttribute("usedGoodsImageList", usedGoodsImageList);
		model.addAttribute("viewName", "usedGoods/usedGoodsUpdate");
		return "template/layout";
	}
}
