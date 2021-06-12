<%@ page contentType="text/html; charset=UTF-8" 
	import="myBean.*"%>
<%
request.setCharacterEncoding("utf-8");
String uploadTime=request.getParameter("uploadTime");
Movie mv=new Movie();
mv.setUploadTime(uploadTime);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=mv.getUploadTime()%>
</body>
</html>