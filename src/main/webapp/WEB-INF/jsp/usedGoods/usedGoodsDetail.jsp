<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="d-flex justify-content-center pt-4 pb-5">
	<div class="col-7 pb-5">
		<img alt="상품이미지" src="" onerror="this.src='/static/img/used_goods.jpg'" style="border: 4px solid #C2C2C2; border-radius:20px" width="670px" height="400px">
		<div class="d-flex justify-content-between pt-3">
			<div class="d-flex">
				<img alt="프로필 이미지" src="${postView.user.profileImageUrl}" onerror="this.src='/static/img/user.png'" style="border-radius: 50%;" width="45px">
				<div class="pl-3">
					<div class="font-weight-bold">${postView.user.nickname}</div>
					<%-- <c:if test="${postView.usedGoods.place eq null}">
					<div class="small">${postView.user.address}</div>
					</c:if>
					<c:if test="${postView.usedGoods.place not eq null}">
					<div class="small">${postView.usedGoods.place}</div>
					</c:if> --%>
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
		<div>
			<div class="d-flex justify-content-end">
				<a href=""><img alt="메뉴아이콘" src="https://cdn-icons-png.flaticon.com/512/3018/3018442.png" width="25px"></a>
			</div>
			<h5 class="font-weight-bold">${postView.usedGoods.title}</h5>
			<div class="small text-secondary pb-1">${postView.usedGoods.category} ∙ ${postView.usedGoods.createdAt}</div>
			<h5 class="font-weight-bold">${postView.usedGoods.price}원</h5>
			<div class="pt-3 pb-3">${postView.usedGoods.content}</div>
			<div class="small text-secondary">관심9 채팅15 조회34</div>
			<div class="d-flex justify-content-end">
				<a href="#" class="pr-3 pt-1"><img alt="관심 아이콘" src="/static/img/heart.png" width="30px"></a>
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