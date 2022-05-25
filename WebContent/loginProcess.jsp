<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConn.jsp" %>
<%
	pstmt=null;
	rs=null;
	
	String id=request.getParameter("id");
	String password=request.getParameter("pass");
	System.out.println(id+","+password);
	
	try{
		String sql="select password from posmanager where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		System.out.println("today: "+today);
		if(rs.next()){
			if(password.equals(rs.getString(1))){
				sql="select table_name from user_tables where table_name ='POS"+today+"'";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
%>
	<script>
		alert("로그인 성공\n오늘자 테이블이 이미 생성되어있습니다.");
		location.href="index.jsp";
	</script>
<%
				}else{
				System.out.println("비밀번호 일치");
				sql="create table pos"+today+"(orderno number(3) primary key, category varchar2(10) not null, sales number(10) not null)";
				pstmt=conn.prepareStatement(sql);
				pstmt.executeUpdate();
				System.out.println(today+"데이터베이스 생성 성공");
%>
	<script>
		alert("로그인 성공\n테이블 생성 성공");
		location.href="index.jsp";
	</script>
<%
				}
			}else{
				System.out.println("비밀번호 틀림");
%>
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		location.href="login.jsp";
	</script>
<%
			}
		}else{
%>
	<script>
		alert("아이디가 없습니다.");
		location.href="login.jsp";
	</script>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>