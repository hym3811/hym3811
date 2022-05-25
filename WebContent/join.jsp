<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<script>
		function manager(){
			var doc=document.form;
			var p1=doc.password.value;
			var p2=doc.passchk.value;
			if(doc.id.value==""){
				alert("[아이디]\n아이디를 입력하세요.");
				doc.id.focus();
			}else if(doc.id.value.length<4||doc.id.value.length>30){
				alert("[아이디]\n최소 4자에서 30자 미만으로 만드세요.");
				doc.id.focus();
			}else if(doc.password.value==""){
				alert("[비밀번호]\n비밀번호를 입력하세요.");
				doc.password.focus();
			}else if(doc.password.value.length<4||doc.id.value.length>30){
				alert("[비밀번호]\n최소 4자에서 30자 미만으로 만드세요.");
				doc.password.focus();
			}else if(doc.passchk.value==""){
				alert("[비밀번호 확인]\n비밀번호 확인을 입력하세요.");
				doc.passchk.focus();
			}else if(doc.passchk.value.length<4||doc.id.value.length>30){
				alert("[비밀번호 확인]\n최소 4자에서 30자 미만으로 만드세요.");
				doc.passchk.focus();
			}else if(doc.q1.value==""){
				alert("[Q1]\n답변을 입력하세요.");
				doc.q1.focus();
			}else if(doc.q1.value.length<2||doc.q1.value.length>30){
				alert("[Q1]\n최소 4자에서 30자 미만으로 만드세요.");
				doc.q1.focus();
			}else if(doc.q2.value==""){
				alert("[Q2]\n답변을 입력하세요.");
				doc.q2.focus();
			}else if(doc.q2.value.length<2||doc.q2.value.length>30){
				alert("[Q2]\n최소 4자에서 30자 미만으로 만드세요.");
				doc.q2.focus();
			}else if(doc.q3.value==""){
				alert("[Q3]\n답변을 입력하세요.");
				doc.q3.focus();
			}else if(doc.q3.value.length<2||doc.q3.value.length>30){
				alert("[Q3]\n최소 4자에서 30자 미만으로 만드세요.");
				doc.q3.focus();
			}else if(p1!=p2){
					alert("[비밀번호]\n일치하지 않습니다.");
					doc.passchk.focus();
			}else{
				document.form.action="joinProcess.jsp";
				doc.submit();
			}
		}
		function back(){
			location.href="login.jsp";
		}
	</script>

</head>
<body>

	<%@include file="header.jsp" %>
	<section>
		<form name=form>
			<table border=1>
				<tr>
					<th>아이디</th>
					<td><input type=text name=id></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type=password name=password></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type=password name=passchk></td>
				</tr>
				<tr>
					<th>Q1.당신의 고향은?</th>
					<td><input type=text name=q1></td>
				</tr>
				<tr>
					<th>Q2.당신이 태어난 년도는?</th>
					<td><input type=text name=q2></td>
				</tr>
				<tr>
					<th>Q3.당신의 이름은?</th>
					<td><input type=text name=q3></td>
				</tr>
				<tr>
					<td>
						<input type=button value="회원가입 완료" onclick=manager()>
						<input type=button value="초기화" onclick=reset();>
						<input type=button value="회원가입 취소" onclick=back();>
					</td>
				</tr>
			</table>
		</form>
	</section>

</body>
</html>