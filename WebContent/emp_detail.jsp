<%@page import="myjsp.EmpTO"%>
<%@page import="myjsp.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style type="text/css">
div {
	font-weight: bold;
	font-size: 25px;
}

table {
	border: red 1;
	text-align: center;
	width: 90%;
	font-weight: bold;
	background-color: cyan;
}

tr:nth-child(even) {
	background: lime;
}

tr:hover {
	background: grey;
}

select {
	height: 25px
}
</style>
<body>
	<!--1. 클라이언트가 요청한 사번을 추출한다
	2. 추출한 사번으로 데이터를 조회한다
	3. 조회결과를 화면에 출력한다-->
	
	<%
	String empIdStr = request.getParameter("empId");
	int empId = Integer.parseInt(empIdStr);
	EmpDAO dao = new EmpDAO();
	EmpTO to = dao.getEmpDetail(empId);
	%>
	
	<div>사번<%= empId %> 상세정보 </div>
		<table class="main_table" border=1>
			<tr>
				<td>성</td>
				<td><%=to.lastName %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%= to.firstName %></td>
			</tr>
			<tr>
				<td>부서명</td>
				<td><%= to.deptName %></td>
			</tr>
			<tr>
				<td>입사일자</td>
				<td><%= to.hireDate %></td>
			</tr>
			<tr>
				<td>급여</td>
				<td><%= to.salary %></td>
			</tr>
		</table>
</body>
</html>