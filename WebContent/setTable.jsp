<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		var doc=document.form;
		if(doc.tab.value<0){
			alert("[테이블 갯수]\n양수로 입력해주세요.");
			doc.tab.focus();
		}else if(doc.tab.value==0){
			alert("[테이블 갯수]\n테이블 갯수를 입력해주세요.");
			doc.tab.focus();
		}else if(doc.tab.value<6){
			alert("[테이블 갯수]\n6이상을 입력해주세요.");
			doc.tab.focus();
		}else{
			doc.action="setTableProcess.jsp";
			doc.submit();
		}
	}
</script>
</head>
<body>

<%@ include file="header.jsp" %>

<section>
	<form name=form>
		<br><hr>
		<h2>테이블 설정</h2>
		<br>
		<table border=1>
		<%
			pstmt=null;
			rs=null;
			Integer tab=0;
			try{
				String sql="select count(no) from postable";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
					tab=rs.getInt(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
			<tr>
				<th>테이블 갯수</th>
				<td><input type=number name=tab value=<%=tab %>></td>
			</tr>
			<tr>
				<td colspan=2><input type=button value="수정 완료" onclick=check()>
				<input type=button value="수정 취소" onclick=back()>
				</td>
			</tr>
		</table>
	</form>
</section>

<%@ include file="nav.jsp" %>

</body>
</html>