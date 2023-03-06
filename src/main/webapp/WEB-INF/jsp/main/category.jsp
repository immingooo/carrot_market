<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:forEach var="postView" items="${postViewList}">
<c:if test="${!empty postView.usedGoodsDone}">
<div class="used-box" style="opacity: 0.5;">
	<a href="/used_goods/used_goods_detail_view?usedGoodsId=${postView.usedGoods.id}" style="text-decoration:none; color:black">
		<c:if test="${postView.usedGoodsImageList.size() > 0}">
			<img alt="상품이미지" src="${postView.usedGoodsImageList[0].imageUrl}" width="200px" height="200px" style="border-radius:8%">
		</c:if>
		
		<c:if test="${empty postView.usedGoodsImageList}">
			<img alt="기본상품이미지" src="" onerror="this.src='/static/img/used_goods.jpg'" width="201px" height="201px" style="border: 2px solid gray; border-radius:8%">
		</c:if>
		
		<div class="pt-3 pb-1" style="width:200px">
			<c:if test="${fn:length(postView.usedGoods.title) > 12}">
			${fn:substring(postView.usedGoods.title, 0, 11)}...
			</c:if>
			<c:if test="${fn:length(postView.usedGoods.title) <= 12}">
			${postView.usedGoods.title}
			</c:if>
		</div>
		
		<fmt:formatNumber var="price" value="${postView.usedGoods.price}" type="number" />
		<div class="font-weight-bold pb-1">${price}원</div>
		
		<c:if test="${empty postView.usedGoods.place}">
		<div class="small" style="width:200px">
			<c:if test="${fn:length(postView.user.address) > 18}">
			${fn:substring(postView.user.address, 0, 17)}...
			</c:if>
			<c:if test="${fn:length(postView.user.address) <= 18}">
			${postView.user.address}
			</c:if>
		</div>
		</c:if>
		<c:if test="${not empty postView.usedGoods.place}">
		<div class="small">
			<c:if test="${fn:length(postView.usedGoods.place) > 18}">
			${fn:substring(postView.usedGoods.place, 0, 17)}...
			</c:if>
			<c:if test="${fn:length(postView.usedGoods.place) <= 18}">
			${postView.usedGoods.place}
			</c:if>
		</div>
		</c:if>
		
		<div class="small text-secondary pb-2">관심 ${postView.likeCount} ∙ 채팅 ${postView.chatRoomCount}</div>
		<div class="w-100 sold-out-box text-center text-light font-weight-bold">거래완료</div>
	</a>
</div>
</c:if>

<c:if test="${empty postView.usedGoodsDone}">
<div class="used-box">
	<a href="/used_goods/used_goods_detail_view?usedGoodsId=${postView.usedGoods.id}" style="text-decoration:none; color:black">
		<c:if test="${postView.usedGoodsImageList.size() > 0}">
			<img alt="상품이미지" src="${postView.usedGoodsImageList[0].imageUrl}" width="200px" height="200px" style="border-radius:8%">
		</c:if>
		
		<c:if test="${empty postView.usedGoodsImageList}">
			<img alt="기본상품이미지" src="" onerror="this.src='/static/img/used_goods.jpg'" width="201px" height="201px" style="border: 2px solid gray; border-radius:8%">
		</c:if>
		
		<div class="pt-3 pb-1" style="width:200px">
			<c:if test="${fn:length(postView.usedGoods.title) > 12}">
			${fn:substring(postView.usedGoods.title, 0, 11)}...
			</c:if>
			<c:if test="${fn:length(postView.usedGoods.title) <= 12}">
			${postView.usedGoods.title}
			</c:if>
		</div>
		
		<fmt:formatNumber var="price" value="${postView.usedGoods.price}" type="number" />
		<div class="font-weight-bold pb-1">${price}원</div>
		
		<c:if test="${empty postView.usedGoods.place}">
		<div class="small" style="width:200px">
			<c:if test="${fn:length(postView.user.address) > 18}">
			${fn:substring(postView.user.address, 0, 17)}...
			</c:if>
			<c:if test="${fn:length(postView.user.address) <= 18}">
			${postView.user.address}
			</c:if>
		</div>
		</c:if>
		<c:if test="${not empty postView.usedGoods.place}">
		<div class="small">
			<c:if test="${fn:length(postView.usedGoods.place) > 18}">
			${fn:substring(postView.usedGoods.place, 0, 17)}...
			</c:if>
			<c:if test="${fn:length(postView.usedGoods.place) <= 18}">
			${postView.usedGoods.place}
			</c:if>
		</div>
		</c:if>
		
		<div class="small text-secondary pb-2">관심 ${postView.likeCount} ∙ 채팅 ${postView.chatRoomCount}</div>
	</a>
</div>
</c:if>
</c:forEach>