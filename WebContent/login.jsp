<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function login(){
		document.form.action="loginProcess.jsp";
		document.form.submit();
	}
	function join(){
		location.href="join.jsp";
	}
</script>
</head>
<body>

	<%@ include file="header.jsp" %>
	<section>
		<form name=form>
			<table>
				<tr>
					<th>아이디</th>
					<td><input type=text name=id></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type=password name=pass></td>
				</tr>
				<tr>
					<td colspan=2>
						<input type=button value="로그인" onclick=login()>
						<input type=button value="입력취소" onclick=reset()>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td><input type=button value="회원가입" onclick=join()></td>
				</tr>
			</table>
		</form>
	</section>
	

</body>
</html>