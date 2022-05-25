<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function menu(){
		location.href="addMenu.jsp";
	}
</script>
</head>
<body>

<%@ include file="header.jsp" %>

<section>
<br><hr>
	<h2>메뉴 관리</h2><br>
	<form name=form>
		<table border =1>
			<tr>
				<th>메뉴명</th>
				<th>가격</th>
				<th>관리</th>
			</tr>
			<%
				pstmt=null;
				rs=null;
				try{
					String sql="select * from posmenu";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					while(rs.next()){
						String name=rs.getString(1);
						Integer price=rs.getInt(2);
			%>
			
			<tr>
				<td><%=name %></td>
				<td><%=price %></td>
				<td><a href="updateMenu.jsp?name=<%=name %>">수정</a>/<a href="deleteMenu.jsp?name=<%=name %>">삭제</a></td>
			</tr>
			<%
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			%>
			<tr>
			<td colspan=3><input type=button value="메뉴추가" onclick=menu()></td>
			</tr>
		</table>
	</form>
</section>

<%@ include file="nav.jsp" %>

</body>
</html>