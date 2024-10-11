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
  			url : "/board/getList",
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
	  		listHtml +="<td id='t"+obj.id+"'><a href='javascript:goContent("+obj.id+")'>"+obj.title+"</a></td>";
	  		listHtml +="<td>"+obj.writer+"</td>";
	  		listHtml +="<td>"+obj.indate+"</td>";
	  		listHtml +="<td id = 'cnt"+obj.id+"'>"+obj.count+"</td>";
			listHtml +="</tr>";
			
			listHtml += "<tr id='c" + obj.id + "' style='display:none'>";
			listHtml += "<td>내용</td>";
			listHtml += "<td colspan='4'>";
			listHtml += "<textarea id='ta"+obj.id+"' readonly rows='7' class= 'form-control'></textarea>";
			listHtml += "<br/>";
			listHtml += "<span id='ub"+obj.id+"'><button class='btn btn-success btn-sm' onclick='goUpdateForm("+obj.id+")'>수정화면</button></span>&nbsp;";
			listHtml += "<button class='btn btn-warning btn-sm' onclick='goDelete("+obj.id+")'>삭제</button>";
			listHtml += "</td>";
			listHtml += "</tr>";
			listHtml += "</tr>";
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
  			url : "/board/saveboard",
  			type : "post",
  			data : fData,
  			success : loadList,
  			error : function() {
				alert("error");
			}
  		});
  		// 폼 초기화
/*   		$("#title").val("");
  		$("#content").val("");
  		$("#writer").val(""); */
  		
  		$("#fclear").trigger("click");
  	}
  	
  	// 상세내용 펼치기
  	function goContent(id) {
  		if($("#c"+id).css("display")=="none") {
  			$.ajax({
  				url : "/board/showcontent",
  				type : "get",
  				data : {"id" : id},
  				dataType : "json",
  				success : function(data) {
  					$("#ta" + id).val(data.content);
  				},
  				error : function() {
  					alert("Error")
  				}
  			})
  			
  			$("#c"+id).css("display", "table-row");
  			$("#ta"+id).attr("readonly", true);
  		}
  		else {
  			$("#c"+id).css("display", "none");
  			$.ajax({
  				url : "/board/count",
  				type : "get",
  				data : {"id" : id},
  				dataType : "json",
  				success : function(data) {
  					$("#cnt"+id).text(data.count);
  				},
  				error : function() { alert ("error");}
  			
  			});
  		}
  	}
  	function goDelete(id){
  		$.ajax( {
  			url : "/board/deleteboard",
  			type : "get",
  			data : {"id":id},
  			success : loadList,
  			error : function() {
  				alert("error");
  			}
  		});
  	}
  	function goUpdateForm(id) {
  		$("#ta"+id).attr("readonly", false);
  		var title=$("#t" + id).text();
  		var newInput = "<input type='text' id='nt"+id+"' class='form-control'/ value='"+title+"'/>";
  		
  		$("#t"+id).html(newInput);
  		
  		var newButton = "<button class='btn btn-info btn-sm' onclick='goUpdate("+id+")'>수정</button>";
  		$("#ub" + id).html(newButton); 
  	}
  	function goUpdate(id) {
  		var title=$("#nt"+id).val();
  		var content=$("#ta"+id).val();
  		$.ajax({
  			url : "/board/updateboard",
  			type : "post",
  			data : {"id" : id, "title" : title, "content" : content},
  			success : loadList,
  			error : function() { alert("error")}
  		});
  	}
  </script>
</head>
<body>
 
<div class="container">
  <h2>K중고마켓</h2>
  <div class="panel panel-default">
    <div class="panel-heading">상품목록</div>
    <div class="panel-body" id="view"></div>
    <div class="panel-body" id="wform" style="display: none">
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
				<button type="reset" 	class="btn btn-warning btn-sm" id="fclear">취소</button>
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
    