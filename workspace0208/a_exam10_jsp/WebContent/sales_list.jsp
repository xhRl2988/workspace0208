<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db.jsp" %>
<%
	String sql="select a.custno custno, a.custname custname,"
			+ " decode(a.grade,'A','VIP','B','일반','C','직원') g ,sum(price) p "
			+ " from member_tbl_02 a, money_tbl_02 b "
			+ " where a.custno = b.custno "
			+ " group by a.custno, a.custname, a.grade "
			+ " order by p desc";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	ResultSet rs=pstmt.executeQuery();
	
			
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쇼핑몰 회원관리</title>
	<link rel="stylesheet" href="css/style.css">
	<script type="text/javascript">
		function CV() {
			var cv=document.data;
			
			if(!cv.custname.value){
				alert("회원성명을 입력하세요.")
				cv.custname.focus();
				return false;
			}
		}
	
	</script>
</head>
<body>
<header>
	<jsp:include page="layout/header.jsp"></jsp:include>
</header>
<nav>
	<jsp:include page="layout/nav.jsp"></jsp:include>
</nav>
	<main id="section">
		<form name="date" action="join_p.jsp" method="post" onsubmit="return CV()">
			<h2 class="title">쇼핑몰 회원관리 프로그램</h2>
			<table class="table_line">
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>고겍등급</th>
					<th>매출</th>
				</tr>
				<%while(rs.next()){ %>
				<tr align="center">
					<td><%=rs.getString("custno") %></td>
					<td><%=rs.getString("custname") %></td> 
					<td><%=rs.getString("g") %></td> 
					<td><%=rs.getString("p") %></td> 
				</tr>	
				<%} %>			
			</table>
		</form>
	</main>
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>