<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form id="chatForm">
    <button type="button" class="chat_start_main" data-user-id="${userId}">
        상담 CHAT
    </button>
    <div class="chat_main">
        <div class="modal-header" style="height:20%;">
            상담 CHAT 
        </div>
        <div class="modal-content" id="chat" style="height:60%;">
            
        </div>
        <div class="modal-footer">
            <input type="text" id="message" class="form-control" style="height:20%;" placeholder="메세지를 입력하세요"/>    
        </div>
    </div>
	<button class="">send</button>
</form>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script type="text/javascript">
var socket = null;
	$(document).ready(function() {
		let userId = $('.chat_start_main').data('user-id');
		console.log(userId);
	    if(userId != '') {
            connectWS();
	    }
		/* }); */
	
	    $(".chat_start_main").on('click', function() {
	        $(this).css("display","none");
	        $(".chat_main").css("display","inline");
	    });
		
	    $(".chat_main .modal-header").on('click', function() {
	        $(".chat_start_main").css("display","inline");
	        $(".chat_main").css("display","none");
	    });
	
		var ws;
	
		function connectWS(){
	        var sock = new SockJS("/chating");
	            socket =sock;
	        sock.onopen = function() {
	               console.log('info: connection opened.');
	        };
	        sock.onmessage = function(e){
//	             console.log(e);
//	             var strArray = e.data.split(":");
//	             if(e.data.indexof(":") > -1){
//	                 $(".chat_start_main").text(strArray[0]+"님이 메세지를 보냈습니다.");
//	             }
//	             else{
//	             }
	            $("#chat").append(e.data + "<br/>");
	        }
	        sock.onclose = function(){
	            $("#chat").append("연결 종료");
//	              setTimeout(function(){conntectWs();} , 10000); 
	        }
	        sock.onerror = function (err) {console.log('Errors : ' , err);};
	 
	        $("#chatForm").submit(function(event){
	            event.preventDefault();
	                sock.send($("#message").val());
	                $("#message").val('').focus();    
	        });
	    }
		
		/* function wsOpen(){
			ws = new WebSocket("ws://" + location.host + "/chating");
			wsEvt();
		}
			
		function wsEvt() {
			ws.onopen = function(data){
				//소켓이 열리면 초기화 세팅하기
			}
			
			ws.onmessage = function(data) {
				//메시지를 받으면 동작
				var msg = data.data;
				if(msg != null && msg.trim() != ''){
					var d = JSON.parse(msg);
					if(d.type == "getId"){
						var si = d.sessionId != null ? d.sessionId : "";
						if(si != ''){
							$("#sessionId").val(si); 
						}
					}else if(d.type == "message"){
						if(d.sessionId == $("#sessionId").val()){
							$("#chating").append("<p class='me'>나 :" + d.msg + "</p>");	
						}else{
							$("#chating").append("<p class='others'>" + d.userName + " :" + d.msg + "</p>");
						}
							
					}else{
						console.warn("unknown type!")
					}
				}
			}
	
			document.addEventListener("keypress", function(e){
				if(e.keyCode == 13){ //enter press
					send();
				}
			});
		}
	
		$('#startBtn').on('click', function() {
			var userName = $("#userName").val();
			//console.log(userName)
			if(userName == null || userName.trim() == ""){
				alert("사용자 이름을 입력해주세요.");
				$("#userName").focus();
			}else{
				wsOpen();
				$("#yourName").hide();
				$("#yourMsg").show();
			}
		});
		
	
		$("#sendBtn").on('click', function() {
			var option ={
					type: "message",
					sessionId : $("#sessionId").val(),
					userName : $("#userName").val(),
					msg : $("#chatting").val()
				}
				ws.send(JSON.stringify(option))
				$('#chatting').val("");
		}); */
	});
</script>