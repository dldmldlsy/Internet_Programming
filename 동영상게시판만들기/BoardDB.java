package myBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

public class BoardDB {
	private Connection con; //연결자 객체 생성	
	private PreparedStatement pstmt; //preparedStatement 객체 생성
	private ResultSet rs; //resultset 객체 생성

	//1. 생성자 선언 : Connection 인스턴스가 생성되도록 한다.
	public BoardDB() throws SQLException, NamingException {
		con=DsCon.getConnection(); //컨넥션풀에서 연결자정보를 가져옴. 	
	}
	
	public void insertBoard(Board bd) throws SQLException {


		String sql = "INSERT INTO board(boardName, boardInfo) VALUES(?, ?)";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bd.getBoardName());
		pstmt.setString(2, bd.getBoardInfo());
	
		pstmt.executeUpdate();
	}
	
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}
}
