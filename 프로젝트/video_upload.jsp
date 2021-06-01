<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동영상 업로드</title>
</head>
<body>
<form action="video_upload_do.jsp" method="post">
동영상제목 : <input type="text" name="videoTitle" maxlength="50" size="12"><br>
작성자ID : <input type="text" name="userId" maxlength="20" size="12"><br>
비밀번호 : <input type="password" name="pwd"><br>
게시판선택:
		<select name="menu" id="menu">
		<option value="0">게시판메뉴1</option>
		<option value="1">게시판메뉴2</option>
		<option value="2">게시판메뉴3</option>
		<option value="3">게시판메뉴4</option>
		<option value="4">게시판메뉴5</option>
		</select><BR>
동영상설명<BR>
<textarea cols="25" rows="7" name="videoDesc" style="white-space: pre"></textarea><BR>
<input type="submit" value="신규 등록">
</form>
</body>
</html>
 