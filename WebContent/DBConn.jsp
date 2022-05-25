<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String date=null;
	String[] d=null;
	Integer today=null;

	request.setCharacterEncoding("utf-8");
	try{
		String url="jdbc:oracle:thin:@//localhost:1521/xe";
		String user="system";
		String pass="3811";
		String driver="oracle.jdbc.OracleDriver";
		Class.forName(driver);
		conn=DriverManager.getConnection(url,user,pass);
		System.out.println("To Connect Database Sucess");
		String sql="select sysdate from dual";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			date=rs.getString(1).substring(2, 10);
			d=date.split("-");
			today=Integer.parseInt(d[0]+d[1]+d[2]);
			System.out.println("today: "+today);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>