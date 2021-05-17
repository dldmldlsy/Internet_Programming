<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
String pass=request.getParameter("pass");

if(id.equals("admin")&& pass.equals("1234")){
	session.setAttribute("id",id);
	response.sendRedirect("02_login.jsp"); //되돌려보내기 (로그인된 상태로 되돌아감)
}else if(id.equals("admin")){ //패스워드틀렸을 경우
	out.println("<script>alert('wrong password'); history.back();</scrip>");
}else if(pass.equals("1234")){
	out.println("<script>alert('wrong id'); history.back();</script>");
}else{
	out.println("<script>alert('wrong id, password'); history.back();");
}
%>