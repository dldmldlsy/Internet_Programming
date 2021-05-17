<%--detail.jsp --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");

String stitle=request.getParameter("tit");
String sid=request.getParameter("id");
String spwd=request.getParameter("pwd");
String smenu=request.getParameter("menu");
String sinfo=request.getParameter("info");
String stime=request.getParameter("upload_time");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>동영상 상세 출력</title>
<style>
td.nm{
font: 11px sans-serif;
width: 80px;
}
.cell{
border: none;
width: 300px;
}
#video{
height: 200px;
width: 380px;
}
#logo{
border: 0;
outline: 0;
width: 100px;
height: 50px;
}
ul{

list-style-type: circle;
padding: 20;
text-align: left;
}
li {
padding: 8px;}
}
.parent{
width: 100%;
}
.fst{
position: fixed:
top:0;
left: 30px;

}
.scd{
position: absolute;
top: 30px;
left: 200px;

}
.trd{
position: absolute;
top:20px;
right: 15px;
border:1px black;
background: transparent;
}
#next_parent{
width: 100%;
}
#menubar{
display: inline-block;
width: 200px;
}
#outputdata{
position: absolute;
top: 80px;
left: 230px;
}
</style>
<script>
function newupload(){
	alert("동영상이 등록되었습니다.");
}
</script>
</head>
<body onload="newupload()">

<div class="parent">

<div class="fst">
<button type="button" id="logo" title="메인화면가기">홈페이지 로고</button>
</div>

<div class="scd">
<input type="text" id="search"> <input type="button" value="검색">
</div>

<div class="trd"> 
<input type="button" value="글쓰기">
</div>

</div>

<div id="next_parent">
<div id="menubar">
<h4 style="text-align: center; color: indigo"><ins>CATEGORY</ins></h4>
<ul>
<li>게시판 메뉴1
<li>게시판 메뉴2
<li>게시판 메뉴3
<li>게시판 메뉴4
<li>게시판 메뉴5
</ul>
</div>
<div id="outputdata">
<form action="detail.jsp" method="post">
<table>

<tr>
    <td colspan="2" style="border: 1px solid black; text-align: center;" id="video">동영상 출력란</td>
</tr>
<tr>
	<td class="nm">제목</td>
	<td>
		<input type="text" class="cell" name="tit" readonly value="<%=stitle%>">
	</td>
</tr>
<tr>
	<td class="nm">작성자ID</td>
	<td>
		<input type="text" name="id" class="cell" readonly value="<%=sid%>">
	</td>
</tr>
<tr>
<td class="nm">업로드일시</td>
<td width=400px>
  <input type="text" class="cell" readonly value="<%=stime %>">
</td>
</tr>
<%-- 
<tr>
	<th>게시판선택</th>
	<td>
		<select name="menu" id="menu" disabled>
		<option value="0">게시판메뉴1</option>
		<option value="1">게시판메뉴2</option>
		<option value="2">게시판메뉴3</option>
		<option value="3">게시판메뉴4</option>
		<option value="4">게시판메뉴5</option>
		</select>
	</td>
</tr>
--%>
<tr>
    <td class="nm">동영상설명</td>
	<td>
	<textarea cols="15" rows="7"  class="cell" disabled><%=sinfo %> </textarea>
	</td>
</tr>
<tr>
    <td>
        <input type="button" value="수정">
    </td>
    <td>
        <input type="button" value="삭제">
     </td>
</tr>         

</table>
</form>
</div>
</div>
</body>
</html>