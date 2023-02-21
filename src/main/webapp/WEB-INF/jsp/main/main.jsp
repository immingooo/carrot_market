<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="d-flex justify-content-center pt-4">
	<div class="main-box h-100 mb-5">
		<div class="d-flex justify-content-center">
			<h2 class="font-weight-bold m-0 mt-2">중고거래 매물</h2>
		</div>
		<c:if test="${not empty userId}">
		<div class="d-flex justify-content-end">
			<a href="/used_goods/used_goods_create_view" class="btn btn-orange" style="text-decoration:none; color:white;">글쓰기</a>
		</div>
		</c:if>
		<div>
			<%-- 카테고리 --%>
			<div class="d-flex justify-content-between mt-4 mb-5">
				<select class="form-control col-2">
					<option>카테고리</option>
					<option>디지털기기</option>
					<option>생활가전</option>
					<option>가구/인테리어</option>
					<option>생활/주방</option>
					<option>유아동</option>
					<option>유아도서</option>
					<option>여성의류</option>
					<option>여성잡화</option>
					<option>남성패션/잡화</option>
					<option>뷰티/미용</option>
					<option>스포츠/레저</option>
					<option>취미/게임/음반</option>
					<option>도서</option>
					<option>티켓/교환권</option>
					<option>가공식품</option>
					<option>반려동물용품</option>
					<option>식물</option>
					<option>기타 중고물품</option>
					<option>삽니다</option>
				</select>
				<select class="form-control col-2">
					<option>지역을 선택하세요</option>
					<option>서울특벌시</option>
					<option>부산광역시</option>
					<option>대구광역시</option>
					<option>인천광역시</option>
					<option>광주광역시</option>
					<option>대전광역시</option>
					<option>울산광역시</option>
					<option>세종특별자치시</option>
					<option>경기도</option>
					<option>강원도</option>
					<option>충청북도</option>
					<option>충청남도</option>
					<option>전라북도</option>
					<option>전라남도</option>
					<option>경상북도</option>
					<option>경상남도</option>
					<option>제주특별자치도</option>
				</select>
			</div>
			
			<%-- 중고매물들 --%>
			<div class="used-parent-box d-flex flex-wrap">
				<%-- 중고매물 1개 --%>
				<c:forEach var="postView" items="${postViewList}">
				<div class="used-box">
					<a href="/used_goods/used_goods_detail_view?usedGoodsId=${postView.usedGoods.id}" style="text-decoration:none; color:black">
						<!-- <img src="" onerror="this.src='/static/img/used_goods.jpg'" alt="상품사진" width="201px" height="201px" style="border: 2px solid gray; border-radius:8%"> -->
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
						<%-- <div class="pt-3 pb-1" style="width:200px">${postView.usedGoods.title}</div> --%>
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
						
						<div class="small text-secondary pb-2">관심 ${postView.likeCount} ∙ 채팅 22</div>
						<div class="w-100 sold-out-box text-center text-light font-weight-bold">거래완료</div>
					</a>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>