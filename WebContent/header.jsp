<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel=stylesheet href=style.css>
</head>
<body>

	<header>
		<%@ include file="DBConn.jsp" %>
		<%
			pstmt=null;
			rs=null;
			Date dd;
			try{
				String sql="select sysdate from dual";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
					dd=rs.getDate(1);
		%>
		<h1 align=center>김밥천국 양정점</h2>
		<h3 align=right> <pre><%=dd%>           </pre></h3>
		<%
					}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
		</header>

</body>
</html>