package com.carrotMarket.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrotMarket.user.dao.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;

	public boolean existLoginId (String loginId) {
		return userDAO.existLoginId(loginId);
	}
	
	public boolean existNickname (String nickname) {
		return userDAO.existNickname(nickname);
	}
	
	public int addUser(String loginId, String password, String nickname, String address) {
		return userDAO.insertUser(loginId, password, nickname, address);
	}
}
