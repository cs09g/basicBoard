<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Writing</title>
</head>
<body>
	<form method="post" action="insert.do" enctype="multipart/form-data" onsubmit="return formCheck();">
		Title: <input type="text" name="title"><br>
		Writer: <input type="text" name="writer"><br>
		Content: <textarea rows="10" cols="20" name="content"></textarea><br>
		file: <input type="file" name="filename"><br>
		<input type="submit">
	</form>
	<script>
	function formCheck(){
		var length = document.forms[0].length-1;
		var regex = ['/^(\w+)@(\w+)[.](\w+)$/ig', '/^(\w+)@(\w+)[.](\w+)[.](\w+)$/ig']; // for email
		
		for(var i=0;i<length;i++){
			if(document.forms[0][i].value == null || document.forms[0][i].value == ""){
				alert("enter " + document.forms[0][i].name);
				document.forms[0][i].focus();
				return false;
			}
			else{
				//check form validation here
				if(document.forms[0][i].name == "writer"){
					var ok = false;
					if((document.forms[0][i].value).match(/^(\w+)@(\w+)[.](\w+)$/ig) ||
						(document.forms[0][i].value).match(/^(\w+)@(\w+)[.](\w+)[.](\w+)$/ig)){
						ok = true;
						break;
					}
					if(!ok){
						alert('enter valid writer');
						return false;
					}
					
				}
			}
			
		}
	}
	</script>
</body>
</html>