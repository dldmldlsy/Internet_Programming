<%@ page contentType="text/html; charset=UTF-8" 
          import="myBean.*, java.sql.*, javax.naming.*, java.io.*"
          	import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"%>
<%
request.setCharacterEncoding("utf-8"); //인코딩셋

//upload 이름을 가지는 실제 서버의 경로명 알아내기 
ServletContext context = getServletContext();
String realFolder = context.getRealPath("upload");

//최대 전송 파일 크기 5Mbytes로 정의
int maxsize = 5*1024*1024;

try{ //예외처리를 위해 trycatch문 작성
	
//MultipartRequest 객체 생성.
MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, "utf-8",
		new DefaultFileRenamePolicy());

//사용자가 파라미터에 전송한 값 알아내기
String movieTitle= multi.getParameter("movieTitle");
String userID= multi.getParameter("userID");
String boardMenu=multi.getParameter("boardMenu");
String pwd = multi.getParameter("pwd");
String uploadTime=multi.getParameter("uploadTime");
String movieInfo=multi.getParameter("movieInfo");

//getFilesystemName메소드를 통해 서버에 저장된 파일이름 이름을 알아냄. 
String thumbFileName = multi.getFilesystemName("thumbFileName");
String movieFileName= multi.getFilesystemName("movieFileName");
//이렇게 알아낸 파일네임을 db에 저장해야 함. 


Movie mv=new Movie(); //위 정보를 담을 Movie 객체 mv생성. 
mv.setMovieTitle(movieTitle);  //setter 메소드를 통해 전송받은 값을 각 멤버필드에 저장한다. 
mv.setUserID(userID);
mv.setBoardMenu(boardMenu);
mv.setThumbFileName(thumbFileName);
mv.setMovieFileName(movieFileName);
mv.setPwd(pwd);
mv.setUploadTime(uploadTime);
mv.setMovieInfo(movieInfo);

MovieDB db=new MovieDB(); //DB에 레코드를 하나 추가할 것이므로 MovieDB가져옴 (생성하자마자 연결자가져옴)
db.insertMovie(mv); //Movie 객체 mv를 테이블에 삽입하는 insertMovie메소드호출.
db.close(); //관련 객체들 close시키는 close메소드 호출
}catch(IOException e){ //예외처리
	out.print(e);
	return;
}catch(NamingException e){
	out.print(e);
	return;
}catch(SQLException e){
	out.print(e);
	return;
}

response.sendRedirect("movie_list.jsp"); //response객체의 sendRedirect()를 통해 목록출력페이지인 movie_list.jsp로 이동. 
%>