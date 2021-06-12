<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="test_2.jsp">
<input type="hidden" name="uploadTime" id="uploadTime" value="">
<input type="submit" onclick="alert_submit()">

</form>

</body>
<script>
function alert_submit(){
	var n=new Date();
	var h=document.getElementById("uploadTime");
	h.value=n.toLocaleString();
}</script>

</html>