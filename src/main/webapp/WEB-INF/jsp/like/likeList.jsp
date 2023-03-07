<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex justify-content-center pt-3 pb-5">
	<div class="like-list-box col-5 p-0 box bg-light" style="height:600px">
		<c:forEach var="postView" items="${postViewList}">
		<a href="/used_goods/used_goods_detail_view?usedGoodsId=${postView.usedGoods.id}" style="text-decoration:none; color:black">
		<div class="d-flex justify-content-between m-3">
			<div class="d-flex">
				<div>
					<img alt="상품 사진" src="${postView.usedGoodsImageList[0].imageUrl}" onerror="this.src='/static/img/used_goods.jpg'" width="90px" height="90px" style="border-radius:10%">
				</div>
				<div class="pl-3">
					<div>${postView.usedGoods.title}</div>			
					<div class="small text-secondary">${postView.usedGoods.place}</div>
					<fmt:formatNumber var="price" value="${postView.usedGoods.price}" type="number" />
					<div class="font-weight-bold">${price}원</div>
				</div>
			</div>
			<div class="d-flex small align-items-end">
				<img alt="채팅" src="https://cdn-icons-png.flaticon.com/512/2076/2076218.png" width="20px">
				<span class="ml-2">${postView.chatRoomCount}</span>
				<img alt="좋아요" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png" width="20px" class="ml-1">
				<span class="ml-1">${postView.likeCount}</span>
			</div>
		</div>
		</a>
		<hr>
		</c:forEach>
	</div>
</div>