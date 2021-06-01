<%@ page contentType="text/html; charset=UTF-8" import="myBean.*, java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");

String idx=request.getParameter("idx"); 

VideoInfo video=new VideoInfo();
VideoInfoDB db= new VideoInfoDB();
video=db.getRecord(Integer.parseInt(idx));


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동영상 상세출력</title>
</head>
<body>
동영상제목 : <input type="text" name="videoTitle" maxlength="50" readOnly value="<%=video.getVideoTitle()%>"><br>
작성자ID : <input type="text" name="userId" maxlength="20" size="12" readOnly value="<%=video.getUserId()%>"><br>
비밀번호 : <input type="password" name="pwd" readOnly value="<%=video.getPwd()%>"><br>
게시판선택:
		<select name="menu" >
		<option value="0">게시판메뉴1</option>
		<option value="1">게시판메뉴2</option>
		<option value="2">게시판메뉴3</option>
		<option value="3">게시판메뉴4</option>
		<option value="4">게시판메뉴5</option>
		</select><BR>
동영상설명<BR>
<textarea cols="25" rows="7" name="videoDesc" style="white-space: pre"></textarea><BR>
<input type="button" value="수정" onClick="location.href='video_modify.jsp?idx='">

</body>
</html>
<%
 db.close();
 %>