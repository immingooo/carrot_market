<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="d-flex justify-content-center">
	<div class="search-box bg-light h-100 mb-5 mt-4 pr-5 pl-5" data-keyword="${keyword}">
		
	</div>
		
</div>

<script>
	$(document).ready(function() {
		let keyword = $('.search-box').data('keyword');
		console.log(keyword);
		
		$.ajax({
			type:"get"
			, url:"/main/search_result_view"
			, data:{"keyword":keyword}
		
			, success:function(data) {
				console.log(data) // data에 searchContent가 들어있음
				$('.search-box').html(data)
			}
			, error:function(e) {
				alert("검색에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
</script>