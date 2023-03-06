<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex justify-content-center pt-4 pb-5">
	<div class="col-7 pb-5">
		<%-- 이미지 슬라이더 --%>
		<c:if test="${not empty postView.usedGoodsImageList}">
		<div class="slider-2">
		    <c:if test="${postView.usedGoodsImageList.size() > 1}">
		     <div class="side-btns">
		        <div><span><img src="/static/img/left.png" width="45px" class="ml-1"></span></div>
		        <div><span><img src="/static/img/right.png" width="90px" class="pr-5"></span></div>
		    </div>
		    </c:if>
		    
		    <div class="slides" id="slides">
		    	<c:forEach var="usedGoodsImageList" items="${postView.usedGoodsImageList}">
		        <div style="background-image:url(${usedGoodsImageList.imageUrl});"></div>
		    	</c:forEach>
		    </div>
		    
		    <div class="page-nav" id="pageNav">
		  	 	<c:forEach var="usedGoodsImageList" items="${postView.usedGoodsImageList}">
		        <div></div>
		        </c:forEach>
		    </div>
		</div>
		</c:if>
		<c:if test="${empty postView.usedGoodsImageList}">
			<img alt="상품이미지" src="/static/img/used_goods.jpg" style="border: 4px solid #C2C2C2; border-radius:20px" width="670px" height="400px">
		</c:if>
		
		<%-- 글쓴이 정보 --%>
		<div class="d-flex justify-content-between pt-3">
			<div class="d-flex">
				<img alt="프로필 이미지" src="${postView.user.profileImageUrl}" onerror="this.src='/static/img/user.png'" style="border-radius: 50%;" width="45px">
				<div class="pl-3">
					<div class="font-weight-bold">${postView.user.nickname}</div>
					<c:if test="${empty postView.usedGoods.place}">
					<div class="small">${postView.user.address}</div>
					</c:if>
					<c:if test="${not empty postView.usedGoods.place}">
					<div class="small">${postView.usedGoods.place}</div>
					</c:if>
				</div>
			</div>
			<div class="d-flex">
				<div class="pr-3">
					<div class="font-weight-bold">${postView.user.temperature}℃</div>
					<div>---------</div>
				</div>
				<div><img alt="" src="https://cdn-icons-png.flaticon.com/512/250/250147.png" width="25px"></div>
			</div>
		</div>
		<hr class="m-0 mt-3 mb-2" style="background:gray; heigth:5px;">
		
		<%-- 글 정보 --%>
		<div>
			<c:if test="${userId eq postView.user.id}">
			<div class="d-flex justify-content-end">
				<div class="dropdown">
					<a href="#" role="button" data-toggle="dropdown" data-display="static" aria-expanded="false" id="moreBtn" data-used-goods-id="${postView.usedGoods.id}">
			 			<img alt="메뉴아이콘" src="https://cdn-icons-png.flaticon.com/512/3018/3018442.png" width="25px"></a>
					</a>
					<div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item font-weight-bold" href="/used_goods/used_goods_update_view?usedGoodsId=${postView.usedGoods.id}">글 수정</a>
						<c:if test="${reviewRowCount < 1}">
						<a class="dropdown-item font-weight-bold" href="#" data-target="#modal" data-toggle="modal">글 삭제</a>
						</c:if>
						<%-- <c:if test="${reviewRowCount > 0}">
						<a class="dropdown-item font-weight-bold" href="#" data-target="#modal" data-toggle="modal">글 삭제</a>
						</c:if> --%>
					</div>
				</div>
			</div>
			</c:if>
			
			<h5 class="font-weight-bold pt-2">${postView.usedGoods.title}</h5>
			<fmt:formatDate var="createdAt" value="${postView.usedGoods.createdAt}" pattern="yyyy년 MM월 dd일 HH:mm"/>
			<div class="small text-secondary pb-1">${postView.usedGoods.category} ∙ ${createdAt}</div>
			
			<fmt:formatNumber var="price" value="${postView.usedGoods.price}" type="number" />
			<h5 class="font-weight-bold">${price}원</h5>
			
			<pre class="pt-3 pb-3">${postView.usedGoods.content}</pre>
			<div class="small text-secondary">관심${postView.likeCount} 채팅${postView.chatRoomCount} 조회${postView.usedGoods.viewCount}</div>
			<div class="d-flex justify-content-end">
				<c:if test="${postView.filledLike eq false}">
				<a href="#" class="pr-3 pt-1" id="likeBtn" data-user-id="${userId}" data-used-goods-id="${postView.usedGoods.id}">
					<img alt="빈 하트" src="/static/img/heart.png" width="30px">
				</a>
				</c:if>
				<c:if test="${postView.filledLike eq true}">
				<a href="#" class="pr-3 pt-1" id="likeBtn" data-user-id="${userId}" data-used-goods-id="${postView.usedGoods.id}">
					<img alt="빈 하트" src="/static/img/heart-shape.png" width="30px">
				</a>
				</c:if>
				<a href="#" class="btn btn-orange text-light col-3" id="chatBtn">채팅하기</a>
			</div>
		</div>
		<hr style="background:gray; heigth:5px;">
		
		<div class="d-flex justify-content-between">
			<h5 class="font-weight-bold">당근마켓 인기중고</h5>
			<a href="#" class="text-orange" style="text-decoration:none;">더 구경하기</a>
		</div>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="modal">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">경고창</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
        정말 삭제하시겠습니까?
      </div>
      <div class="modal-footer d-flex justify-content-between">
        <button type="button" class="btn btn-secondary col-6" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-danger col-6" id="deleteBtn">삭제</button>
      </div>
    </div>
  </div>
</div>



<script>
	$(document).ready(function() {
		console.log("111111");
		// 이미지 슬라이드 구현
		var slides = document.getElementById('slides');
		//console.log(slides);
		if (slides != null) {
			var slidesChildren = slides.firstElementChild;
			//console.log(slidesChildren);
			slidesChildren.setAttribute('class','active');
		}
		
		var pageNav = document.getElementById('pageNav');
		//console.log(pageNav);
		if (pageNav != null) {
			var pageNavChildren = pageNav.firstElementChild;
			//console.log(pageNavChildren);
			pageNavChildren.setAttribute('class','active');
		}
		
		$('.slider-2 .page-nav > div').click(function() {
		    
		    var $this = $(this);
		    var $pagenav = $this.parent();
		    var $current = $pagenav.find('.active');
		    
		    $current.removeClass('active');
		    $this.addClass('active');
		
		    var index = $this.index();
		    var $슬라이더 = $this.closest('.slider-2');
		    
		    $슬라이더.find('.slides > div.active').removeClass('active');
		    $슬라이더.find('.slides > div').eq(index).addClass('active');
		    
		    
		});
		
		$('.slider-2 > .side-btns > div:first-child').click(function() {
		    var $this = $(this);
		    var $slider = $this.closest('.slider-2');
		    
		    var $current = $slider.find('.page-nav > div.active');
		    var $post = $current.prev();
		    
		    if ( $post.length == 0 ) {
		        $post = $slider.find('.page-nav > div:last-child');
		    }
		    
		    $post.click();
		});
		
		$('.slider-2 > .side-btns > div:last-child').click(function() {
		    var $this = $(this);
		    var $slider = $this.closest('.slider-2');
		    
		    var $current = $slider.find('.page-nav > div.active');
		    var $post = $current.next();
		    
		    if ( $post.length == 0 ) {
		        $post = $slider.find('.page-nav > div:first-child');
		    }
		    
		    $post.click();
		});
		
		// 좋아요 클릭/해제 버튼 클릭
		$("#likeBtn").on('click', function(e) {
			e.preventDefault();
			//alert('111');
			
			let userId = $(this).data('user-id');
			console.log("userId: " + userId);
			if(userId == null) {
				alert("로그인 해주세요");
				return;
			}
			
			let usedGoodsId = $(this).data('used-goods-id');
			console.log("usedGoodsId: " + usedGoodsId);
			
			$.ajax({
				type:"get"
				, url:"/like/" + usedGoodsId
				
				, success:function(data) {
					if (data.code == 1) {
						location.reload(true);
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("좋아요/해제 하는데 실패했습니다.");
				}
			});
		});
		
		$('#moreBtn').on('click', function(e) {
			e.preventDefault();
			
			let usedGoodsId = $(this).data('used-goods-id');
			
			$('#modal').data('used-goods-id', usedGoodsId)
		});
		
		// 삭제 버튼 클릭
		$('#modal #deleteBtn').on('click', function() {
			//alert('1111');
			
			let usedGoodsId = $('#modal').data('used-goods-id');
			//alert(usedGoodsId);
			
			$.ajax({
				type:"delete"
				, url:"/used_goods/delete"
				, data:{"usedGoodsId":usedGoodsId}
			
				, success:function(data) {
					if (data.code == 1) {
						location.href="/main/main_view"
					} else {
						alert(data.errorMessage);
						location.href="/user/sign_in_view"
					}
				}
				, error:function(e) {
					alert("글 삭제하는데 실패했습니다. 관리자에게 문의해주세요.");
				}
			});
		});
		
		// 채팅하기 버튼 클릭
		$('#chatBtn').on('click', function(e) {
			//alert('1111');
			e.preventDefault();
			
			let usedGoodsId = ${postView.usedGoods.id}
			let sellerId = ${postView.user.id}
			let sellerNickname = "${postView.user.nickname}"
			let sellerProfileImageUrl = "${postView.user.profileImageUrl}"
			console.log("usedGoodsId: " + usedGoodsId);
			console.log("sellerId: " + sellerId);
			console.log("sellerNickname: " + sellerNickname);
			console.log("sellerProfileImageUrl: " + sellerProfileImageUrl);
			
			// 채팅방 생성(글작성자-postView에 있음, 로그인되어있는 자-session에 있는데 user객체로도 가져올 수 있음)
			// 생성된 채팅방 채팅창으로 가기
			$.ajax({
				type:"post"
				, url:"/chat_room/create"
				, data:{"usedGoodsId": usedGoodsId, "sellerId": sellerId, "sellerNickname": sellerNickname, "sellerProfileImageUrl":sellerProfileImageUrl}
			
				, success:function(data) {
					if (data.code == 1) {
						location.href="/chat/chat_message_view/" + data.chatRoomId // 방금 생성된 채팅방 대화창으로 이동
					} else if (data.code == 500) { // 로그인이 안되어있을 때
						alert(data.errorMessage);
					} else if (data.code == 501) { // 자신이 쓴 글에 채팅하기버튼을 눌렀을 때
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("채팅방 생성에 실패했습니다. 관리자에게 문의해주세요.");
				}
			});
		});
	});
</script>
