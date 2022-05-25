<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConn.jsp" %>
<%
	pstmt=null;
	rs=null;
	String name=request.getParameter("name");
	Integer price=Integer.parseInt(request.getParameter("price"));
	try{
		String sql="insert into posmenu values(?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, price);
		pstmt.executeUpdate();

		sql="select count(no) from postable";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		Integer table=0;
		if(rs.next()){
			table=rs.getInt(1);
		}
		for(int i=1;i<=table;i++){
			sql="insert into tab"+i+" values('"+name+"',"+price+",0)";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			System.out.println(i+"번 테이블 메뉴("+name+") 추가 완료");
		}
%>
	<script>alert("메뉴 등록 성공");
	location.href="addMenu.jsp";
	</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>