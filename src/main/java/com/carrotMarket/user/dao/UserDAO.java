package com.carrotMarket.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.carrotMarket.user.model.User;

@Repository
public interface UserDAO {

	public List<Map<String, Object>> selectUserListTest();
	
	public User selectUserByLoginIdPassword(
			@Param("loginId") String loginId, 
			@Param("password") String password);
	
	public User selectUserByLoginId (String loginId);
	
	public User selectUserByUserId (int id);
	
	public boolean existLoginId (String loginId);
	
	public boolean existNickname (String nickname);
	
	public int insertUser(
			@Param("loginId") String loginId, 
			@Param("password") String password, 
			@Param("nickname") String nickname, 
			@Param("address") String address,
			@Param("imagePath") String imagePath);
	
	public void updateUserByUserIdLoginId(
			@Param("userId") int userId, 
			@Param("loginId") String loginId, 
			@Param("nickname") String nickname,  
			@Param("imagePath") String imagePath);
}
