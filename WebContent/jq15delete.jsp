<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<%
request.setCharacterEncoding("utf-8");
String dcode = request.getParameter("dcode");



Connection conn = null;
PreparedStatement pstmt = null;


try{	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
	String sql = "delete from sangdata where code=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, dcode);

	int re = pstmt.executeUpdate();
	if(re == 1){
		out.print("t");
	}else{
		out.print("f");
	}
	
}catch(Exception e2){
	System.out.println("에러:" + e2);
}finally{
	pstmt.close();
	conn.close();
}
%>
