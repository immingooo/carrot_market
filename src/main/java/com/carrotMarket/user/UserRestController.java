package com.carrotMarket.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.carrotMarket.chatMessage.bo.ChatMessageBO;
import com.carrotMarket.chatRoom.bo.ChatRoomBO;
import com.carrotMarket.common.EncryptUtils;
import com.carrotMarket.user.bo.UserBO;
import com.carrotMarket.user.model.User;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private ChatRoomBO chatRoomBO;
	
	@Autowired
	private ChatMessageBO chatMessageBO;

	/**
	 * 아이디 중복확인 API
	 * @param loginId
	 * @return
	 */
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
	
	/**
	 * 닉네임 API 중복확인
	 * @param nickname
	 * @return
	 */
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
	
	/**
	 * 회원가입 API
	 * @param loginId
	 * @param password
	 * @param nickname
	 * @param address
	 * @return
	 */
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("nickname") String nickname,
			@RequestParam("address") String address,
			@RequestParam(value="file", required=false) MultipartFile file) {
		
		String hashedPassword = EncryptUtils.md5(password);
		
		Map<String, Object> result = new HashMap<>();
		int rowCount = userBO.addUser(loginId, hashedPassword, nickname, address, file);
		if (rowCount > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "추가된 행이 없습니다.");
		}
		
		return result;
	}
	
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpSession session) {
		
		String hashedPassword = EncryptUtils.md5(password);
		
		Map<String, Object> result = new HashMap<>();
		User user = userBO.getUserByLoginIdPassword(loginId, hashedPassword);
		if (user != null) { // 회원
			result.put("code", 1);
			result.put("result", "성공");
			
			session.setAttribute("userId", user.getId()); // 사용자 아이디번호
			session.setAttribute("userLoginId", user.getLoginId()); // 사용자 아이디
			session.setAttribute("userNickname", user.getNickname()); // 사용자 닉네임
			session.setAttribute("userProfileImageUrl", user.getProfileImageUrl());
		} else { // 비회원
			result.put("code", 500);
			result.put("errorMessage", "존재하지 않는 사용자 입니다.");
		}
		
		return result;
	}
	
	@PutMapping("/update")
	public Map<String, Object> update(
			@RequestParam("nickname") String nickname,
			@RequestParam(value="file", required=false) MultipartFile file
			, HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		Integer userId = (Integer)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		// 로그인되어있는지 확인
		if (userId == null) {
			result.put("code", 501);
			result.put("errorMessage", "로그인해주세요");
			return result;
		}
		
		// 나중에 이 로직 UserBO에 들어가도 될 듯??
		// 이미지만 변경했을 경우(기존에 있던 이름이랑 같은 이름인지 확인)
		User user = userBO.getUserByUserId(userId);
		if (!user.getNickname().equals(nickname)) {
			// 닉네임 중복인지 확인
			boolean isDuplicated = userBO.existNickname(nickname);
			if (isDuplicated) { // 중복일 때
				result.put("code", 500);
				return result;
			}
		}
		
		User oldUser = userBO.getUserByUserId(userId);
		String oldUserNickname = oldUser.getNickname();
		// user DB update
		userBO.updateUser(userId, userLoginId, nickname, file);
		
		user = userBO.getUserByLoginId(userLoginId); // 업데이트된 user객체 새로 받아옴
		
		// 채팅방이 존재할 때만 update
		// chatRoom DB update - 아직 없을수도..(채팅방이 존재할 때만 채팅방정보 update)
		chatRoomBO.updateChatRoom(userId, user.getNickname(), user.getProfileImageUrl());
		if (!chatRoomBO.getChatRoomListByUserId(userId).isEmpty()) {
			// chat DB update - 아직 없을수도..(채팅방이 존재할 때 메세지정보 update)
			chatMessageBO.updateChatMessage(userId, oldUserNickname , user.getNickname(), user.getProfileImageUrl());
		}
		
		session.setAttribute("userNickname", user.getNickname());
		session.setAttribute("userProfileImageUrl", user.getProfileImageUrl());
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
}
