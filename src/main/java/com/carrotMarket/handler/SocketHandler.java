package com.carrotMarket.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.carrotMarket.chatMessage.bo.ChatMessageBO;
import com.carrotMarket.chatMessage.model.ChatMessage;
import com.carrotMarket.chatRoom.bo.ChatRoomBO;
import com.carrotMarket.chatRoom.model.ChatRoom;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class SocketHandler extends TextWebSocketHandler {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String user_name = searchUserName(session);
//        for(WebSocketSession sess : sessionList) {
//            sess.sendMessage(new TextMessage(user_name+"님이 접속했습니다."));
//        }
        sessionList.add(session);
    }
	
	@Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String user_name= searchUserName(session);
 
        
//        //사용자가 접속중인지 아닌지
//        WebSocketSession chatwritingSession =users.get("user_name");
//        if(chatwritingSession != null) {
//            TextMessage textMessage = new TextMessage(user_name+ " 님이 메세지를 보냈습니다.");
//            chatwritingSession.sendMessage(textMessage);
//        }
        for(WebSocketSession sess: sessionList) {
            sess.sendMessage(new TextMessage(user_name+": "+message.getPayload()));
        }
    }
	
	@Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String user_name = searchUserName(session);
        System.out.println("연결 끊어짐");
        for(WebSocketSession sess : sessionList) {
            sess.sendMessage(new TextMessage(user_name+"님의 연결이 끊어졌습니다."));
        }
        sessionList.remove(session);
    }
	
	public String searchUserName(WebSocketSession session)throws Exception {
        String user_name;
        Map<String, Object> map;
        map = session.getAttributes();
        user_name = (String) map.get("userNickname");
        return user_name;
    }
}
