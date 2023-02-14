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
import com.carrotMarket.usedGoods.dao.UsedGoodsDAO;

@Service
public class UsedGoodsBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private FileManagerService fileManagerService;
	
	@Autowired
	private UsedGoodsDAO usedGoodsDAO;

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
				String imagePath = fileManagerService.saveFiles(userLoginId, file);
				imagePathList.add(imagePath);
			}
		}
		
		//imagePathList = null; // 업로드한 이미지가 없는 경우
		// 가져온 usedGoodsId로 imagePathList만큼 반복문을 돌려서 usedGoodsImage 테이블에 insert하기
		if (!imagePathList.isEmpty()) {
			usedGoodsDAO.insertUsedGoodsImage(id, imagePathList);
		}
	}
}
