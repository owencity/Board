<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "contextPath" value = "${pageContext.request.contextPath}" />

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">xx`
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">K중고마켓</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${contextPath}">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">소개<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">대표 인사말</a></li>
            <li><a href="#">회사 소개</a></li>
            <li><a href="#">목표하는 점</a></li>
          </ul>
        </li>
        <li><a href="#">공지사항</a></li>	
        <li><a href="boardMain.do">상품목록</a></li>
      </ul>
      <c:if test="${empty memberVo}">
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="${contextPath}/memJoin.do"><span class="glyphicon glyphicon-user" ></span>회원가입</a></li>
	        <li><a href="${contextPath}/memLoginForm.do"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
	      </ul>
      </c:if>
      <c:if test="${!empty memberVo}"> <!-- 회원가입 성공시, 로그인 성공시 -->
	      <ul class="nav navbar-nav navbar-right">
	        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리<span class="caret"></span></a>
          <ul class="dropdown-menu">
	        	<li><a href="${contextPath}/memUpdateForm.do"><span class="glyphicon glyphicon-user"></span>회원정보수정</a></li>
	        	<li><a href="#"><span class="glyphicon glyphicon-user"></span>프로필사진수정</a></li>
          </ul>
        </li>
	        <li><a href="${contextPath}/memLogout.do"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
	      </ul> 
      </c:if>
      
   
    </div>
  </div>
</nav>
