<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center">
	<div class="search-box bg-light h-100 mb-5 mt-4 pr-5 pl-5">
		
	</div>
</div>

<!-- <script>
	$(document).ready(function() {
		let keyword = $('#keyword').val().trim();
		
		$.ajax({
			type:"get"
			, url:"/main/search_result_view"
			, data:{"keyword":keyword}
		
			, success:function(data) {
				console.log(data) // data에 searchContent가 들어있음
				$('.search-box').html(data)
				//location.href="/main/search_result_view"
				//location.href="/main/search_view"; // ???
			}
			, error:function(e) {
				alert("검색에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
</script> -->