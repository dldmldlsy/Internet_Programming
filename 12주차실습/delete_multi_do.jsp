<%@ page contentType="text/html; charset=UTF-8"
    import="java.sql.*"%>
    
<%
request.setCharacterEncoding("utf-8");
String[] selected_idx=request.getParameterValues("selected_idx");
Class.forName("org.mariadb.jdbc.Driver");
String DB_URL="jdbc:mariadb://localhost:3306/mydb?useSSL=false";
Connection con=DriverManager.getConnection(DB_URL,"admin","1234");

con.setAutoCommit(false);
String sql="DELETE FROM member WHERE idx=?";

PreparedStatement pstmt;
//try안에다가 변수선언하면 pstmt.close에서 error발생 밖에다 해줘야 접근할 수 있어서 close가능. 

try{
	pstmt=con.prepareStatement(sql);
	for(int i=0;i<selected_idx.length;i++){
		pstmt.setInt(1,Integer.parseInt(selected_idx[i]));
		pstmt.addBatch();
		}
	 pstmt.executeBatch();
	 con.commit();
}catch(SQLException e){
	con.rollback();
	throw e;
}

con.setAutoCommit(true); //원상복구
//close해주기
pstmt.close();
con.close();
//response.sendRedirect("list.jsp");
//삭제하고 경고창띄우고 싶으면 이거 쓰면 안됨. 
//sendRedirect는 현재 출력버퍼에 있던 내용들을 무시하고 제어를 그냥 이동시킴. 
//삭제하고 저 아래 알림창을 띄울 수 없으므로 자바스크립트로 처리하기. 

%>
<script>
alert("선택한 레코드가 삭제되었습니다");
location.href="list.jsp";
</script>