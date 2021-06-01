<%@ page contentType="text/html; charset=UTF-8" import="myBean.*, java.sql.*, javax.naming.*"%>
<%
request.setCharacterEncoding("utf-8");

String title=request.getParameter("videoTitle");
String id=request.getParameter("userId");
String pwd=request.getParameter("pwd");
String menu=request.getParameter("menu");
String descriptor =request.getParameter("videoDesc");
//나중에 빈즈로 바꿔보기 

VideoInfo video=new VideoInfo();
video.setVideoTitle(title);
video.setUserId(id);
video.setPwd(pwd);
video.setMenu(menu);
video.setVideoDesc(descriptor);


try{
//아티클디비 객체 생성. 
VideoInfoDB db=new VideoInfoDB(); //생성하자마자 연결자 정보가져옴. 
db.insertRecord(video); //이 art객체를 db에 추가
db.close(); //종료
}catch(NamingException e){
	out.print(e);
	return;
}catch(SQLException e){
	out.print(e);
	return;
}

//response.sendRedirect("video_detail.jsp");
%>
<script>
alert("동영상이 등록되었습니다.");
location.href="main.jsp";
</script>
