<%@ page contentType="text/html; charset=UTF-8" 
          import="myBean.*, java.sql.*, javax.naming.*, java.io.*"
          	import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"%>
<%
request.setCharacterEncoding("utf-8");

//upload 이름을 가지는 실제 서버의 경로명 알아내기 
ServletContext context = getServletContext();
String realFolder = context.getRealPath("upload");

int maxsize = 5*1024*1024; //최대파일크기지정을 위한 변수
try{
	
	//file도 다룰 수 있는 multipartrequest 객체 생성 (reqeust, upload실제파일명, 최대파일크기, 인코딩셋, defalutfilerenamepolicy객체)
MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, "utf-8",
		new DefaultFileRenamePolicy());

//getParmeter("파라미터명")을 통해 파라미터에 전송한 값 알아내서 저장 (문자열로 반환됨)
String movieIdx=multi.getParameter("movieIdx");
String movieTitle= multi.getParameter("movieTitle");
String userID= multi.getParameter("userID");
String boardMenu=multi.getParameter("boardMenu");
String pwd = multi.getParameter("pwd");
String uploadTime=multi.getParameter("uploadTime");
String movieInfo=multi.getParameter("movieInfo");

//type이 file인 건 getParameter가 아니라 getFilesystemName을 통해 서버에 저장된 파일이름을 알아낼 수 있다. 
String thumbFileName = multi.getFilesystemName("thumbFileName");
String movieFileName= multi.getFilesystemName("movieFileName");
//이렇게 알아낸 파일네임을 db에 저장해야함. 

//DB연결을 위해 인수로 들어갈 Movie객체를 만들고 
Movie mv=new Movie();
//값을 세팅한다. 
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
db.updateMovie(mv); //updateMovie메소드를 통해 mv객체에 담긴 값들로 정보가 변경된다. 
db.close(); 
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

response.sendRedirect("movie_list.jsp"); //수정 후 동영상 목록 출력하는 메인페이지로 이동. 
%>

