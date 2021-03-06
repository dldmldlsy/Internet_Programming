<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
String kind=request.getParameter("kind");
String keyword=request.getParameter("keyword");

String kind_of="";
if(kind.equals("movieTitle")){
	kind_of="동영상제목";
}else{
	kind_of="동영상내용";
}

Class.forName("org.mariadb.jdbc.Driver");
String DB_URL = "jdbc:mariadb://localhost:3303/movieboard?useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD= "1234";

Connection con=null;
Statement stmt = null;
ResultSet rs=null;
try {
	//연결자 정보 가져오기
	con =DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	String sql="";
	//해당 필드에서 검색어를 포함하는 레코드를 검색하는 쿼리문 구성 업로드 순으로 출력하기 위해 업로드일시를 기준으로 내림차순정렬해준다. 
	if(kind.equals("movieTitle")){
		sql = "SELECT * FROM movie WHERE movieTitle LIKE concat('"+"%"+keyword+"%"+"') order by uploadTime desc";
	}else{
		sql="SELECT * FROM movie WHERE movieInfo LIKE concat('"+"%"+keyword+"%"+"') order by uploadTime desc";
	}
	stmt = con.createStatement();
	//쿼리 실행 (조건에 맞는 레코드들만 검색된 테이블을 rs객체가 받음.)
	rs = stmt.executeQuery(sql); //select문이니까 바로 resultset객체 반환. 
%>
<!DOCTYPE html>
<html>
<head><title>동영상 검색결과 목록 출력페이지</title>
<style>
li{font-size:18px; }
table{position: absolute; left: 250px; top:150px;text-align:center;}
table,tr,td{border-collapse: collapse;border-color:lightgray;}
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
<h3><%=kind_of%>에 '<%=keyword%>'가 포함된 게시글의 목록입니다.</h3>
</div>
<div class="third">
<button type="button" id="uploadbtn" onclick="location.href='movie_upload.jsp'"><img src="upload.png" title="게시글업로드페이지로 이동" height="100" width="180"></button>
</div></div>

<div class="menu">
<h4 style="text-align: center; font-size:25px; color:#FFBE0A;"><ins>CATEGORY</ins></h4>
<ul style="text-align:left; color: #AE5E1A;">
<li><a href="movie_selected.jsp?boardName=쿠킹로그">쿠킹로그</a>
<li><a href="movie_selected.jsp?boardName=여행로그">여행로그</a>
<li><a href="movie_selected.jsp?boardName=맛집로그">맛집로그</a>
<li><a href="movie_selected.jsp?boardName=운동로그">운동로그</a>
<li><a href="movie_selected.jsp?boardName=자유로그">자유로그</a>
</ul>
</div>

<%--해당 동영상 목록을 while문을 통해 커서를 이동해가며 출력시킨다.  --%>
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
