package com.carrotMarket.like.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrotMarket.like.dao.LikeDAO;
import com.carrotMarket.like.model.Like;
import com.carrotMarket.like.model.LikeView;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;

	public boolean existLike (int usedGoodsId, Integer userId) {
		if (userId == null) {
			return false;
		}
		return likeDAO.existLike(usedGoodsId, userId);
	}
	
	public void likeToggle (int usedGoodsId, int userId) {
		boolean existLike = likeDAO.existLike(usedGoodsId, userId); // 로그인 된 회원이 해당 글에 좋아요가 있는지 없는지 가져옴
		if (existLike) { // true. 좋아요가 있으면 => 지우기
			likeDAO.deleteLikeByUsedGoodsIdUserId(usedGoodsId, userId);
		} else { // false. 좋아요 가 없으면 => 채우기
			likeDAO.insertLike(usedGoodsId, userId);
		}
	}
	
	public int getLikeCountByUsedGoodsId(int usedGoodsId) {
		return likeDAO.selectLikeCountByUsedGoodsId(usedGoodsId);
	}
	
	public void deleteLikeByUsedGoodsId(int usedGoodsId) {
		likeDAO.deleteLikeByUsedGoodsId(usedGoodsId);
	}
	
	public List<Like> getLikeByUserId(int userId) {
		return likeDAO.selectLikeByUserId(userId);
	}
	
//	public List<LikeView> generateLikeView(int userId) {
//		List<LikeView> LikeViewList = new ArrayList<>();
//		
//		// userId가 좋아요누른 좋아요객체리스트
//		List<Like> likeList = likeDAO.selectLikeByUserId(userId);
//		for (Like like : likeList) {
//			LikeView likeView = new LikeView();
//			
//			likeView.setUsedGoods(null);
//			
//			likeView.setLikeCount(getLikeCountByUsedGoodsId(like.getUsedGoodsId()));
//			
//			likeView.setChatRoomCount();
//		}
//	}
}
