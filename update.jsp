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
	<h1>Update Page</h1>
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
	String sql1 = "select * from student where rno = ? ";
	PreparedStatement pst = con.prepareStatement(sql1);
	pst.setInt(1, rno);
	ResultSet rs = pst.executeQuery();

	if ( ! rs.next())
	{
     %>
	<script>	
		alert("Account Does Not Exists ");
	</script>
	<%      
	}
	else
	{
	String sql2 = "delete from student where rno = ? ";
	PreparedStatement pst1 = con.prepareStatement(sql2);
	pst1.setInt(1, rno); 
	pst1.executeUpdate();
	String sql = "insert into student values(?,?,?,?,?)";
 	PreparedStatement pst2 = con.prepareStatement(sql); 
	pst2.setInt(1, rno); 
	pst2.setString(2, name); 
	pst2.setInt(3, maths); 
	pst2.setInt(4, science);
	pst2.setInt(5, social);
	pst2.executeUpdate(); 

     %>
	<script>	
		alert("Account Updated :) ");
	</script>
	<%      

	}

	}
	catch(SQLException err)
	{
		out.println("issue " + err);
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








