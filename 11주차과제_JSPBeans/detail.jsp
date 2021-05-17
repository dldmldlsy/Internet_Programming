<%--detail.jsp --%>
<%@ page contentType="text/html; charset=utf-8" import="myBean.*"%>
<%
request.setCharacterEncoding("utf-8");
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
.input{
border: none;
width: 300px;
font: 12px sans-serif;
text-align:left;
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
</head>
<body>
<jsp:useBean id="videoInfo" class="myBean.VideoInfo" scope="page"/>
<jsp:setProperty name="videoInfo" property="*"/>

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
<table>

<tr>
    <td colspan="2" style="border: 1px solid black; text-align: center;" id="video">동영상 출력란</td>
</tr>
<tr>
	<td class="nm">제목</td>
	<td class="input">
		<jsp:getProperty name="videoInfo" property="tit"/>
	</td>
</tr>
<tr>
	<td class="nm">작성자ID</td>
	<td class="input">
		<jsp:getProperty name="videoInfo" property="id"/>
	</td>
</tr>
<tr>
<td class="nm">업로드일시</td>
<td class="input" width=400px>
	<jsp:getProperty name="videoInfo" property="upload_time"/>
</td>
</tr>
<tr>
<td class="nm">게시판메뉴</td>
<td class="input"><jsp:getProperty property="menu" name="videoInfo"/></td>
</tr>
<tr>
    <td class="nm">동영상설명</td>
	<td>
	<textarea cols="15" rows="7"  class="input" disabled><jsp:getProperty name="videoInfo" property="info"/>
	</textarea>
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
</div>
</div>
</body>
</html>