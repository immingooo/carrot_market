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
		        <div><span><i class="fas fa-caret-left"></i></i></span></div>
		        <div><span><i class="fas fa-caret-right"></i></span></div>
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
			<img alt="상품이미지" src="" onerror="this.src='/static/img/used_goods.jpg'" style="border: 4px solid #C2C2C2; border-radius:20px" width="670px" height="400px">
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
			<div class="d-flex justify-content-end">
				<a href=""><img alt="메뉴아이콘" src="https://cdn-icons-png.flaticon.com/512/3018/3018442.png" width="25px"></a>
			</div>
			<h5 class="font-weight-bold">${postView.usedGoods.title}</h5>
			<fmt:formatDate var="createdAt" value="${postView.usedGoods.createdAt}" pattern="yyyy년 MM월 dd일 HH:mm"/>
			<div class="small text-secondary pb-1">${postView.usedGoods.category} ∙ ${createdAt}</div>
			<fmt:formatNumber var="price" value="${postView.usedGoods.price}" type="number" />
			<h5 class="font-weight-bold">${price}원</h5>
			<div class="pt-3 pb-3">${postView.usedGoods.content}</div>
			<div class="small text-secondary">관심${postView.likeCount} 채팅15 조회34</div>
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
				<a href="#" class="btn btn-orange text-light col-3">채팅하기</a>
			</div>
		</div>
		<hr style="background:gray; heigth:5px;">
		
		<div class="d-flex justify-content-between">
			<h5 class="font-weight-bold">당근마켓 인기중고</h5>
			<a href="#" class="text-orange" style="text-decoration:none;">더 구경하기</a>
		</div>
	</div>
</div>








<script>
	$(document).ready(function() {
		
		// 이미지 슬라이드 구현
		var slides = document.getElementById('slides');
		//console.log(slides);
		var slidesChildren = slides.firstElementChild;
		//console.log(slidesChildren);
		slidesChildren.setAttribute('class','active');
		
		var pageNav = document.getElementById('pageNav');
		//console.log(pageNav);
		var pageNavChildren = pageNav.firstElementChild;
		//console.log(pageNavChildren);
		pageNavChildren.setAttribute('class','active');
		
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
	});
</script>
