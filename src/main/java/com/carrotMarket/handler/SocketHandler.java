package com.carrotMarket.handler;

import java.io.IOException;
import java.util.HashMap;

import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class SocketHandler extends TextWebSocketHandler {
	
	HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵

	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		//메시지 발송
		String msg = message.getPayload();
		JSONObject obj = JsonToObjectParser(msg); // 추가
		for(String key : sessionMap.keySet()) {
			WebSocketSession wss = sessionMap.get(key);
			try {
				wss.sendMessage(new TextMessage(obj.toString())); // 변경(이상함)
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	} 
	
	@SuppressWarnings("unchecked")
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//소켓 연결
		super.afterConnectionEstablished(session);
		sessionMap.put(session.getId(), session);
		JSONObject obj = new JSONObject();
		obj.put("type", "getId");
		obj.put("sessionId", session.getId());
		session.sendMessage(new TextMessage(obj.toString())); // 약간 다름
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//소켓 종료
		sessionMap.remove(session.getId());
		super.afterConnectionClosed(session, status);
	}
	
	// 이상함
	private static JSONObject JsonToObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser(jsonStr);
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return obj;
	}
}
