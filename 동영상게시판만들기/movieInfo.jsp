<%@ page contentType="text/html; charset=UTF-8" import="myBean.*, java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");

String idx=request.getParameter("idx"); 

Movie mv=new Movie();
MovieDB db=new MovieDB();
mv=db.getMovie(Integer.parseInt(idx));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동영상 상세출력</title>
</head>
<body>
동영상제목 : <input type="text" name="movieTitle" maxlength="50" readOnly value="<%=mv.getMovieTitle()%>"><br>
동영상:<br>
<video src="./upload/<%=mv.getMovieFileName()%>" controls width="300" height="300"></video><br>
작성자ID : <input type="text" name="userID" maxlength="20" size="12" readOnly value="<%=mv.getUserID()%>"><br>
게시판이름: <%=mv.getBoardMenu()%><br>
업로드일시: <%=mv.getUploadTime()%><br>
동영상설명<br>
<textarea cols="15" rows="7" disabled><%=mv.getMovieInfo()%></textarea><br>
<input type="button" value="수	정" onclick="location.href='movie_modify.jsp?idx=<%=mv.getMovieIdx()%>'">
<input type="button" value="삭	제" onclick="alert_delete()">
</body>
<script>

function alert_delete(){
	var res=confirm("정말 게시글을 삭제하시겠습니까?");
	if(res){
		alert("게시글삭제완료!");
		location.href="movie_delete_do.jsp?idx=<%=mv.getMovieIdx()%>";
	}else{
		return false;
	}
}
</script>
</html>
<%
 db.close();
 %>