<%@page  import="java.sql.*" %>

<html>
<head>
	<title>login</title>
	<style>
		*{ font-size:40px; font-family:SimSun; }
	</style>
</head>

<body>
<center>
	<h1> Login Page</h1>
	<form method = "POST">
	<input type="email" name="un" placeholder=" enter username " required/>
	<br/><br/>
	<input type="password" name="pw" placeholder=" enter password " minlength="8" required/>
	<br/><br/>
	<input type="submit" name="btn" value="Login" />
	<br/><br/>
	</form>

	<br/>
	<%
	if( request.getParameter("btn") != null)
	{
	String un = request.getParameter("un");
	String pw = request.getParameter("pw");
	try
	{
	DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver() );
	String url = "jdbc:mysql://localhost:3306/auth";
	Connection con = DriverManager.getConnection(url, "root", "1234");
	String sql = "select * from users where user = ? and pass = ?";
	PreparedStatement pst = con.prepareStatement(sql);
	pst.setString(1, un);
	pst.setString(2, pw);
	ResultSet rs = pst.executeQuery();
	if (rs.next())
	{
		request.getSession().setAttribute("user", un);
		response.sendRedirect("home.jsp");
	}
	else
	{
		out.println("invalid login");
	}
	}
	catch(SQLException err)	
	{
		out.println("Issue " + err);
	}
	}


	%>
	<br/>
	<a href="./index.jsp"> return to student </a>

</center>
</body>
</html>