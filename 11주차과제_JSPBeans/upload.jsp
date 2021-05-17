<%--upload.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>동영상 업로드</title>
</head>
<style>
#sm{
font-size: 11px;
}
#time{
font-size: 9px;}
.nm{
font: 13px sans-serif;
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
#inputdata{
position: absolute;
top: 80px;
left: 230px;
}

</style>
<script type="text/javascript">
 
function now_time(){
 
 var now = new Date();
 
 var y = now.getFullYear(); //년
 var M = now.getMonth(); //월
 var d = now.getDate();  //일
 var h = now.getHours();  //시
 var m = now.getMinutes();  //분
 var s = now.getSeconds();  //초
 
 document.getElementById("time").innerHTML 
 = "작성시간:  "+y+"- "+ (M+1)+"- "+d+" "+h+": "+m+": "+s
 //id가 clock인 html에 현재시각을 넣음
 
 setTimeout("now_time()", 1000);
 //1초마다 해당 펑션을 실행함.
}


</script>
<body onload="now_time()">
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

<div id="inputdata">
<form action="detail.jsp" id="fom" method="post" onsubmit="return nothing()">
<table>
<tr>
  <td id="first" colspan="2" ><span style="font-weight:bold;font-size: 15px" >동영상 업로드</span> 
  <sub><span id="sm">아래사항을 기입해주세요.</span></sub>   <sub id="time"></sub>
  </td>
</tr>
<tr>
	<td class="nm">제목</td>
	<td>
		<input type="text" id="tit" name="tit">
	</td>
</tr>
<tr>
	<td class="nm">작성자ID</td>
	<td>
		<input type="text" id="myId" name="id">
	</td>
</tr>
<tr>
	<td class="nm">동영상 업로드</td>
	<td>
		<input type="text" name="id" value="파일선택(추후구현)" disabled>
	</td>
</tr>
<tr>
	<td class="nm">썸네일 이미지 업로드</td>
	<td>
		<input type="text" name="id" value="파일선택(추후구현)" disabled>
	</td>
</tr>
<tr>
	<td class="nm">비밀번호</td>
	<td>
		<input type="password" id="pwd" name="pwd">
	</td>
</tr>
<tr>
	<td class="nm">게시판선택</td>
	<td>
		<select name="menu" id="menu">
		<option value="게시판메뉴1">게시판메뉴1</option>
		<option value="게시판메뉴2">게시판메뉴2</option>
		<option value="게시판메뉴3">게시판메뉴3</option>
		<option value="게시판메뉴4">게시판메뉴4</option>
		<option value="게시판메뉴5">게시판메뉴5</option>
		</select>
	</td>
</tr>
<tr>
    <td class="nm">동영상설명</td>
	<td>
		<textarea cols="25" id="info" rows="7" name="info" style="white-space: pre"></textarea>
	</td>
</tr>
<tr>
<td colspan="2">
<input type="hidden" name="upload_time" id= "up_time" value="">
</td>
</tr>
<tr>
<td></td>
	<td colspan="2">
		<input type="submit" value="신규등록" onclick="getclock();">
		<input type="button" value="등록취소" onclick="notupload()">
	</td>
	<td>
	</td>
</tr>
</table>
</form>
</div>
</div>
<script>
function nothing(){
	var objTitle=document.getElementById("tit");
	var objId=document.getElementById("myId");
	var objPwd=document.getElementById("pwd");
	var objInfo=document.getElementById("info");

	if(objTitle.value.length==0){
		alert("제목을 입력하세요.");
		objTitle.focus();
		return false;
	}else if(objId.value.length==0){
		alert("아이디를 입력하세요.");
		objId.focus();
		return false;
	}else if(objPwd.value.length==0){
		alert("비밀번호를 입력하세요.");
		objPwd.focus();
		return false;
	}else if(objInfo.value.length==0){
		alert("동영상설명란을 입력하세요.");
		objInfo.focus();
		return false;
	}else{
		alert("동영상이 등록되었습니다. ");
		return true;
	}


}
function getclock(){
	var n=new Date();
	var h=document.getElementById("up_time");
	h.value=n.toLocaleString();
}
function notupload(){
	var res;
	res=confirm("등록을 정말 취소하시겠습니까? 기록사항이 모두 사라집니다.");
	if(res){
		document.getElementById("fom").reset();
	}else{
		return false;
	}
}
</script>
</body>
</html>