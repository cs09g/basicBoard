<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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