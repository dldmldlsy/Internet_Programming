<%@ page contentType="text/html; charset=UTF-8 " isErrorPage="true" %>
<%--
	0으로 나눌 경우에는 page지시어 상에 isErrorPage 속성을 사용하여 예외처리 하시오.
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류 페이지</title>
</head>
<body>
<p>
isErrorPage="true" 설정에 의한 exception 객체 처리 
</p>
오류 메시지 :
<%=exception.getMessage() %> <br>
<%=exception.getClass().getName() %>
</body>
</html>