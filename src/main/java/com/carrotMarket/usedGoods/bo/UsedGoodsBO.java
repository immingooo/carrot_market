package com.carrotMarket.usedGoods.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.carrotMarket.common.FileManagerService;
import com.carrotMarket.like.bo.LikeBO;
import com.carrotMarket.main.model.PostView;
import com.carrotMarket.usedGoods.dao.UsedGoodsDAO;
import com.carrotMarket.usedGoods.model.UsedGoods;
import com.carrotMarket.usedGoods.model.UsedGoodsImage;
import com.carrotMarket.user.bo.UserBO;
import com.carrotMarket.user.model.User;

@Service
public class UsedGoodsBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private FileManagerService fileManagerService;
	
	@Autowired
	private UsedGoodsDAO usedGoodsDAO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private LikeBO likeBO;

	public void addUsedGoods(int userId, String userLoginId, String title, String category, 
			Integer price, String content, String place, List<MultipartFile> files) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("title", title);
		map.put("category", category);
		map.put("price", price);
		map.put("content", content);
		map.put("place", place);
		
		usedGoodsDAO.insertUsedGoods(map);
		
		// 방금추가된 usedGoodsId 가져오기
		//int id = Integer.parseInt(String.valueOf(map.get("id")));
		int id = (int)map.get("id");
		logger.info("###방금 insert된 id번호### id:{}", id);
		
		List<String> imagePathList = new ArrayList<>();
		//imagePathList.clear(); // []
		if (files != null) {
			for (int i = 0; i < files.size(); i++) {
				//String imagePath = null;
				MultipartFile file = files.get(i);
				String imagePath = fileManagerService.saveFile(userLoginId, file);
				imagePathList.add(imagePath);
			}
		}
		
		//imagePathList = null; // 업로드한 이미지가 없는 경우
		// 가져온 usedGoodsId로 imagePathList만큼 반복문을 돌려서 usedGoodsImage 테이블에 insert하기
		if (!imagePathList.isEmpty()) {
			usedGoodsDAO.insertUsedGoodsImage(id, imagePathList);
		}
	}
	
	public PostView generatePostView(int usedGoodsId, Integer userId) {
		// PostView객체 가져와서 객체 채우기
		PostView post = new PostView();
		
		// 글 가져오기(글 번호로)
		UsedGoods usedGoods = usedGoodsDAO.selectUsedGoodsByUsedGoodsId(usedGoodsId);
		post.setUsedGoods(usedGoods);
		
		// 글쓴이 정보 가져오기(글 작성한 글쓴이 id번호로)
		User user = userBO.getUserByUserId(usedGoods.getUserId());
		post.setUser(user);
		
		// 글 하나에 해당하는 사진들 채우기
		List<UsedGoodsImage> usedGoodsImageList = usedGoodsDAO.selectUsedGoodsImageListByUsedGoodsId(usedGoodsId);
		post.setUsedGoodsImageList(usedGoodsImageList);
		
		// 내가 좋아요를 눌렀는지 filledLike
		post.setFilledLike(likeBO.existLike(usedGoods.getId(), userId));
		
		// 글에 눌린 좋아요 개수
		post.setLikeCount(likeBO.getLikeCountByUsedGoodsId(usedGoods.getId()));
		
		// 글에 대한 조회수
		//post.setHitsCount();
		
		// 글에 대한 채팅 개수
		
		return post;
	}
	
	public List<UsedGoods> getUsedGoodsList() {
		return usedGoodsDAO.selectUsedGoodsList();
	}
	
	public UsedGoods getUsedGoodsByUsedGoodsIdUserId(int usedGoodsId, int userId) {
		return usedGoodsDAO.selectUsedGoodsByUsedGoodsIdUserId(usedGoodsId, userId);
	}
	
	public List<UsedGoodsImage> getUsedGoodsImageListByUsedGoodsId(int usedGoodsId) {
		return usedGoodsDAO.selectUsedGoodsImageListByUsedGoodsId(usedGoodsId);
	}
	
	public void update(int userId, String userLoginId, int usedGoodsId, String title, 
			String category, Integer price, String content, String place, List<MultipartFile> files) {
		
		UsedGoods usedGoods = usedGoodsDAO.selectUsedGoodsByUsedGoodsIdUserId(usedGoodsId, userId);
		List<UsedGoodsImage> usedGoodsImageList = usedGoodsDAO.selectUsedGoodsImageListByUsedGoodsId(usedGoodsId);
		if (usedGoods == null) { // 이상한 상황(이미지는 없을 수도 있음)
			logger.warn("[update usedGoods] 수정할 글이 존재하지 않습니다. usedGoodsId:{}, userId:{}", usedGoodsId, userId);
			return;
		}
		
		List<String> imagePathList = new ArrayList<>();
		//imagePathList.clear(); // []
		if (files != null) {
			// 수정할 새로운 이미지 업로드(노트북에 새로운 이미지 저장)
			for (int i = 0; i < files.size(); i++) {
				MultipartFile file = files.get(i);
				String imagePath = fileManagerService.saveFile(userLoginId, file);
				imagePathList.add(imagePath);
			}
			
			// 수정할 새로운 이미지 업로드 성공했으면 기존이미지 삭제(노트북에 기존 이미지 삭제)
			if (!imagePathList.isEmpty() && !usedGoodsImageList.isEmpty()) {
				for (UsedGoodsImage usedGoodsImage : usedGoodsImageList) {
					fileManagerService.deleteFile(usedGoodsImage.getImageUrl());
				}
			}
		}
		
		// 글 수정
		usedGoodsDAO.updateUsedGoodsByUserIdUsedGoodsId(userId, usedGoodsId, title, category, price, content, place);
		// 글에 대한 이미지들 수정(delete -> insert) - 이미지들이 있을 때만 주소저장
		if (!imagePathList.isEmpty() && !usedGoodsImageList.isEmpty()) {
			usedGoodsDAO.deleteUsedGoodsImageByUsedGoodsId(usedGoodsId);
		}
		if (!imagePathList.isEmpty()) {
			usedGoodsDAO.insertUsedGoodsImage(usedGoodsId, imagePathList);
		}
	}
}
