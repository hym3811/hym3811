<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConn.jsp" %>
<%@ page import="java.util.*" %>
<%
	pstmt=null;
	Integer tab=Integer.parseInt(request.getParameter("tab"));
	System.out.println("tab: "+tab);
	try{
		String sql="drop table postable";
		pstmt=conn.prepareStatement(sql);
		pstmt.executeUpdate();
		System.out.println("postable 삭제 완료");
		
		sql="create table postable(no number(3) primary key, tab number(3) not null)";
		pstmt=conn.prepareStatement(sql);
		pstmt.executeUpdate();
		System.out.println("postable 재생성 완료");
		
		for(int i=1;i<=tab;i++){
			sql="insert into postable values("+i+","+i+")";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			System.out.println(i+"번째 row 생성 완료");
		}
		
		String[] name=new String[tab];
		Integer[] price=new Integer[tab];
		sql="select * from posmenu";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		int j=0;
		while(rs.next()){
			name[j]=rs.getString(1);
			price[j]=rs.getInt(2);
			j++;
		}
		System.out.println(Arrays.toString(name));
		System.out.println(Arrays.toString(price));
		for(int i=1;i<=tab;i++){
			sql="select table_name from user_tables where table_name='TAB"+i+"'";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				sql="drop table tab"+i+"";
				pstmt=conn.prepareStatement(sql);
				pstmt.executeUpdate();
			}
			sql="create table tab"+i+"(name varchar2(50) primary key, price number(10) not null, ea number(3) default 0)";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
		}
		Integer menu=0;
		sql="select count(name) from posmenu";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			menu=rs.getInt(1);
		}

		for(int i=1;i<=tab;i++){
			for(int k=0;k<menu;k++){
				sql="insert into tab"+i+" values('"+name[k]+"',"+price[k]+",0)";
				pstmt=conn.prepareStatement(sql);
				pstmt.executeUpdate();
				System.out.println(name[k]+","+price[k]+"삽입 완료");
			}
			System.out.println(i+"번 테이블 생성 완료");
		}
		
%>
	<script>
		alert("테이블 개수 수정 완료");
		location.href="index.jsp";
	</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>