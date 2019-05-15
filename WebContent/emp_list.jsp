<%@page import="myjsp.EmpTO"%>
<%@page import="java.util.List"%>
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
	<!-- ���⼭ ������ �ڵ��ؾ��ϳ�. ��� �۾��� �ؾ��ϴ����� ������ �� �־��.
	1. Ŭ���̾�Ʈ(web browser)���� ��û�� �μ���ȣ�� �����Ѵ�.
	=> request.getParameter()
	2. DB���� �μ����� ������ ������ �´�.
	=> EmpDAO��� Ŭ������ �̿��Ѵ�.
	3. ��ȸ�� �μ����� ������ ȭ�鿡 ����Ѵ�.
	=> ������ ������ for loop�� ǥ���Ѵ�. -->
	
	<% //�ڹٹ����� ����Ǵ� �����̴�
		String deptIdStr = request.getParameter("deptId");
		//EmpDAO
		EmpDAO dao = new EmpDAO();
		int deptId = Integer.parseInt(deptIdStr);
		List<EmpTO> list = dao.getEmpList(deptId);
	%>
	<div>��û�Ͻ� �μ���ȣ�� <%= deptIdStr %> �Դϴ�.</div>
	<% 
		for(EmpTO emp: list) {
	%>	
		<table class="main_table" border=1>
			<tr>
				<td>id</td>
				<td><a href="emp_detail.jsp?empId=<%= emp.empId%>"><%= emp.empId%></a><br></td>
			</tr>
		</table>
   <%} %>
	
	<!-- �� jsp������ ������������� �Ѵ�.
	�� �����̶�� ǥ���ϳ�?
	�ϳ��� �������� ���� ��û�� �����Ѵ�. ��û�� ���� �������� ������ �޶�����.
	
	client(chrome) -> web server(tomcat)
	client���� server��
	1) ���ΰ�ħ
	2) submit ��ư Ŭ��
	3) ajax ���
	4) A tag link
	5) �ּ�â�� url �Է� -->
</body>
</html>










