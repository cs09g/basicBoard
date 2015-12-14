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
<title>Testing board</title>
</head>
<body>
<style>
tr, td{
	border: 1px solid black;
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
					<td>${article.idx}</td>
					<td><a href="count.do?idx=${article.idx}">${article.title}</a></td>
					<td>${article.writer}</td>
					<td>${article.ip}</td>
					<td>${article.date}</td>
					<td>${article.count}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${page>0}">
		<a href="list.do?page=${page-10}">prev</a>
	</c:if>
	<c:if test="${page==0}">
		<a href="#">prev</a>
	</c:if>
	
	<fmt:parseNumber value="${page/10+1}" type="number" integerOnly="True" />page
	
	<c:if test="${fn:length(articleList)==10}">
		<a href="list.do?page=${page+10}">next</a>
	</c:if>
	<c:if test="${fn:length(articleList)<10}">
		<a href="#">next</a>
	</c:if>
</body>
</html>