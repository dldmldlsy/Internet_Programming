<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String sid=request.getParameter("id");
String sname=request.getParameter("name");
String spwd=request.getParameter("pwd");
String[] sfoods=request.getParameterValues("foods");
String sjop=request.getParameter("job");

int foodIdx=-1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 입력 결과</title>
<script>
window.onload=function(){
	var foodsArr=document.getElementsByName("foods");
<% //js가 아니라 자바문법
for(int i=0;i<sfoods.length;i++){
	if(sfoods[i].equals("사과")){
		foodIdx=0;
	}else if(sfoods[i].equals("바나나")){
		foodIdx=1;
	}else if(sfoods[i].equals("포도")){
		foodIdx=2;
	}
%>
   foodsArr[<%=foodIdx%>].checked=true;
<%
}
%>

document.getElementById("job").selectedIndex=<%=sjop%>;
}
</script>
</head>
<body>
<table>
<tr>
	<td>아이디</td>
	<td>
		<input type="text" name="id" readonly value="<%=sid%>">
	</td>
</tr>
<tr>
	<td>성명</td>
	<td>
		<input type="text" name="name" readonly value="<%=sname%>">
	</td>
</tr>
<tr>
	<td>암호</td>
	<td>
		<input type="text" name="pwd" readonly value="<%=spwd%>">
	</td>
</tr>
<tr>
	<th>음식</th>
	<td>
		<input type="checkbox" name="foods"	value="사과" disabled>사과
		<input type="checkbox" name="foods" value="바나나" disabled>바나나
		<input type="checkbox" name="foods" value="포도" disabled>포도
	</td>
</tr>
<tr>
	<th>직업</th>
	<td>
		<select name="job" id="job" disabled>
		<option value="컴퓨터기사">컴퓨터기사</option>
		<option value="요리사">요리사</option>
		<option value="프로게이머">프로게이머</option>
		<option value="학생">학생</option>
		</select>
	</td>
</tr>
</table>
</body>
</html>