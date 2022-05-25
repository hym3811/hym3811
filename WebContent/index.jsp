<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<script>
			function gotab(){
				locatin.href="tab.jsp?tab="+i+"";
			}
	</script>

</head>
<body>

<%@ include file="header.jsp" %>
<section>
<form name=form><br><hr>
<h2>메인화면</h2>
	<table>
		<tr>
			<%
				pstmt=null;rs=null;
				int tab=0;
				try{
					String sql="select tab from postable";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					while(rs.next()){
						tab=rs.getInt(1);
					if(tab%3==1&&tab>3){
			%>
		<tr>
			<%
					}
			%>
			<td><input type=number name=tab<%=tab %> value="<%=tab %>" readonly style="width:20px;"><input type=button value="번 테이블" onclick='location.href="tab.jsp?tab=<%=tab %>"' style="margin-right:30px;"></td>
			<%
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			%>
		</tr>
	</table>
</form>
</section>
<%@ include file="nav.jsp" %>

</body>
</html>