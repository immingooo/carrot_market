package com.carrotMarket.user.bo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.carrotMarket.common.FileManagerService;
import com.carrotMarket.user.dao.UserDAO;
import com.carrotMarket.user.model.User;

@Service
public class UserBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private FileManagerService fileManagerService;

	public boolean existLoginId (String loginId) {
		return userDAO.existLoginId(loginId);
	}
	
	public boolean existNickname (String nickname) {
		return userDAO.existNickname(nickname);
	}
	
	public int addUser (String loginId, String password, String nickname, String address, MultipartFile file) {
		
		// 파일 업로드(내 컴퓨터 서버에 업로드해야함) => 경로를 리턴받아서 DB에 경로를 넣어야 함
		String imagePath = null;
		if (file != null) { 
			// 파일이 있을 때만 업로드 => 이미지 경로를 얻어냄
			imagePath = fileManagerService.saveFile(loginId, file);
		}
		
		return userDAO.insertUser(loginId, password, nickname, address, imagePath);
	}
	
	public User getUserByLoginIdPassword (String loginId, String password) {
		return userDAO.selectUserByLoginIdPassword(loginId, password);
	}
	
	public User getUserByLoginId (String loginId) {
		return userDAO.selectUserByLoginId(loginId);
	}
	
	public void updateUser (int userId, String userLoginId, String nickname, MultipartFile file) {
		
		// 기존 사용자가 없는 이상한 경우 체크
		User user = getUserByLoginId(userLoginId);
		if (user == null) {
			logger.warn("[update user] 수정할 사용자가 존재하지 않습니다. userLoginId:{}", userLoginId);
			return;
		}
		
		String imagePath = null; // 수정할 새로운 이미지가 없을 땐 null
		if (file != null) {
			// 수정할 새로운 이미지경로를 받아온다.(업로드)
			imagePath = fileManagerService.saveFile(userLoginId, file);
			
			// 업로드 성공하면 기존 이미지가 있으면 제거한다.
			if (imagePath != null && user.getProfileImageUrl() != null) {
				// 기존 이미지 제거
				fileManagerService.deleteFile(user.getProfileImageUrl());
			}
		}
		
		// DB update
		userDAO.updateUserByUserIdLoginId(userId, userLoginId, nickname, imagePath);
	}
}
