<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConn.jsp"%>
<%
	pstmt=null;
	String name=request.getParameter("name");
	try{
		String sql="delete from posmenu where name=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.executeUpdate();
		
		sql="select tab from postable where no=1";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		Integer tab=0;
		if(rs.next()){
			tab=rs.getInt(1);
		}
		for(int i=1;i<=tab;i++){
			sql="delete from tab"+i+" where name='"+name+"'";
			System.out.println(i+"번 테이블 메뉴("+name+") 삭제 완료");
		}
%>
	<script>
		alert("삭제 성공");
		location.href="selectMenu.jsp";
	</script>
<%	
	}catch(Exception e){
		e.printStackTrace();
%>
	<script>
		alert("삭제 실패");
		location.href="selectMenu.jsp";
	</script>
<%
	}
%>
