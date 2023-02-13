package com.carrotMarket.usedGoods.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.carrotMarket.common.FileManagerService;
import com.carrotMarket.usedGoods.dao.UsedGoodsDAO;
import com.carrotMarket.usedGoods.model.UsedGoods;

@Service
public class UsedGoodsBO {
	
	@Autowired
	private FileManagerService fileManagerService;
	
	@Autowired
	private UsedGoodsDAO usedGoodsDAO;

	public UsedGoods addUsedGoods(int userId, String userLoginId, String title, String category, 
			Integer price, String content, String place, List<MultipartFile> files) {

//		List<String> imagePathList = new ArrayList<>();
//		imagePathList = null; // 업로드한 이미지가 없는 경우
//		if (!files.isEmpty()) {
//			for (int i = 0; i < files.size(); i++) {
//				//String imagePath = null;
//				MultipartFile file = files.get(i);
//				String imagePath = fileManagerService.saveFiles(userLoginId, file);
//				imagePathList.add(imagePath);
//			}
//		}
		
		return usedGoodsDAO.insertUsedGoods(userId, title, category, price, content, place);
		// 방금추가된 usedGoodsId 가져오기
		// 가져온 usedGoodsId로 usedGoodsImage 테이블에 insert하기
	}
	
//	public UsedGoods getUsedGoods(int id) {
//		return usedGoodsDAO
//	}
	
	// imagePathList만큼 반복문을 돌려서
//	public void addUsedGoodsImage(usedGoodsId, imagePath) {
//		
//	}
}
