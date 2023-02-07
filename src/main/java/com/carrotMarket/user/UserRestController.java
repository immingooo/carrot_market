package com.carrotMarket.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.carrotMarket.common.EncryptUtils;
import com.carrotMarket.user.bo.UserBO;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;

	@GetMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		
		Map<String, Object> result = new HashMap<>();
		boolean isDuplicated = userBO.existLoginId(loginId);
		if (isDuplicated) { // 중복일 때
			result.put("code", 1);
			result.put("result", true);
		} else if (!isDuplicated) { // 중복 아닐 때
			result.put("code", 1);
			result.put("result", false);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "중복확인에 실패했습니다. 관리자에게 문의해주세요.");
		}
		
		return result;
	}
	
	@GetMapping("/is_duplicated_nickname")
	public Map<String, Object> isDuplicatedNickname(
			@RequestParam("nickname") String nickname) {
		
		Map<String, Object> result = new HashMap<>();
		
		boolean isDuplicated = userBO.existNickname(nickname);
		if (isDuplicated) { // 중복일 때
			result.put("code", 1);
			result.put("result", true);
		} else if (!isDuplicated) { // 중복 아닐 때
			result.put("code", 1);
			result.put("result", false);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "중복확인에 실패했습니다. 관리자에게 문의해주세요.");
		}
		
		return result;
	}
	
	
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("nickname") String nickname,
			@RequestParam("address") String address) {
		
		String hashedPassword = EncryptUtils.md5(password);
		
		Map<String, Object> result = new HashMap<>();
		int rowCount = userBO.addUser(loginId, hashedPassword, nickname, address);
		if (rowCount > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "추가된 행이 없습니다.");
		}
		
		return result;
	}
}
