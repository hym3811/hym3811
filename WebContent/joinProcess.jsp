<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConn.jsp" %>
<%
	pstmt=null;

	String id=request.getParameter("id");
	String password=request.getParameter("password");
	String q1=request.getParameter("q1");
	String q2=request.getParameter("q2");
	String q3=request.getParameter("q3");
	System.out.println(id+","+password+","+q1+","+q2+","+q3);

	try{
		String sql="select *from posmanager where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		if(rs.next()){
%>
	<script>
		alert("중복된 아이디입니다.");
		location.href="join.jsp";
	</script>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
	try{
		String sql="insert into posmanager values(?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.setString(3, q1);
		pstmt.setString(4, q2);
		pstmt.setString(5, q3);
		pstmt.executeUpdate();
%>
	<script>
		alert("회원가입 성공");
		location.href="login.jsp";
	</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>