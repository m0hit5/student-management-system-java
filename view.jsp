<%@page import ="java.sql.*" %>
<%
	if(request.getParameter("r") != null)
	{
	int rno = Integer.parseInt(request.getParameter("r"));

	try{
	DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

	//get connection
	String url = "jdbc:mysql://localhost:3306/yp_5jan23";
	String username = "root";
	String password = "abc456";
	Connection con = DriverManager.getConnection(url , username , password);
	

	String sql = "delete from student where rno = ?";
	PreparedStatement pst = con.prepareStatement(sql);	
	pst.setInt(1, rno);
	pst.executeUpdate();
	con.close();
	}
	catch(SQLException err)
	{
		out.println("issue " + err);

	}
}
%>	
<html>
	<head>
	<title>SMS App </title>
	<style>
		* {font-size:40px ;}
		
		.nav a {color:black ; text-decoration:none ;margin:5%;}
			body {
  background-image: url("https://images.wallpaperscraft.com/image/single/school_board_bookmark_74545_1024x768.jpg");
}
	</style>
	</head>
	</body>
	<center>
		<div class = "nav" >
			<a href = "index.jsp">Home </a>
			<a href = "create.jsp">Create </a>
			<a href = "update.jsp">Update </a>
			<a href = "delete.jsp">Delete</a>
			<a href = "index.jsp">Logout</a>
			
		</div>
		<br/><br/>
		<table border = "3" style = "width:50% ;">
		<tr>
			<th> Rno</th>
			<th> Name</th>
			<th> Marks1</th>
			<th>Marks2</th>
			<th>Marks3</th>
			<th>Delete</th>
		</tr>
		<%
			try
			{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

	//get connection
	String url = "jdbc:mysql://localhost:3306/yp_5jan23";
	String username = "root";
	String password = "abc456";
	Connection con = DriverManager.getConnection(url , username , password);
	

	String sql = "select * from student ";
	Statement stmt = con.createStatement();	
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next())
	{
		int rno = rs.getInt(1);
		String name = rs.getString(2);
		int marks1 =  rs.getInt(3);
		int marks2 =  rs.getInt(4);
		int marks3 =  rs.getInt(5);
		
	
	%>
		<tr style = "text-align:center;">
		<td><%=rno %></td>
		<td><%=name %></td>
		<td><%= marks1%></td>
		<td><%= marks2%></td>
		<td><%= marks3%></td>
		
		<td><a href="?r=<%=rno%>" onClick= "return confirm('r u sure ??')">Delete</a></td>
		</tr>
	<% 	
		}
	}
	catch(SQLException err)
	{
		out.println("issue " + err);

	}


	%>
	
	</table>
		</center>
		</body>
		</html>
			

	
	