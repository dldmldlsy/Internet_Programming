<%-- isErrorPage="true" 속성을 사용한 페이지로 이동시킬 경우  --%>
<%@ page contentType="text/html; charset=UTF-8" errorPage="01_error.jsp" %>

 
<%-- web.xml에서 exception-type를 지정하여 예외처리 경우 
<%@ page contentType="text/html; charset=UTF-8"%>
--%>

<%--
이전페이지에서 받아올 폼데이터가 어떤 인코딩인지 지정
num1받아줌.(id)
--%>
<%
request.setCharacterEncoding("utf-8"); 
String sn1= request.getParameter("num1");
String sop= request.getParameter("op");
int num1=Integer.parseInt(sn1);

Integer obj=Integer.valueOf((request.getParameter("num2")));
int num2=obj.intValue();

int result=0;

switch(sop.charAt(0)){
case '+': result=num1+num2; 
     break;
case '-': result=num1-num2;
    break;
case '/': result=num1/num2;
    break;
default:
	break;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연산결과</title>
</head>
<body>
결과 : <%=num1 %><%=sop %><%=num2 %>=<%= result %>
</body>
</html>