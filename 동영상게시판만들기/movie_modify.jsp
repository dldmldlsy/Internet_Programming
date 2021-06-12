<%@ page contentType="text/html;charset=utf-8"
import="myBean.*" %>
<%
request.setCharacterEncoding("utf-8");

String idx=request.getParameter("idx");

Movie mv=new Movie();
MovieDB db=new MovieDB();
mv=db.getMovie(Integer.parseInt(idx));

%>
<!DOCTYPE html>
<html>
<head><title>동영상 정보 수정</title></head>
<body>
<form method="POST" action="movie_modify_do.jsp" enctype="multipart/form-data" >
동영상번호: <input type="text" name="movieIdx" readOnly value="<%=idx%>"><br>
동영상제목: <input type="text" name="movieTitle" value="<%=mv.getMovieTitle()%>"><br>
작성자ID: <input type="text" name="userID" value="<%=mv.getUserID()%>"><br>
게시판선택:
		<select name="boardMenu">
	    <option value="자취요리">자취요리</option>
		<option value="맛집탐방">맛집탐방</option>
		<option value="에버랜드">에버랜드</option>
		<option value="인후이야기">인후이야기</option>
		<option value="강릉투어">강릉투어</option>
		</select><br>
썸네일이미지선택: <input type="file" name="thumbFileName" ><br>
기존 썸네일 이미지: <%=mv.getThumbFileName()%><br>
<img src="./upload/<%=mv.getThumbFileName()%>" width="100" height="100"><br>
동영상파일선택: <input type="file" name="movieFileName" ><br>
기존 동영상파일: <%=mv.getMovieFileName()%><br>
<video src="./upload/<%=mv.getMovieFileName()%>" width="100" height="100"></video><br>
암호 : <input type="password" name="pwd"><br>
<input type="hidden" name="uploadTime" id="uploadTime" value="">
동영상설명<br>
<textarea cols="25" rows="7" name="movieInfo" style="white-space: pre">
<%=mv.getMovieInfo()%></textarea><br>
<input type="submit" value="수정 완료" onclick="alert_modify()"> 
<input type="reset" value="수정 취소"> 
</form>
<script>
function alert_modify(){
var res=confirm("정말 게시글을 수정하시겠습니까?");
if(res){
	alert("게시글 수정완료!");
	var n=new Date();
	var h=document.getElementById("uploadTime");
	h.value=n.toLocaleString();
	location.href="movie_modify_do.jsp";
}else{
	return false;}
}
</script>
</body>
</html>