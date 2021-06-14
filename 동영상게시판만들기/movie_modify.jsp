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
<head><title>동영상 수정 페이지</title>
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

<%--폼태그를 통해 post방식으로 파라미터를통해 수정사항의 값이 전달된다. file타입도 있기때문에 entype="multipart/form-data"라고 써준다.--%>
<form method="POST" action="movie_modify_do.jsp" enctype="multipart/form-data" >
<fieldset style="width:450px"><legend style="font:18px"><strong>동영상 수정</strong>   <sub>  수정사항을 입력해주세요.</sub></legend>
<table>
<tr> 
  <td colspan="2" id="time" style="font-size:9px"></td>
</tr>
<tr>
<td class="nm">동영상번호</td><td><input type="text" id="movieIdx" name="movieIdx" readOnly value="<%=mv.getMovieIdx()%>"> </td></tr>
<tr>
	<td class="nm">동영상제목</td>
	<td><input type="text" id="movieTitle" name="movieTitle" value="<%=mv.getMovieTitle()%>"></td>
</tr>
<tr>
	<td class="nm">작성자ID</td>
	<td><input type="text" id="userID" name="userID" value="<%=mv.getUserID()%>"></td>
</tr>
<tr>
	<td class="nm">썸네일 이미지 업로드</td>
	<td><input type="file" name="thumbFileName"></td>
</tr>
<tr>
<%--이렇게 기존의 썸네일 이미지와 동영상파일도 보여준다. --%>
<td class="nm" colspan="2"> 기존 썸네일 이미지 &nbsp; <%=mv.getThumbFileName()%></td></tr>
<tr><td colspan="2"><img src="./upload/<%=mv.getThumbFileName()%>" width="200" height="200"></td>
</tr>
<tr>
	<td class="nm" colspan="2">동영상 업로드 <input type="file" name="movieFileName"></td>
</tr>
<tr>
<td class ="nm" colspan="2">기존 동영상파일 &nbsp;<%=mv.getMovieFileName()%></td></tr>
<tr><td colspan="2"><video src="./upload/<%=mv.getMovieFileName()%>" controls width="250" height="250"></video> </td></tr>

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
	<td><textarea cols="30" id="movieInfo" rows="10" name="movieInfo" style="white-space: pre"><%=mv.getMovieInfo()%>></textarea></td>
</tr>
<tr>
<td colspan="2">
<input type="hidden" name="uploadTime" id= "uploadTime" value="">
</td>
</tr>
<tr>
<td></td>
	<td colspan="2">
		<input type="submit" value="수정 완료" onclick="alert_modify()">
		<input type="reset" value="수정 취소">
	</td>
	<td>
	</td>
</tr>
</table>
</fieldset>
</form>
<script>
<%--수정 완료버튼을 누르면 수정여부를 묻는 알림창을 통해 수정여부를 재확인한 후 수정을 결정한다. 
수정 취소버튼을 누르면 수정사항이 초기화되고 수정을 하게 되며 수정이 되었다는 알림창이 띄워진다.  --%>
function alert_modify(){
var res=confirm("게시글을 수정하시겠습니까?");
if(res){
	alert("게시글이 수정되었습니다.");
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