<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConn.jsp" %>
<%
	pstmt=null;
	String name=request.getParameter("name");
	Integer price=Integer.parseInt(request.getParameter("price"));
	System.out.println(name+","+price);
	try{
		String sql="update posmenu set price=? where name=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, price);
		pstmt.setString(2, name);
		pstmt.executeUpdate();
%>
	<script>alert("메뉴 수정 성공");
	location.href="menu.jsp";
	</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>