<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Spring MVC</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 
<div class="container">
  <h2>K중고마켓</h2>
  <div class="panel panel-default">
    <div class="panel-heading">상품목록</div>
    <div class="panel-body">
    <table class="table table-bordered table-hover">
    <tr>
    	<td>번호</td>
    	<td>제목</td>
    	<td>작성자</td>
    	<td>작성</td>
    	<td>조회수</td>
    </tr>
    <c:forEach var="vo" items = "${list}">
        <tr>
    	<td>${vo.id}</td>
    	<td>${vo.title}</td>
    	<td>${vo.writer}</td>
    	<td>${vo.indate}</td>
    	<td>${vo.count}</td>
    	</tr>
     </c:forEach>
    </table>
    <a href="boardForm.do" class="btn btn-primary btn-sm">상품 등록</a>
    
    </div>
    <div class="panel-footer">K중고마켓</div>
  </div>
</div>

</body>
</html>
    