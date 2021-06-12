<%@ page contentType="text/html;charset=utf-8" import="java.sql.*, java.io.*,myBean.*" %>
<%
request.setCharacterEncoding("utf-8");
 
try {
	String idx =request.getParameter("idx");
 
	MovieDB db=new MovieDB();
	db.deleteMovie(Integer.parseInt(idx));
	db.close();
} catch (SQLException e) {
	//SQL에 대한 오류나, DB 연결 오류 등이 발생하면, 그 대처 방안을 코딩해 준다.
	out.println(e.toString());
	return;
} catch (Exception e) { 
	//SQLException 이외의 오류에 대한 대처 방안을 코딩해 준다.
	out.println(e.toString());
	return;
}


/* 오류 발생하거나 화면에 아무것도 나타나지 않으면 이곳을  주석 처리하여 오류를 확인할 것 */
response.sendRedirect("movie_list.jsp");   
%> 