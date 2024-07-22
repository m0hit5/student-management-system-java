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
		String user = request.getParameter("r");
		try
		{
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver()); 
			String url = "jdbc:mysql://localhost:3306/auth";
			Connection con = DriverManager.getConnection(url,"root","1234");
			String sql = "delete from users where user=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1,user);
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
		<title>Delete</title>
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
				<a href="signup.jsp">Go Back</a>
			</div>
			<h1>DELETE TEACHERS</h1>
			<table border="3" style="width:70%;">
				<tr>
					<th>User Id</th>
					<th>Password</th>
					<th>Delete</th>
				</tr>
			<%
				try
				{
					DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver()); 
					String url = "jdbc:mysql://localhost:3306/auth";
					Connection con = DriverManager.getConnection(url,"root","1234");
					String sql = "select * from users";
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					while(rs.next())
					{
						String user = rs.getString(1);
						String pass = rs.getString(2);

			%>
						<tr style="text-align:center;">
							<td><%=user%></td>
							<td><%=pass%></td>
							<td><a href="?r=<%=user %>"onclick="return confirm('Are you sure?')">Delete</a></td>
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