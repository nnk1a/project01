<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board2</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/board.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function() {		
		//var list = []; //보드 내용 가져오기
		let totalCount = 0;
		let pageNo = 1;
		//ajax 호출
		ajax_call(1);
		function ajax_call(pageNo) {
			$.ajax({
				url: "./boardList2", //localhost/board2?pageNo=1
				type: "get",
				data: {"pageNo": pageNo},
				dataType: "json",
				success: function(data){
					totalCount = data.totalCount;
					pageNo = data.pageNo;
					console.log(totalCount);
					let list = data.list;
					$(".tableHead").empty(); //비우기
					$(".paging").empty(); //비우기
					let html = "";
					$.each(list, function(index) {
						html += "<tr>";
						html += "<td>" + list[index].bno + "</td>";
						html += "<td>" + list[index].btitle + "</td>";
						html += "<td>" + list[index].m_name + "</td>";
						html += "<td>" + list[index].bdate + "</td>";
						html += "<td>" + list[index].blike + "</td>";
						html += "</tr>";
					});
					$(".tableHead").append(html);
					//페이징하기
					//$(".paging").text(data.totalCount + ":" + data.pageNo);
					let pages = totalCount / 10;
					if(totalCount % 10 != 0){
						pages = pages + 1;
					}
					$(".paging").append("<button class='first'>◀◀</button>");
					if(pageNo != 1){
						$(".paging").append("<button class='backward'>◀</button>");
					} else{
						$(".paging").append("<button disabled='disabled'>◀</button>");						
					}
					for(let i = 1; i <= pages; i++){
						$(".paging").append("<button class='page'>" + i + "</button>");
					}
					if(pageNo + 1 < pages){
						$(".paging").append("<button class='forward'>▶</button>");
					} else{
						$(".paging").append("<button disabled='disabled'>▶</button>");						
					}
					$(".paging").append("<button class='last'>▶▶</button>");
				},
				error: function(error){
					alert("에러가 발생했습니다. : " + error);
				}
			});//ajax endS
		}//ajax_call
		$(document).on("click", ".page", function(){
			let pageNo = $(this).text();
			ajax_call(pageNo);
		});
		
		$(document).on("click", ".forward", function(){
			pageNo = pageNo + 1;
			ajax_call(pageNo);
		});
		
		$(document).on("click", ".backward", function(){
			pageNo = pageNo - 1;
			ajax_call(pageNo);
		});
		
		$(document).on("click", ".first", function(){
			pageNo = 1;
			ajax_call(pageNo);
		});
		
		$(document).on("click", ".last", function(){
			pageNo = 25;
			ajax_call(pageNo);
		});
	});
</script>
</head>
<body>
<%@ include file="menu.jsp" %>
	<div>
	<h1>게시판2</h1>
	<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody class="tableHead"></tbody>
	</table>
	<div class="paging"></div>
	</div>
</body>
</html>