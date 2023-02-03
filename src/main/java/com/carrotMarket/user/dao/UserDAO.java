package com.carrotMarket.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {

	public List<Map<String, Object>> selectUserListTest();
}
