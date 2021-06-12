<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
String kind=request.getParameter("kind");
String keyword=request.getParameter("keyword");
String keyword_search="%"+keyword+"%";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
table,tr,td{border-collapse: collapse}</style></head>
<body>
</head>
<body>
<%--데이터베이스사용할거니까 관련코드 --%>
<%
Class.forName("org.mariadb.jdbc.Driver");
String DB_URL = "jdbc:mariadb://localhost:3303/movieboard?useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD= "1234";

Connection con=null;
PreparedStatement pstmt = null;
ResultSet rs=null;
try {
	//1. DB 연결자 정보를 획득한다.
	con =DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	String sql="";
	//2. member 테이블에서 모든 필드의 레코드를 가져오는 퀴리 문자열을 구성한다. 
	if(kind.equals("movieTitle")){
		sql = "SELECT * FROM movie WHRER movieTitle LIKE ?";
	}else{
		sql="SELECT * FROM movie WHERE movieInfo LIKE ?";
	}
	//3. sql문을 실행하기 위한 PreparedStatement 객체를 생성한다.
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1,keyword_search);
	//4. 쿼리 실행
	rs = pstmt.executeQuery(); //select문이니까 바로 resultset객체 반환. 
%>
<p><a href="movie_upload.jsp">동영상등록</a></p>
<table border="1">
	<tr>
		<th>동영상번호</th>
		<th>동영상제목</th>
		<th>작성자ID</th>
		<th>게시판선택</th>
		<th>업로드일시</th>
		<th>썸네일이미지</th>
		<th>동영상설명</th>
	</tr>
<%
	while(rs.next()) {
%>
		<tr>
			<td><%= rs.getInt("movieIdx")%> </td>
			<td><a href="movieInfo.jsp?idx=<%=rs.getString("movieIdx")%>"><%= rs.getString("movieTitle")%></a></td>
			<td><%= rs.getString("userID")%> </td>
			<td><%=rs.getString("boardMenu")%>
			<td><%= rs.getString("uploadTime") %></td>						
			<td>
			<img src="./upload/<%=rs.getString("thumbFileName")%>" width="50" height="50">
			</td>
			<td><%=rs.getString("movieInfo") %>
		</tr> 
<%
	}
	
	rs.close();
	pstmt.close();
	con.close();
}catch(SQLException e) {
	out.println(e);
}
%>
</table>
</body>
</html>