<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*, java.util.*, java.util.regex.Pattern, java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Read</title>
</head>
<body>
<style>
tr, td{
	border: 1px solid black;
}
.keys{
	font-weight: bold;
}
</style>
<iframe id="ifrm_filedown" style="position:absolute;z-index:1;visibility:hidden;"></iframe>
<h1>Read Article</h1>
	<a href='delete.do?idx=${idx}'>Delete</a>
	<a href="list.do">Main</a>
	<table style="border:1px solid black">
		<tr>
			<td class="keys">no</td>
			<td>${idx}</td>
			<td class="keys">writer</td>
			<td>${writer}</td>
			<td class="keys">ip</td>
			<td>${ip}</td>
			<td class="keys">date</td>
			<td>${date}</td>
			<td class="keys">read</td>
			<td>${count}</td>
		</tr>
		<tr>
			<td class="keys" colspan="2">title</td>
			<td colspan="8">${title}</td>
		</tr>
		<tr>
			<td class="keys" colspan="2">content</td>
			<td colspan="8" height="50">${content}</td>
		</tr>
		<tr>
			<td class="keys" colspan="2"'>filename</td>
			<td colspan="8"><a href="#" onclick="onDownload(${filename}})">${filename}</a></td>
		</tr>
	</table>
	<script>
	function onDownload(filename){
		location.href="download.do?filename="+filename;
	}
	</script>
</body>
</html>