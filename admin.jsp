<html>
<head>
	<title>admin</title>
	<style>
		*{ font-size:40px; font-family:SimSun; }
	</style>
</head>

<body>
<center>
	<h1> Admin Page</h1>
	<form method = "POST">
	<input type="text" name="un" placeholder=" enter username " " oninvalid="setCustomValidity('Enter Username. ')" required/>
	<br/><br/>
	<input type="password" name="pw" placeholder=" enter password " minlength="8" " oninvalid="setCustomValidity('Enter Password. ')" required/>
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
			if (un.equals("admin") && pw.equals("admin123"))
			{
				request.getSession().setAttribute("user", un);
				response.sendRedirect("signup.jsp");
			}
			else
			{
				out.println("invalid login");
			}
		}
		catch(Exception e)
		{
			out.println("Issue " + e);
		}
	}
	%>
	<br/>
	<a href="./index.jsp"> return to student </a>

</center>
</body>
</html>