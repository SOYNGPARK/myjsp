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
	<!-- 여기서 무엇을 코딩해야하나. 어떠한 작업을 해야하는지를 제시할 수 있어야.
	1. 클라이언트(web browser)에서 요청한 부서번호를 추출한다.
	=> request.getParameter()
	2. DB에서 부서원의 정보를 쿼리해 온다.
	=> EmpDAO라는 클래스를 이용한다.
	3. 조회한 부서원의 정보를 화면에 출력한다.
	=> 페이지 내에서 for loop로 표현한다. -->
	
	<% //자바문법이 적용되는 구간이다
		String deptIdStr = request.getParameter("deptId");
		//EmpDAO
		EmpDAO dao = new EmpDAO();
		int deptId = Integer.parseInt(deptIdStr);
		List<EmpTO> list = dao.getEmpList(deptId);
	%>
	<div>요청하신 부서번호는 <%= deptIdStr %> 입니다.</div>
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
	
	<!-- 이 jsp파일을 동적페이지라고 한다.
	왜 동적이라고 표현하냐?
	하나의 페이지로 여러 요청을 대응한다. 요청에 따라 페이지의 대응이 달라진다.
	
	client(chrome) -> web server(tomcat)
	client에서 server로
	1) 새로고침
	2) submit 버튼 클릭
	3) ajax 통신
	4) A tag link
	5) 주소창에 url 입력 -->
</body>
</html>










