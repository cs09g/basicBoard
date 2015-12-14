<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<title>Insert title here</title>
</head>
<body>
<script>
$.ajax({
	type: "post",
	url: "${url}",
	success: function(data){
		$("#content").html(data);	
	}	
});
function chkContent(){
	if($(document).hasClass("mw_layer")===true){
		closeContent();
	}
	else{
		location.href="list.do";
	}
}
</script>
<div id="content"></div>
</body>
</html>