package myjsp;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmpDAO {
	
	//부서번호를 전달받아서 부서원목록을 리턴함
		public List<EmpTO> getEmpList(int deptId) throws Exception {
			//JDBC절차에 따라 데이터베이스접속하여 데이터를 조회함
			Class.forName("org.postgresql.Driver");
			List<EmpTO> result= new ArrayList<EmpTO>();
			String url = "jdbc:postgresql://localhost/hr";
			String user = "postgres";
			String password = "postgres";
			Connection conn = null;
			conn = DriverManager.getConnection(url, user, password);
			//전달받은 부서번호를 반영하여 쿼리문작성
			String sql="select * from employees where department_id="+ deptId;
			Statement stmt= conn.createStatement();
			ResultSet rs= stmt.executeQuery(sql);
			while(rs.next()) {
				EmpTO to= new EmpTO();
				int empId= rs.getInt("employee_id");
				to.empId= empId;
				to.lastName= rs.getString("last_name");
				//result에 담는다.
				result.add(to);
			}
			conn.close();
			return result;
		}
		
	public EmpTO getEmpDetail(int empId) throws Exception {
		EmpTO result = new EmpTO();
		Class.forName("org.postgresql.Driver");
		String url = "jdbc:postgresql://localhost/hr";
		String user = "postgres";
		String password = "postgres";
		Connection conn = null;
		conn = DriverManager.getConnection(url, user, password);
		String sql="select last_name, first_name, salary,"
				+ " to_char(hire_date, 'yyyy-mm-dd') as hire_date, department_name"
				+ " from employees join departments using(department_id)"
				+ " where employee_id="+ empId;
		Statement stmt= conn.createStatement();
		ResultSet rs= stmt.executeQuery(sql);
		while(rs.next()) {
			result.empId = empId;
			result.lastName = rs.getString("last_name");
			result.firstName = rs.getString("first_name");
			result.salary = rs.getInt("salary");
			result.hireDate = rs.getString("hire_date");
			result.deptName = rs.getString("department_name");
		}
		conn.close();
		return result;
	}

}
