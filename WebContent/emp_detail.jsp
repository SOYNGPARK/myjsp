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
	<!--1. Ŭ���̾�Ʈ�� ��û�� ����� �����Ѵ�
	2. ������ ������� �����͸� ��ȸ�Ѵ�
	3. ��ȸ����� ȭ�鿡 ����Ѵ�-->
	
	<%
	String empIdStr = request.getParameter("empId");
	int empId = Integer.parseInt(empIdStr);
	EmpDAO dao = new EmpDAO();
	EmpTO to = dao.getEmpDetail(empId);
	%>
	
	<div>���<%= empId %> ������ </div>
		<table class="main_table" border=1>
			<tr>
				<td>��</td>
				<td><%=to.lastName %></td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td><%= to.firstName %></td>
			</tr>
			<tr>
				<td>�μ���</td>
				<td><%= to.deptName %></td>
			</tr>
			<tr>
				<td>�Ի�����</td>
				<td><%= to.hireDate %></td>
			</tr>
			<tr>
				<td>�޿�</td>
				<td><%= to.salary %></td>
			</tr>
		</table>
</body>
</html>