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
		listHtml += "</table>";
		$("#view").html(listHtml);
  	}
  </script>
</head>
<body>
 
<div class="container">
  <h2>제목</h2>
  <div class="panel panel-default">
    <div class="panel-heading">Board</div>
    <div class="panel-body" id="view">
    </div>
    <div class="panel-footer">중고마켓</div>
  </div>
</div>

</body>
</html>
    