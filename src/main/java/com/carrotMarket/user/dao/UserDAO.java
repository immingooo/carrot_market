package com.carrotMarket.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {

	public List<Map<String, Object>> selectUserListTest();
	
	public boolean existLoginId (String loginId);
	
	public boolean existNickname (String nickname);
	
	public int insertUser(
			@Param("loginId") String loginId, 
			@Param("password") String password, 
			@Param("nickname") String nickname, 
			@Param("address") String address);
	
}
