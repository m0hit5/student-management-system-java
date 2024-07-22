<%@page import="java.sql.*" %>

<%
	if (session.getAttribute("user") != null)
	{
		response.setHeader("Cache-Control", "no-cache, no-store");
		String user = (String)session.getAttribute("user");
		out.println("Welcome " +user);
	}
	else
	{
		response.sendRedirect("index.jsp");
	}
%>


<%
	if(request.getParameter("r")!=null)
	{
		int rno = Integer.parseInt(request.getParameter("r"));
		try
		{
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver()); 
			String url = "jdbc:mysql://localhost:3306/kc_5jan23";
			Connection con = DriverManager.getConnection(url,"root","1234");
			String sql = "delete from student where rno=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1,rno);
			pst.executeUpdate();
			con.close();
		}
		catch(SQLException ea)
		{
			out.println("Issue "+ea);
		}
	}
%>

<html>
	<head>
		<title>SMS App</title>
		<link rel="icon" href="img.ico"/>
	<style>
		*{ font-size:40px; }
		.nav {background-color:black;}
		.nav a {color:white; text-decoration:none; margin:5%;}
	</style>
	</head>
	<body>
		<center>
			<div class="nav">
				<a href="update.jsp">Update</a>
				<a href="create.jsp">Create</a>
			</div>
			<h1>Home Page</h1>
			<table border="3" style="width:70%;">
				<tr>
					<th>Roll NO.</th>
					<th>Name</th>
					<th>Maths</th>
					<th>Science</th>
					<th>Social</th>
					<th>Delete</th>
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
							<td><a href="?r=<%=rno %>"onclick="return confirm('Are you sure?')">Delete</a></td>
						</tr>
			<%
					}
					con.close();
				}
				catch(SQLException ea)
				{
					out.println("Issue "+ea);
				}
			%>
		</table>
		<form>
			<input type = "submit" value="Logout" name="btn"/>
		</form>
			<%
				if(request.getParameter("btn") != null)
				{

					request.getSession().invalidate();
					response.sendRedirect("index.jsp");

				}
			%>
		</center>
	</body>
</html>