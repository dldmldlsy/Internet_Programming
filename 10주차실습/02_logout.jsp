<%-- 02_logout.jsp --%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
session.invalidate(); 
%>
<%--현재브라우저에 있던 세션 다 날라감.  --%>
<script>
alert('sign outed.');
location.href="02_login.jsp"; //자바스크립트코드로 씀. 
<%--아까처럼 아래처럼해도 됨.
<%response.sendRedirect("02_login.jsp");%>
--%>
</script>
