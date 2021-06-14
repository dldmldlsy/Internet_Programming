<%@ page contentType="text/html;charset=utf-8" import="java.sql.*, java.io.*,myBean.*" %>
<%
request.setCharacterEncoding("utf-8"); //인코딩셋
 
try {
	String idx =request.getParameter("idx"); //삭제버튼 누르면 삭제할 레코드의 movieIdx가 파라미터에 담겨넘어옴. 이를 받아서 저장.
 
	MovieDB db=new MovieDB(); //MovieDB객체 생성
	db.deleteMovie(Integer.parseInt(idx)); //deleteMovie 객체를 통해 해당 idx를 primarykey로 가진 레코드를 삭제한다. 
	db.close();
} catch (SQLException e) {//sql오류, db오류 등 발생시 
	out.println(e.toString()); //메세지출력
	return;
} catch (Exception e) { 
	out.println(e.toString());
	return;
}

response.sendRedirect("movie_list.jsp");   //전체 동영상 목록을 출력하는 목록 출력 페이지로 이동.
%> 