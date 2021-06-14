<%@ page contentType="text/html; charset=UTF-8" import="myBean.*, java.sql.*"%>
<%
request.setCharacterEncoding("utf-8"); //인코딩셋

String idx=request.getParameter("idx"); //넘겨받은 idx파라미터값 알아내기

Movie mv=new Movie(); //Movie 객체 mv 생성
MovieDB db=new MovieDB(); //MovieDB객체 db생성
mv=db.getMovie(Integer.parseInt(idx)); //알아낸 idx값의 문자열을 int형으로 바꿔서 인수로 넣어 getMovie함수호출. 
                                         // 이 메소드에서는 해당 idx의 레코드를 검색해 Movie객체로 반환한다.  
%>


<!DOCTYPE html>
<html>
<head><title>동영상 상세 출력 페이지</title>
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


.third{
    float: right;
    width:20%;
    box-sizing: border-box;
}
.content{position: absolute; top: 150px; right: 100px;}
.v{ top: 300px; right: 100px;}
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

<%--video태그를 통해 video를 화면에 출력하고 재생할 수 있도록 한다. 이때 비디오 src에는 상대경로명이 들어간다.  --%>
<video src="./upload/<%=mv.getMovieFileName()%>" class="v" controls width="450" height="500"></video>
<div class="content">
<%--동영상 상세정보를 출력하고 버튼을 통해 수정 상제기능페이지로 이동한다. 이동시 get방식으로 해당 레코드의 primarykey인 movieIdx를 넘겨준다. --%>
<fieldset style="width: 350px">
<legend>동영상 정보</legend>
<div style="font-size:15px"><strong>동영상제목</strong> &nbsp;&nbsp;<%=mv.getMovieTitle()%><br>
<strong>작성자ID &nbsp;&nbsp;</strong> &nbsp;&nbsp;<%=mv.getUserID()%><br>
<strong>게시판이름</strong> &nbsp;&nbsp;<%=mv.getBoardMenu()%><br>
<strong>업로드일시</strong>&nbsp;&nbsp;<%=mv.getUploadTime()%><br>
<strong>동영상설명</strong><br>
<textarea style="background-color:transparent"cols="40" rows="10" disabled><%=mv.getMovieInfo()%></textarea><br>
</div>
<input type="button" value="수	정" onclick="location.href='movie_modify.jsp?idx=<%=mv.getMovieIdx()%>'">
<input type="button" value="삭	제" onclick="alert_delete()">
</fieldset>
</div>
</body>
<script>
//삭제버튼을 누르면 삭제여부를 재확인하는 confirm창을 띄우고 확인하면 게시글을 삭제한다. 
function alert_delete(){

		var res=confirm("게시글을 삭제하시겠습니까?");
		if(res==true){
			alert("게시글이 삭제되었습니다.");
			location.href="movie_delete_do.jsp?idx=<%=mv.getMovieIdx()%>";
		}else{
			return false;
		}

}
</script>
</html>
<%
 db.close();
 %>