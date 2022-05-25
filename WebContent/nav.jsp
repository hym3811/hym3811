<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function addmenu(){
		location.href="selectMenu.jsp";
	}
	
</script>
</head>
<body>

	<nav>
		<form>
			<table>
				<tr>
					<td><input type=button value="메뉴관리" onclick=addmenu()></td>
					<td><input type=button value="매출조회" onclick=select()></td>
					<td><input type=button value="계정삭제" onclick=deleteid()></td>
					<td><input type=button value="마감" onclick=end()></td>
				</tr>
			</table>
		</form>
	</nav>

</body>
</html>