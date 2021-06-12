<%@ page contentType="text/html; charset=UTF-8" 
          import="myBean.*, java.sql.*, javax.naming.*, java.io.*"
          	import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"%>
<%
request.setCharacterEncoding("utf-8");

//1.upload 이름을 가지는 실제 서버의 경로명 알아내기 
ServletContext context = getServletContext();
String realFolder = context.getRealPath("upload");

//2. 최대 전송 파일 크기 5Mbytes로 정의
int maxsize = 5*1024*1024;
try{
// MultipartRequest 객체 생성.
MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, "utf-8",
		new DefaultFileRenamePolicy());

//4. 사용자가 id, name, pwd 파라미터에 전송한 값 알아내기
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
mv.setMovieTitle(movieTitle); //mybean의 어떤 setStno불러야하는지 모르면 어카징 (지금은 뭘불러도 리턴값이 같겠지만.)
mv.setUserID(userID);
mv.setBoardMenu(boardMenu);
mv.setThumbFileName(thumbFileName);
mv.setMovieFileName(movieFileName);
mv.setPwd(pwd);
mv.setUploadTime(uploadTime);
mv.setMovieInfo(movieInfo);

MovieDB db=new MovieDB(); //생성하자마자 연결자 정보가져옴. 
db.insertMovie(mv); //이 art객체를 db에 추가
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