<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*, java.util.*, java.util.regex.Pattern, java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<title>Read</title>
</head>
<body>
<style>
.keys{
	font-weight: bold;
}
</style>
<iframe id="ifrm_filedown" style="position:absolute;z-index:1;visibility:hidden;"></iframe>
<script>

</script>
<h1>Read Article</h1>
	<a class="btn btn-default" href='delete.do?idx=${idx}'>Delete</a>
	<a class="btn btn-default" href="#" onclick="chkContent()">Main</a>
	<table class="table" style="margin-top:10px">
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
			<td colspan="8"><a href="#" onclick='onDownload("${idx}")'>${filename}</a></td>
		</tr>
	</table>
	<script>
	function onDownload(idx){
		document.getElementById("ifrm_filedown").src ="download.do?idx="+idx;
	}
	</script>
</body>
</html>