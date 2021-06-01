<%@ page  contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
//ⓑ JDBC Driver(Connector) 클래스 로드
Class.forName("org.mariadb.jdbc.Driver");

String DB_URL = "jdbc:mariadb://localhost:3303/mydb?useSSL=false";
		//★주의 : mydb를 자신이 생성한 DB이름으로 변경하여 테스트 할것~!

String DB_USER = "admin";
String DB_PASSWORD= "1234";

Connection con= null;
Statement stmt = null;
ResultSet rs   = null;

try {
    
    con = DriverManager.getConnection(DB_URL, DB_USER,DB_PASSWORD); //ⓒ 연결자 획득
    		
    
    stmt = con.createStatement(); //ⓓ Statement 객체 생성

    
    String query =  "SELECT * FROM videolist";//ⓔ member 테이블의 모든 필드를 검색하는 쿼리 구성
    rs = stmt.executeQuery(query);//ⓕ 쿼리 실행

%>
<table border="1" style="border-collapse:collapse">
<tr style="background-color:#dddddd">
	<th>번호</th>
	<th>동영상제목</th>
	<th>작성자ID</th>
	<th>비고</th>
</tr>
<%
    while(rs.next()) {
%><tr>
<td><%= rs.getInt("videoIdx")%></td>
<td><%=rs.getString("videoTitle")%></td>
<td><%= rs.getString("userId")%></td>
<TD>
<!-- 자세히보기 -->
<a href="video_detail.jsp?idx=<%=rs.getInt("idx")%>">보기</a>
</TD>

</tr>
<%
    } // end while
%></table>
<%

	rs.close();     // ResultSet 종료

    stmt.close();     // Statement 종료

    con.close(); 	// Connection 종료

} catch (SQLException e) {
      out.println("err:"+e.toString());
      return;
} 
%>
<A href="video_upload.jsp">동영상업로드</A>