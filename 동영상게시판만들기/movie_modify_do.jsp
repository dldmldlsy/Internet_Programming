<%@ page contentType="text/html; charset=UTF-8" 
          import="myBean.*, java.sql.*, javax.naming.*, java.io.*"
          	import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"%>
<%
request.setCharacterEncoding("utf-8");

//1.upload 이름을 가지는 실제 서버의 경로명 알아내기 
ServletContext context = getServletContext();
String realFolder = context.getRealPath("upload");

int maxsize = 5*1024*1024;
try{
	
MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, "utf-8",
		new DefaultFileRenamePolicy());

//4. 사용자가 id, name, pwd 파라미터에 전송한 값 알아내기
String movieIdx=multi.getParameter("movieIdx");
String movieTitle= multi.getParameter("movieTitle");
String userID= multi.getParameter("userID");
String boardMenu=multi.getParameter("boardMenu");
String pwd = multi.getParameter("pwd");
String uploadTime=multi.getParameter("uploadTime");
String movieInfo=multi.getParameter("movieInfo");

//5. 서버에 저장된 파일이름 알아내기
String thumbFileName = multi.getFilesystemName("thumbFileName");
String movieFileName= multi.getFilesystemName("movieFileName");
//이렇게 알아낸 파일네임을 db에 저장해야함. 

//6. DB 연결자 생성(이곳에 빈즈나 Connection Pool로 대치 가능)
Movie mv=new Movie();
mv.setMovieIdx(Integer.parseInt(movieIdx));
mv.setMovieTitle(movieTitle); 
mv.setUserID(userID);
mv.setBoardMenu(boardMenu);
mv.setPwd(pwd);
mv.setThumbFileName(thumbFileName);
mv.setMovieFileName(movieFileName);
mv.setUploadTime(uploadTime);
mv.setMovieInfo(movieInfo);

MovieDB db=new MovieDB(); //생성하자마자 연결자 정보가져옴. 
db.updateMovie(mv); //이 art객체를 db에 추가
db.close(); //종료
}catch(IOException e){
	out.print(e);
	return;
}catch(NamingException e){
	out.print(e);
	return;
}catch(SQLException e){
	out.print(e);
	return;
}

response.sendRedirect("movie_list.jsp");
%>

