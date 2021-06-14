<%@ page contentType="text/html;charset=utf-8" import="java.util.*"%>

<!DOCTYPE html>
<html>
<head><title>동영상 등록 페이지</title>
<style>
.nm{font:15px sans-serif;}
li{font-size:18px; }
table,tr,td{border-collapse: collapse}
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
}

.third{
    float: right;
    width:20%;
    box-sizing: border-box;
}
.menu{position: absolute; top:100px; width: 200px; background-color:ivory; }
</style></head>
<body>
<div class="parent">
<div class="first">
<img src="boardlogo.png" onclick="location.href='movie_list.jsp'" title="메인화면으로 이동" height="100" width="120">
</div>

<div class="third">
<button type="button" id="uploadbtn" onclick="location.href='movie_upload.jsp'"><img src="upload.png" title="게시글업로드페이지로 이동" height="100" width="180"></button>
</div></div>

<div class="menu">
<h4 style="text-align: center; font-size:25px; color:#FFBE0A;"><ins>CATEGORY</ins></h4>
<ul style="text-align:center; color: #AE5E1A;">
<li><a href="movie_selected.jsp?boardName=쿠킹로그">쿠킹로그</a>
<li><a href="movie_selected.jsp?boardName=여행로그">여행로그</a>
<li><a href="movie_selected.jsp?boardName=맛집로그">맛집로그</a>
<li><a href="movie_selected.jsp?boardName=운동로그">운동로그</a>
<li><a href="movie_selected.jsp?boardName=자유로그">자유로그</a>
</ul>
</div>

<%--form태그를 통해 안에 name에 담긴 값들을 movie_upload_do.jsp페이지로 POST방식으로 전송한다.  --%>
<form method="POST" action="movie_upload_do.jsp" enctype="multipart/form-data" >

<fieldset style="width: 450px">
<legend style="font:18px"><strong>새 동영상 업로드</strong><sub>아래사항을 기입해주세요.</sub></legend>
<table>
<tr> 
  <td colspan="2" id="time" style="font-size:9px"></td>
</tr>
<tr>
	<td class="nm">동영상제목</td>
	<td><input type="text" id="movieTitle" name="movieTitle"></td>
</tr>
<tr>
	<td class="nm">작성자ID</td>
	<td><input type="text" id="userID" name="userID"></td>
</tr>
<tr>
	<td class="nm">썸네일 이미지 업로드</td>
	<td><input type="file" name="thumbFileName"></td>
</tr>
<tr>
	<td class="nm">동영상 업로드</td>
	<td><input type="file" name="movieFileName"></td>
</tr>
<tr>
	<td class="nm">비밀번호</td>
	<td><input type="password" id="pwd" name="pwd"></td>
</tr>
<tr>
	<td class="nm">게시판선택</td>
	<td>
		<select name="boardMenu" id="boardMenu">
		<option value="쿠킹로그">쿠킹로그</option>
		<option value="여행로그">여행로그</option>
		<option value="맛집로그">맛집로그</option>
		<option value="운동로그">운동로그</option>
		<option value="자유로그">자유로그</option>
		</select>
	</td>
</tr>
<tr>
    <td class="nm">동영상설명</td>
	<td><textarea cols="25" id="movieInfo" rows="7" name="movieInfo" style="white-space: pre"></textarea></td>
</tr>
<tr>
<td colspan="2">
<input type="hidden" name="uploadTime" id= "uploadTime" value="">
</td>
</tr>
<tr>
<td></td>
	<td colspan="2">
		<input type="submit" value="신규	등록" onclick="alert_submit()">
		<input type="reset" value="등록	취소">
	</td>
	<td>
	</td>
</tr>
</table>
</fieldset>
</form>
<script>
// submit버튼이 눌렸을 때 등록여부를 다시 한번 확인하여 작성자가 확인을 누르면 등록이 완료되며 페이지가 넘어간다. 
// alert_submit()을 통해 hidden type인 태그안에 값에 등록버튼을 눌렀을때의 시간(=업로드시간)을 담아 넘겨준다. 
// 등록 취소버튼을 누르면 작성한 내용이 모두 사라진다. 
function alert_submit(){
	
	var n=new Date();
	var h=document.getElementById("uploadTime");
	h.value=n.toLocaleString();
	
	var res=confirm("게시글을 등록하시겠습니까?");
	if(res){
		alert("게시글이 등록되었습니다.");
	}else{
		return false;}
}


</script>
</body>
</html>