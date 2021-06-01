package myBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import myBean.DsCon;
import myBean.VideoInfo;

public class VideoInfoDB {
	
	private Connection con;	//연결자 객체 생성
	private PreparedStatement pstmt; //쿼리
	private ResultSet rs;

	//1. 생성자 선언 : Connection 인스턴스가 생성되도록 한다.
	public VideoInfoDB() throws SQLException, NamingException {
		con=DsCon.getConnection(); //컨넥션풀에서 연결자정보를 가져옴. 	
	}
	

	public void insertRecord(VideoInfo video) throws SQLException {
		String sql = "INSERT INTO videolist(videoTitle, userId, pwd, menu, videoDesc) VALUES(?, ?, ?, ?, ?)";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, video.getVideoTitle());
		pstmt.setString(2, video.getUserId());
		pstmt.setString(3, video.getPwd());
		pstmt.setString(4,  video.getMenu());
		pstmt.setString(5, video.getVideoDesc());
		
	
		pstmt.executeUpdate();
	}	
	
	public VideoInfo getRecord(int idx) throws SQLException {
		VideoInfo video=new VideoInfo();
		String sql="SELECT videoTitle, userId, pwd, menu, videoDesc FROM videolist WHERE idx=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1,idx);
		rs=pstmt.executeQuery();
		
		rs.next();
		video.setVideoTitle(rs.getString("videoTitle"));
		video.setUserId(rs.getString("userId"));
		video.setPwd(rs.getString("pwd"));
		video.setMenu(rs.getString("menu"));
		video.setVideoDesc(rs.getString("videoDesc"));
		
		return video;
	}

	
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}
}
