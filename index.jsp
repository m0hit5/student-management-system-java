<%@page import="java.sql.* "%>

<html>
<head>
	<title>SMS</title>
	<style>
		*{ font-size:40px; }
		.nav {background-color:black;}
		.nav a {color:white; text-decoration:none; margin:5%;}
	</style>
</head>
<body>
	<center>
	<h1>Home Page</h1>
	<table border="3" style="width:50%;">
<tr>
					<th>Roll NO.</th>
					<th>Name</th>
					<th>Maths</th>
					<th>Science</th>
					<th>Social</th>
				</tr>
			<%
				try
				{
					DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver()); 
					String url = "jdbc:mysql://localhost:3306/kc_5jan23";
					Connection con = DriverManager.getConnection(url,"root","1234");
					String sql = "select * from student";
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					while(rs.next())
					{
						int rno = rs.getInt(1);
						String name = rs.getString(2);
						int maths = rs.getInt(3);
						int science = rs.getInt(4);
						int social = rs.getInt(5);
			%>
						<tr style="text-align:center;">
							<td><%=rno%></td>
							<td><%=name%></td>
							<td><%=maths%></td>
							<td><%=science%></td>
							<td><%=social%></td>
						</tr>
	<% 
	}
	}
	catch(SQLException er)
	{
		out.println("Issue " + er);
	}
	%>
	</table>
	<br/>
	<a href="./admin.jsp"> Admin Login </a>
	<br/>
	<a href="./login.jsp"> Teacher Login </a>


	</center>
</body>
</html>
