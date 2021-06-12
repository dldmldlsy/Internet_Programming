package myBean;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import myBean.*;


public class MovieDB { 
	private Connection con; //연결자 객체 생성	
	private PreparedStatement pstmt; //preparedStatement 객체 생성
	private ResultSet rs; //resultset 객체 생성

	//1. 생성자 선언 : Connection 인스턴스가 생성되도록 한다.
	public MovieDB() throws SQLException, NamingException {
		con=DsCon.getConnection(); //컨넥션풀에서 연결자정보를 가져옴. 	
	}
	
	public void insertMovie(Movie mv) throws SQLException {


		String sql = "INSERT INTO movie(movieTitle, userID, boardMenu, thumbFileName, movieFileName, pwd, uploadTime, movieInfo) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mv.getMovieTitle());
		pstmt.setString(2, mv.getUserID());
		pstmt.setString(3, mv.getBoardMenu());
		pstmt.setString(4, mv.getThumbFileName());
		pstmt.setString(5, mv.getMovieFileName());
		pstmt.setString(6, mv.getPwd());
		pstmt.setString(7, mv.getUploadTime());
		pstmt.setString(8, mv.getMovieInfo());
	
		pstmt.executeUpdate();
	}	
	//3. 지정된 idx에 해당하는 DB에 저장된 레코드를 반환하는 getRecord() 선언
	//   @param : int
	//	 @return : Article
	//	@throws : SQLException
	public Movie getMovie(int idx) throws SQLException {
		
		Movie mv=new Movie();
		String sql="SELECT * FROM movie WHERE movieIdx=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1,idx);
		rs=pstmt.executeQuery();
		
		rs.next();
		
		mv.setMovieIdx(rs.getInt("movieIdx"));
		mv.setMovieTitle(rs.getString("movieTitle"));
		mv.setUserID(rs.getString("userID"));
		mv.setBoardMenu(rs.getString("boardMenu"));
		mv.setThumbFileName(rs.getString("thumbFileName"));
		mv.setMovieFileName(rs.getString("movieFileName"));
		mv.setPwd(rs.getString("pwd"));
		mv.setUploadTime(rs.getString("uploadTime"));
		mv.setMovieInfo(rs.getString("movieInfo"));
		
		return mv;
	}
	
	public void updateMovie(Movie mv) throws SQLException {
	
		File up=new File("upload");
		String realFolder = up.getAbsolutePath();
		
		if(mv.getMovieFileName()!=null&&mv.getThumbFileName()!=null) { //썸네일이미지, 동영상파일 둘다 바꼈을 경우

			String sql="SELECT thumbFileName, movieFileName FROM movie WHERE movieIdx=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,mv.getMovieIdx());
			rs=pstmt.executeQuery();
			
			rs.next();
			String oldFileName_thumb=rs.getString("thumbFileName");
			File oldfile_thumb =new File(realFolder+"\\"+oldFileName_thumb);
			oldfile_thumb.delete();
			String oldFileName_movie=rs.getString("movieFileName");
			File oldfile_movie =new File(realFolder+"\\"+oldFileName_movie);
			oldfile_movie.delete();
	
		sql="UPDATE movie SET movieTitle=?, userID=?, boardMenu=?, thumbFileName=?, movieFileName=?, pwd=?, uploadTime=?, movieInfo=? WHERE movieIdx=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, mv.getMovieTitle());
		pstmt.setString(2, mv.getUserID());
		pstmt.setString(3, mv.getBoardMenu());
		pstmt.setString(4, mv.getThumbFileName());
		pstmt.setString(5, mv.getMovieFileName());
		pstmt.setString(6, mv.getPwd());
		pstmt.setString(7, mv.getUploadTime());
		pstmt.setString(8, mv.getMovieInfo());
		pstmt.setInt(9,mv.getMovieIdx());
		
		}else if(mv.getThumbFileName()!=null){ //썸네일이미지만 바꼈을 경우
			String sql="SELECT thumbFileName FROM movie WHERE movieIdx=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,mv.getMovieIdx());
			rs=pstmt.executeQuery();
			
			rs.next();
			String oldFileName_thumb=rs.getString("thumbFileName");
			File oldfile_thumb =new File(realFolder+"\\"+oldFileName_thumb);
			oldfile_thumb.delete();
			
			sql="UPDATE movie SET movieTitle=?, userID=?, boardMenu=?, thumbFileName=?, pwd=?, uploadTime=?, movieInfo=? WHERE movieIdx=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mv.getMovieTitle());
			pstmt.setString(2, mv.getUserID());
			pstmt.setString(3, mv.getBoardMenu());
			pstmt.setString(4, mv.getThumbFileName());
			pstmt.setString(5, mv.getPwd());
			pstmt.setString(6, mv.getUploadTime());
			pstmt.setString(7, mv.getMovieInfo());
			pstmt.setInt(8, mv.getMovieIdx());
			
		}else if(mv.getMovieFileName()!=null){
			String sql="SELECT movieFileName FROM movie WHERE movieIdx=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,mv.getMovieIdx());
			rs=pstmt.executeQuery();
			
			rs.next();
			String oldFileName_movie=rs.getString("movieFileName");
			File oldfile_movie =new File(realFolder+"\\"+oldFileName_movie);
			oldfile_movie.delete();
			
			sql="UPDATE movie SET movieTitle=?, userID=?, boardMenu=?, movieFileName=?, pwd=?, uploadTime=?, movieInfo=? WHERE movieIdx=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mv.getMovieTitle());
			pstmt.setString(2, mv.getUserID());
			pstmt.setString(3, mv.getBoardMenu());
			pstmt.setString(4, mv.getMovieFileName());
			pstmt.setString(5, mv.getPwd());
			pstmt.setString(6, mv.getUploadTime());
			pstmt.setString(7, mv.getMovieInfo());
			pstmt.setInt(8, mv.getMovieIdx());
			
		}else { // 둘다 바뀌지않았을경우
			String sql="UPDATE movie SET movieTitle=?, userID=?, boardMenu=?, pwd=?, uploadTime=?, movieInfo=? WHERE movieIdx=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mv.getMovieTitle());
			pstmt.setString(2, mv.getUserID());
			pstmt.setString(3, mv.getBoardMenu());
			pstmt.setString(4, mv.getPwd());
			pstmt.setString(5, mv.getUploadTime());
			pstmt.setString(6, mv.getMovieInfo());
			pstmt.setInt(7, mv.getMovieIdx());
		}
		pstmt.executeUpdate();
	
	}
	
	public void deleteMovie(int idx) throws SQLException {
		String sql ="SELECT thumbFileName, movieFileName FROM movie WHERE movieIdx=?" ;
		
		//5. PerparedStatement 객체 알아내기.
		pstmt = con.prepareStatement(sql);
		
		//6. PreparedStatement 객체의 쿼리 문자열 중 첫번째인  idx 값 설정하기
		pstmt.setInt(1,idx);
		
		//7. 쿼리 실행
		ResultSet rs = pstmt.executeQuery();
		
		//8. 레코드 커서 이동시키기
		rs.next();
		
		//9.fileName 필드의 값 알아내기
		String thumbFileName = rs.getString("thumbFileName");
		String movieFileName= rs.getString("movieFileName");
		//10. upload 이름을 가지는 실제 서버의 경로명 알아내기
		File up=new File("upload");
		String realFolder = up.getAbsolutePath();
		//11. 앞에서 알아낸 서버의 경로명과 파일명으로 파일 객체 생성하기
		File thumb_file = new File(realFolder+"\\"+thumbFileName);
		File movie_file = new File(realFolder+"\\"+movieFileName);

		//12. 파일 삭제
		thumb_file.delete();
		movie_file.delete();
		//13. member 테이블에서 지정한 idx의 레코드를 삭제하기 위한 쿼리 문자열 구성하기
		sql ="DELETE FROM movie WHERE movieIdx=?";
		
		//14. PreparedStatement 객체 알아내기
		pstmt = con.prepareStatement(sql);
		//15. PreparedStatement 객체의 쿼리 문자열 중 첫번째인  idx 값 설정하기
		pstmt.setInt(1,idx);
		
		//16. 쿼리 실행
		pstmt.executeUpdate();
	}

	//5. open된 모든 연결자 정보를 제거
	//   @param is'nt 
	//   @return void
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}
}
