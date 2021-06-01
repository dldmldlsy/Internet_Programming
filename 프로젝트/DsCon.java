package myBean;
//데이터베이스연결을 위한 클래스
import javax.naming.*;
import java.sql.*;
import javax.sql.DataSource;

public class DsCon {
    /**
     * 1. Context로부터 커넥션 풀에 접근하여 Connection 을 가져온다.
     *    커넥션 풀의 URL은 java:/comp/env/jdbc/mydbTest 인 것으로 한다.
	 * @return Connection
	 * @throws SQLException, NamingException
	 */
	public static Connection getConnection() throws SQLException, NamingException{
		Context initContext=new InitialContext(); //initContext 객체 생성
		DataSource ds=(DataSource)initContext.lookup("java:/comp/env/jdbc/mydbTest");
		return ds.getConnection();
	}
}
