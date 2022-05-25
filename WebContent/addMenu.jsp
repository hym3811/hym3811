<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function menu(){
		var doc=document.form;
		if(doc.name.value==""){
			alert("[아이디]\n아이디를 입력하세요.");
			doc.name.focus();
		}else if(doc.name.value.length<1||doc.name.value.length>50){
			alert("[아이디]\n1자~50자 범위내 입력");
			doc.name.focus();
		}else if(doc.price.value==0||doc.price.value==null){
			alert("[가격]\n가격을 입력하세요.");
			doc.price.focus();
		}else if(doc.price.value.length>10){
			alert("[가격]\n가격은 숫자 10자리를 넘으면 안됩니다.");
			doc.price.focus();
		}else{
			doc.action="addMenuProcess.jsp";
			doc.submit();
		}
	}
	function back(){
		location.href="selectMenu.jsp";
	}
</script>
</head>
<body>

<%@ include file="header.jsp" %>
<section>
	<br><hr><br>
	<h2>메뉴 추가</h2>
	<br>
	<form name=form>
		<table border=1>
			<tr>
				<th>메뉴명</th>
				<td><input type="text" name=name></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="number" name=price></td>
			</tr>
			<tr>
				<td colspan=2><input type=button value="메뉴등록" onclick=menu()>
				<input type=button value="입력취소" onclick=back()></td>
			</tr>
		</table>
	</form>
</section>
<%@include file="nav.jsp" %>
</body>
</html>