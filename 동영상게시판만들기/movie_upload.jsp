<%@ page contentType="text/html;charset=utf-8" import="java.util.*"%>
<%
Date nowTime=new Date();

%>
<!DOCTYPE html>
<html>
<head><title>동영상업로드</title></head>
<body>
<form method="POST" action="movie_upload_do.jsp" enctype="multipart/form-data" >
동영상제목: <input type="text" name="movieTitle"><br>
작성자ID: <input type="text" name="userID"><br>
게시판선택:
		<select name="boardMenu">
		<option value="자취요리">자취요리</option>
		<option value="맛집탐방">맛집탐방</option>
		<option value="에버랜드">에버랜드</option>
		<option value="인후이야기">인후이야기</option>
		<option value="강릉투어">강릉투어</option>
		</select><br>
썸네일이미지선택: <input type="file" name="thumbFileName"><br>
동영상파일선택: <input type="file" name="movieFileName"><br>
<input type="hidden" name="uploadTime" id="uploadTime" value="">
암호 : <input type="password" name="pwd"><br>
동영상설명<br>
<textarea cols="25" rows="7" name="movieInfo" style="white-space: pre"></textarea><br>
<input type="submit" value="신규 등록" onclick="alert_submit()"> 
<input type="reset" value="등록 취소" >
</form>
<script>

function alert_submit(){
	var n=new Date();
	var h=document.getElementById("uploadTime");
	h.value=n.toLocaleString();
	
	var res=confirm("게시글을 등록하시겠습니까?");
	if(res){
		alert("게시글이 등록되었습니다.");
	}else{
		return false;}
}</script>
</body>
</html>