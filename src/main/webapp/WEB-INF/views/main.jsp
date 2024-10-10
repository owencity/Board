<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Spring MVx	C</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script>
  	$(document).ready(function() {
  		loadList();
  	})
  	
  	// 리스트가져오기 
  	function loadList() {
  		$.ajax({
  			url : "boardList.do",
  			type : "get",
  			dataType : "json",
  			success : makeView,
  			error : function() {
				alert("error")
			}
  		});
  	}
  	
  	// 리스트 view
  	function makeView(data) {
  		var listHtml = "<table class='table table-bordered'>";
  		listHtml += "<tr>";
  		listHtml +="<td>번호</td>";
  		listHtml +="<td>제목</td>";
  		listHtml +="<td>작성자</td>";
  		listHtml +="<td>작성일</td>";
  		listHtml +="<td>조회수</td>";
		listHtml +="</tr>";
		$.each(data, function(index,obj){ 
			listHtml += "<tr>";
	  		listHtml +="<td>"+obj.id+"</td>";
	  		listHtml +="<td>"+obj.title+"</td>";
	  		listHtml +="<td>"+obj.writer+"</td>";
	  		listHtml +="<td>"+obj.indate+"</td>";
	  		listHtml +="<td>"+obj.count+"</td>";
			listHtml +="</tr>";
		});
		
		listHtml += "<tr>"
		listHtml += "<td colspan='5'>";
		listHtml += "<button class='btn btn-primary btn-sm' onclick='goForm()'>글쓰기</button>";
		listHtml += "</td>";
		listHtml += "</tr>";
		listHtml += "</table>";
		$("#view").html(listHtml);
		
		$("#view").css("display" , "block");
		$("#wform").css("display", "none");
  	}
  	
  	// 등록버튼 누를시 리스트는 안보이고 등록폼 보이게
  	function goForm() {
		$("#view").css("display" , "none");
		$("#wform").css("display", "block");
	}
  	
  	// 목록가기버튼 누를시 목록다시보이고 글쓰기폼 안보이게
  	function goList() {
		$("#view").css("display" , "block");
		$("#wform").css("display", "none");
	}
  	
  	// 등록 버튼 누르면 컨트롤러에 데이터 보내기
  	function goInsert() {
		var title = $("#title").val();
		var content = $("#content").val();
		var writer = $("#writer").val();
		
		var fData = $("#frm").serialize();
  		$.ajax({
  			url : "boardInsert.do",
  			type : "post",
  			data : fData,
  			success : loadList,
  			error : function() {
				alert("error");
			}
  		});
  		// 폼 초기화
  		$("#title").val("");
  		$("#content").val("");
  		$("#writer").val("");
  	}
  </script>
</head>
<body>
 
<div class="container">
  <h2>K중고마켓</h2>
  <div class="panel panel-default">
    <div class="panel-heading">상품목록</div>
    <div class="panel-body" id="view"></div>
    <div class="panle-body" id="wform" style="display: none">
    <form id="frm">
	<table class="table">
		<tr>
		<td>제목</td>
		<td><input type="text" id="title" name="title" class="form-control"/></td>
		</tr>
		
		<tr>
		<td>내용</td>
		<td><textarea rows ="7" id="content" class = "form-control" name = "content"></textarea></td>
		</tr>
		
		<tr>
		<td>작성자</td>
		<td><input type="text" id="writer" name="writer" class="form-control"/></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<button type="button" 	class="btn btn-success btn-sm" onclick="goInsert()">등록</button>
				<button type="reset" 	class="btn btn-warning btn-sm">취소</button>
				<button type="button" 	class="btn btn-info btn-sm" onclick="goList()">목록가기</button>
			</td>
		</tr>
	</table>   
	</form>
    </div>
    <div class="panel-footer">중고마켓</div>
  </div>
</div>

</body>
</html>
    