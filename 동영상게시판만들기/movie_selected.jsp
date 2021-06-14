<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
String boardMenu=request.getParameter("boardName"); //카테고리의 게시판메뉴누르면 해당 게시판이름이 전달되므로 그 값을 받아서 저장.
//드라이버로드
Class.forName("org.mariadb.jdbc.Driver");
String DB_URL = "jdbc:mariadb://localhost:3303/movieboard?useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD= "1234";

//관련객체 생성
Connection con=null;
Statement stmt = null;
ResultSet rs=null;
try {
	//연결자 정보가져오기
	con =DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	//받아온 게시판이름의 레코드들을 출력하는 쿼리문 작성
	String sql = "SELECT * FROM movie WHERE boardMenu LIKE '"+boardMenu+"' order by uploadTime desc";

	stmt = con.createStatement();
	//쿼리 실행
	rs = stmt.executeQuery(sql); //select문이니까 바로 resultset객체 반환. 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선택된 게시판의 목록 출력페이지</title>
<style>
.nm{font:15px sans-serif;}
li{font-size:18px; }
table{position: absolute; left: 250px; top:100px;text-align:center;}
table,tr,td{border-collapse: collapse; border-color:lightgray;}
#logo, #uploadbtn{border: 0; outline:0;object-fit: cover;}
#search{height:100;width:350;}
.parent{
    width: 90%;
    margin: 10px auto;
}

.first {
    float: left;
    width:20%;
    box-sizing: border-box;
}

.second{
    float: left;
    margin-right: 5%;
    width:45%;
    box-sizing: border-box;
    color: #AE5E1A;
}

.third{
    float: right;
    width:20%;
    box-sizing: border-box;
}
.h{background-color: #FFEFD5;color:#C2722E;}
.menu{position: absolute; top:100px; width: 200px; background-color:ivory; }
</style></head>
<body>
<div class="parent">
<div class="first">
<img src="boardlogo.png" onclick="location.href='movie_list.jsp'" title="메인화면으로 이동" height="100" width="120">
</div>
<div class="second">
<h3>[<%=boardMenu%>] 게시판의 동영상 목록입니다.</h3>
</div>
<div class="third">
<button type="button" id="uploadbtn" onclick="location.href='movie_upload.jsp'"><img src="upload.png" title="게시글업로드페이지로 이동" height="100" width="180"></button>
</div></div>

<div class="menu">
<h4 style="text-align: center; font-size:25px; color:#FFBE0A;"><ins>CATEGORY</ins></h4>
<ul style="text-align:center; color: #AE5E1A;">
<li><a href="movie_selected.jsp?boardName=쿠킹로그">쿠킹로그</a>
<li><a href="movie_selected.jsp?boardName=여행로그">여행로그</a>
<li><a href="movie_selected.jsp?boardName=맛집로그">맛집로그</a>
<li><a href="movie_selected.jsp?boardName=운동로그">운동로그</a>
<li><a href="movie_selected.jsp?boardName=자유로그">자유로그</a>
</ul>
</div>

<%--쿼리문으로 검색된 레코드들을 돌면서 필요한 필드들을 출력. --%>
<table border="1" style="border-collapse:collapse">
<%
	while(rs.next()) {
%>
<tr><th class="h">동영상 번호 <%=rs.getInt("movieIdx")%></th><th class="h">[<%=rs.getString("boardMenu")%>]</th></tr>
<tr>
<td rowspan="3"><img src="./upload/<%=rs.getString("thumbFileName")%>" onclick="location.href='movieInfo.jsp?idx=<%=rs.getInt("movieIdx")%>'" width="300" height="200"></td>
<td><a href="movieInfo.jsp?idx=<%=rs.getInt("movieIdx")%>"><%=rs.getString("movieTitle")%></a></td></tr>
<tr><td><small>작성자ID</small> <%=rs.getString("userID")%></td></tr>
<tr><td><small>업로드일시</small><br><%=rs.getString("uploadTime")%></td></tr>
<%} 
%>
</table>
</body>
</html>
<%
rs.close();
	stmt.close();
	con.close();
}catch(SQLException e) {
	out.println(e);
}
%>
