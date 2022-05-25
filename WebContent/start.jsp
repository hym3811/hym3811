<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function move(){
		document.form.submit();
	}
</script>
</head>
<body>

<%@ include file="header.jsp" %>
<section>
	<form name=form action="login.jsp">
		<table>
			<tr>
				<td>
					<input type=button name=start value="개시" onclick=move()>
				</td>
			</tr>
		</table>
	</form>
</section>
<%@ include file="nav.jsp" %>
</body>
</html>