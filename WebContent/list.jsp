<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*, java.util.*, java.util.regex.Pattern, java.sql.*, java.util.ArrayList" %>
<%@ page import="com.board.beans.Board" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script>
function openContent(idx){
	$(".mw_layer").addClass("open");
	$.ajax({
		type: "post",
		url: "content.do",
		data: ({idx:idx}),
		success: function(data){
			$("#layer").html(data);		
		}
	});
}
$(function(){
	var layerWindow = $(".mw_layer");
	$(document).keydown(function(event){
		if(event.keyCode != 27) return true;
		if(layerWindow.hasClass("open")){
			layerWindow.removeClass("open");
		}
		return false;
	});
	layerWindow.find(">.bg").mousedown(function(event){
		layerWindow.removeClass("open");
		return false;
	});
});
</script>
<title>Testing board</title>
</head>
<body>
<style>
tr, td{
	border: 1px solid black;
}
.mw_layer{
	display: none;
	position: fixed;
	_position: absolute;
	top: 0;
	left: 0;
	z-index: 10000;
	width: 100%;
	heigth: 100%;
}
.mw_layer.open{
	display: block;
}
.mw_layer.bg{
	position: absolute;
	top:0;
	left:0;
	width:100%;
	height:100%;
	background:#000;
	opacity:.5;
	filter:alpha(opacity=50)
}
#layer{
	position:absolute;
	top:40%;
	left:40%;
	width:400px;
	height:400px;
	margin:150px 0 0 -194px;
	padding:28px 28px 0 28px;
	border:2px solid #555;
	background:#fff;
	font-size:12px;
	font-family:Tahoma, Geneva, sans-serif;
	color:#767676;
	line-height:normal;
	white-space:normal
}
</style>
<h1>Testing Board</h1>
	<a href="write.do">Write</a>
	<table style="border:1px solid black">
		<thead>
			<tr>
				<td>no</td>
				<td>title</td>
				<td>writer</td>
				<td>ip</td>
				<td>date</td>
				<td>read</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${articleList}" var="article">
				<tr>
					<td><a href="#layer" onclick="openContent('${article.idx}')">${article.idx}</a></td>
					<td><a href="count.do?idx=${article.idx}">${article.title}</a></td>
					<td>${article.writer}</td>
					<td>${article.ip}</td>
					<td>${article.date}</td>
					<td>${article.count}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!--
	<div id="append_article">
	</div>
	 
	<c:if test="${page>0}">
		<a href="list.do?page=${page-10}">prev</a>
	</c:if>
	<c:if test="${page==0}">
		<a href="#">prev</a>
	</c:if>
	
	<fmt:parseNumber value="${page/10+1}" type="number" integerOnly="True" />page
	-->
	<!--
	<c:if test="${fn:length(articleList)==10}">
	-->
		<input type="hidden" name="page" id="page" value="${page}">
		<a href="#" onclick="loadNextPage()">next</a>
	<!--
	</c:if>
	<c:if test="${fn:length(articleList)<10}">
		<a href="#">next</a>
	</c:if>
	-->
	<div class="mw_layer">
		<div class="bg"></div>
		<div id="layer"></div>
	</div>
	<script>
	function loadNextPage(){
		var page = $("#page").val();
		page = parseInt(page);
		page += 10;
		$.ajax({
			type: "post",
			url: "ajaxList.do",
			data: ({page:page}),
			success: function(data){
				$("table").append(data);
				$("#page").val(page);
			}
		});
	}
	</script>
</body>
</html>