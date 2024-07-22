<%@page import="java.sql.* "%>

<%
	if (session.getAttribute("user") != null)
	{
		response.setHeader("Cache-Control", "no-cache, no-store");
		String user = (String)session.getAttribute("user");
	}
	else
	{
		response.sendRedirect("index.jsp");
	}
%>

<html>
<head>
	<title>SMS app</title>
	<style>
		*{ font-size:40px; }
		h3{ font-size:30px; }
		.nav {background-color:black;}
		.nav a {color:white; text-decoration:none; margin:5%;}
	</style>
</head>
<body>
	<center>
	<div class="nav">
	<a href="home.jsp">Go Back</a>
	</div>
	<h1>Create Page</h1>
	<form method="POST"> 
	<input type="number" size="10" id="rno" placeholder="enter rno" name="rno" required /> 
	<h3>name should contain atleast 2 letters</h3>
	<input type="text"  size="20" id="name" name="name" placeholder="enter name" pattern="[A-Za-z]+" required minlength="2"  /> 
	<br/><br/>  
	<input type="number" size="40" name="maths" placeholder="maths" min="0" max="100" " required/>
	<input type="number" size="40" name="science" placeholder="science" min="0" max="100" required/>
	<input type="number" size="40" name="social" placeholder="social" min="0" max="100" " required/>
 	<br/><br/> 
	<input type="submit" value="Save" name="btn1" /> 
	</form> 
			


	
	<%
	if (request.getParameter("btn1") != null)
	{
	int rno = Integer.parseInt(request.getParameter("rno"));
	String name = request.getParameter("name"); 
	int maths = Integer.parseInt(request.getParameter("maths"));
	int science = Integer.parseInt(request.getParameter("science"));
	int social = Integer.parseInt(request.getParameter("social"));
	try
	{
	DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
	String url = "jdbc:mysql://localhost:3306/kc_5jan23"; 
	Connection con = DriverManager.getConnection(url, "root", "1234");
	String sql = "insert into student values(?,?,?,?,?)";
 	PreparedStatement pst = con.prepareStatement(sql); 
	pst.setInt(1, rno); 
	pst.setString(2, name); 
	pst.setInt(3, maths); 
	pst.setInt(4, science);
	pst.setInt(5, social);
	pst.executeUpdate(); 
	con.close(); 

     %>
	<script>	
		alert("Account Created :) ");
	</script>
	<%      	
	
	}
	catch(SQLIntegrityConstraintViolationException err)
	{
     %>
	<script>	
		alert("ID Already Exists ");
	</script>
	<%      
	}
	catch(Exception er)
	{
		out.println("issue " + er);
	}
	}
	%>
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








