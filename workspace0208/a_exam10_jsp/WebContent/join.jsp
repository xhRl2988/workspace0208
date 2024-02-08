<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db.jsp" %>
<%
	String sql="select max(custno)+1 from member_tbl_02";
	PraparedStatement pstmt=conn.prapareStatement(sql);
	ResultSet rs=pstmt.executeQuery();
	rs.next();
	int num=rs.getInt(1);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쇼핑몰 회원관리</title>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
	<jsp:include page="layout/header.jsp"></jsp:include>
</header>
<nav>
	<jsp:include page="layout/nav.jsp"></jsp:include>
</nav>
	<main id="section">
		<form name="data" action="join_p" method="post" onsubmit="return CV()">
			<h2 class="title">쇼핑몰 회원관리 프로그램</h2>
				<table class="table_line">
					<tr>
						<th>회원번호(자동생성)</th>
						<td><input type="text" name	="custno" value="<%=num %>" readonly></td>
					</tr>
					<tr>
						<th>회원성명</th>
						<td><input type="text" name	="custname" autofocus></td>
					</tr>
					<tr>
						<th>회원전화</th>
						<td><input type="text" name	="phone"></td>
					</tr>
					<tr>
						<th>회원주소</th>
						<td><input type="text" name	="address"></td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td><input type="date" name	="joindate"></td>
					</tr>
					<tr>
						<th>고객등급</th>
						<td>
							<select
						</td>
					</tr>
					
				</table>
		</form>
	</main>
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>