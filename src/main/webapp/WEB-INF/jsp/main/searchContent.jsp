<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div class="d-flex justify-content-start mt-3 mb-3">
	<h5 class="font-weight-bold m-0">최신 중고</h5>
</div>

<c:if test="${not empty postViewList}">
<%-- 중고매물들 --%>
<div class="hot-used-parent-box d-flex flex-wrap">
	<%-- 중고매물 1개 --%>
	<c:forEach var="postView" items="${postViewList}">
	<div class="used-box">
		<a href="/used_goods/used_goods_detail_view?usedGoodsId=${postView.usedGoods.id}" style="text-decoration:none; color:black">
			<%-- 상품 이미지 --%>
			<c:if test="${postView.usedGoodsImageList.size() > 0}">
				<img alt="상품이미지" src="${postView.usedGoodsImageList[0].imageUrl}" width="200px" height="200px" style="border-radius:8%">
			</c:if>
			
			<c:if test="${empty postView.usedGoodsImageList}">
				<img alt="기본상품이미지" src="" onerror="this.src='/static/img/used_goods.jpg'" width="201px" height="201px" style="border: 2px solid gray; border-radius:8%">
			</c:if>
			
			<%-- 글 제목 --%>
			<div class="font-weight-bold pt-3">
				<c:if test="${fn:length(postView.usedGoods.title) > 12}">
				${fn:substring(postView.usedGoods.title, 0, 11)}...
				</c:if>
				<c:if test="${fn:length(postView.usedGoods.title) <= 12}">
				${postView.usedGoods.title}
				</c:if>
			</div>
			
			<%-- 주소 --%>
			<div class="text-secondary">
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
			</div>
			
			<div class="d-flex justify-content-between">
				<%-- 가격 --%>
				<fmt:formatNumber var="price" value="${postView.usedGoods.price}" type="number" />
				<div class="font-weight-bold pb-2 text-orange">${price}원</div>
				
				<%-- 좋아요 --%>
				<div>
					<img alt="관심항목 아이콘" src="/static/img/heart.png" width="15px" height="15px">
					<span>${postView.likeCount}</span>
				</div>
			</div>
			
			<div class="w-100 sold-out-box text-center text-light font-weight-bold">거래완료</div>
		</a>
	</div>
	</c:forEach>
</div>
</c:if>
<c:if test="${empty postViewList}">
	<div class="d-flex justify-content-center align-items-center" style="height:500px">
		<h3>검색결과가 없습니다.</h3>
	</div>
</c:if>
