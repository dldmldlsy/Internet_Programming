<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
//드라이버 로드
Class.forName("org.mariadb.jdbc.Driver");
//연결자정보가져오는데 필요한 값 미리 변수에 저장.
String DB_URL = "jdbc:mariadb://localhost:3303/movieboard?useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD= "1234";

Connection con=null;
PreparedStatement pstmt = null;
ResultSet rs=null;
try {
	//DB 연결자 정보 가져오기 
	con =DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	//movie 테이블의 모든 필드의 레코드를 가져오는 퀴리문 구성 
	String sql = "SELECT * FROM movie order by uploadTime desc ";
	
	//sql문을 실행하기 위한 PreparedStatement 객체를 생성
	pstmt = con.prepareStatement(sql);

	//쿼리 실행
	rs = pstmt.executeQuery(); //select문이니까 바로 resultset객체 반환. 
%>
<!DOCTYPE html>
<html>
<head><title>동영상 목록 출력페이지</title>
<style>
li{font-size:18px; }
table{position: absolute; left: 250px; top:150px;text-align:center;}
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
}

.third{
    float: right;
    width:20%;
    box-sizing: border-box;
}
.h{background-color: #FFEFD5;color:#C2722E	}
.menu{position: absolute; top:100px; width: 200px; background-color:ivory; }
</style></head>

<body>
<div class="parent">
<div class="first"> 
<img src="boardlogo.png" onclick="location.href='movie_list.jsp'" title="메인화면으로 이동" height="100" width="120">
</div>
<div class="second">
<form action="movie_search.jsp">
<fieldset id="search">
<legend>게시글 검색</legend>
<label>검색분류</label>
<select name="kind">
<option value="movieTitle">동영상제목</option>
<option value="movieInfo">동영상내용</option>
</select>
<label>검색어</label>
<input type="text" name="keyword">
<input type="submit" value="검색">
</fieldset>
</form>
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

<div class="content">
<table border="1" style="border-collapse:collapse">
<%
//테이블태그 속 while문을 통해 검색된 모든 레코드를 돌면서 값들을 가져와 출력함.  쿼리의 결과의 테이블자체를 받은 객체 rs를 통해 각 필드의 자료형에 걸맞게 get함수를 써주면 해당 필드 값을 가져올 수 있음. 
	while(rs.next()) { //커서 한칸씩 이동
%>
<tr><th class="h">동영상 번호 <%=rs.getInt("movieIdx")%></th><th class="h">[<%=rs.getString("boardMenu")%>]</th></tr>
<tr>
<td rowspan="3"><img src="./upload/<%=rs.getString("thumbFileName")%>" onclick="location.href='movieInfo.jsp?idx=<%=rs.getInt("movieIdx")%>'" width="300" height="200"></td>
<td><a href="movieInfo.jsp?idx=<%=rs.getInt("movieIdx")%>"><%=rs.getString("movieTitle")%></a></td></tr>
<tr><td><small>작성자ID</small> <%=rs.getString("userID")%></td></tr>
<tr><td><small>업로드&nbsp;일시</small><br><%=rs.getString("uploadTime")%></td></tr>
<%} 
%>
</table>
</div>
</body>
</html>
<%
	//resultset, preparestatement, connection 객체 close
	rs.close();
	pstmt.close();
	con.close();
}catch(SQLException e) {
	out.println(e);
}
%>