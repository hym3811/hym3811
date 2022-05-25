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
		location.href="tab.jsp?tab="+document.tab.value+"";
	}
</script>
</head>
<body>

	<%@ include file="header.jsp" %>
	<%@ page import="java.util.Arrays" %>
	<% 
		String t = request.getParameter("tab");
		int tab=0;
		if(t!=null){
			tab=Integer.parseInt(t);
		}
		int menu=0;
		try{
			String sql="select count(name) from tab"+tab+"";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				menu=rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	
	<section>
	<br>
	<hr>
	<br>
		<h2><input type=number name=tab value="<%=tab%>" readonly style="font-size:1.5em;width:50px;">번 테이블</h2>
		<form name=form>
			<table border=1>
				<tr>
					<th>메뉴명</th>
					<th>가격</th>
					<th>수량</th>
					<th>총액</th>
				</tr>
			<%
				pstmt=null;
				rs=null;
				
				menu=0;
				
				Integer total=0;
				Integer end=0;
				
				try{
					String sql="select count(name) from tab"+tab+"";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					if(rs.next()){
						menu=rs.getInt(1);
					}
					String[] name=new String[menu];
					Integer[] price=new Integer[menu];
					Integer[] ea=new Integer[menu];
					
					String[] n = new String[menu];
					Integer[] e = new Integer[menu];
					for(int i=0;i<menu;i++){
						n[i]=request.getParameter(name[i]);
						e[i]=Integer.parseInt(request.getParameterValues(ea[i]));
					}
					
					sql="select * from tab"+tab+"";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					int j=-1;
					while(rs.next()){
						j++;
						name[j]=rs.getString(1);
						price[j]=rs.getInt(2);
						ea[j]=rs.getInt(3);
			%>
				<tr>
					<td><input type=text name=name<%=j %> value=<%=name[j] %> readonly></td>
					<td><input type=number name=price<%=j %> value=<%=price[j] %> readonly></td>
					<td><input type=number name=ea<%=j %> value="<%=ea[j]==0 ? "" : ea[j] %>" onchange=check()></td>
					<td><input type=number name=total value="<%=ea[j]*price[j]==0 ? "" : ea[j]*price[j] %>" readonly></td>
				</tr>
			<%
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				System.out.println("tab: "+tab);
			%>
				<tr>
					<th colspan=2>주문총액</th>
					<td colspan=2><%=end==0 ? "" : end %></td>
				</tr>
				<tr>
					<td colspan=4>
					<input type=button value="입력 완료">
					<input type=button value="계산">
					<input type=button value="전체 취소" onclick=reset()>
					<input type=button value="입력 취소">
					</td>
				</tr>
			</table>
		</form>
	</section>
	
	<%@ include file="nav.jsp" %>

</body>
</html>