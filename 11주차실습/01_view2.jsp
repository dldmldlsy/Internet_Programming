<%@ page contentType="text/html; charset=UTF-8"
import="myBean.Calculator"%>
<%
request.setCharacterEncoding("utf-8");

Calculator cal=new Calculator(); 

double d1=Double.parseDouble(request.getParameter("num1"));
double d2=Double.parseDouble(request.getParameter("num2"));
String sop=request.getParameter("oper");

cal.setNum1(d1);
cal.setNum2(d2);
cal.setOper(sop.charAt(0));

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 빈즈(스크립트) 사용</title>
</head>
<body>
<p>빈즈 객체 사용하여 결과 출력</p>
<%= cal.getNum1()%><%=cal.getOper() %><%=cal.getNum2()%>
=<%=cal.getResult()%>
</body>
</html>