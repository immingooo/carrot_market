package com.carrotMarket.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.carrotMarket.common.FileManagerService;
import com.carrotMarket.user.dao.UserDAO;
import com.carrotMarket.user.model.User;

@Service
public class UserBO {
	
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
}
