<%@page import = "java.sql.*" %>
<html>
	<head>
		<style>
			* {font-size:50px ; font-family:Times New Roman;}
			
			body {
	background: linear-gradient(
        rgba(255, 255, 255, 0.5),
        rgba(255, 255, 255, 0.5)
      ),background-size: cover;
  background-image: url("https://www.setaswall.com/wp-content/uploads/2017/12/Back-To-School-Wallpaper-19-1024x768.jpg");
}
			
		.nav a {color:white ; text-decoration:none ; margin:5%;}	
			
		</style>
		<title>SMS</title>
		
	</head>
	<body>
	<center>
		<div class = "nav" >
			<a href = "index.jsp">Login</a>
			<a href = "signup.jsp">SignUp</a>
			
			
		
		</div>
		<br/><br/>
		<form method = "POST">
			<input type = "text" name = "un" placeholder = "enter ur name " required minlength ="2" pattern ="[A-Za-z]*"  />
			<br/><br/>
			<input type = "password"  name = "pw1"  placeholder = "enter  password"    />
			<br/><br/>
			<input type = "password"  name = "pw2"  placeholder = "repeat  password"   />
			<br/><br/>
			
			
			<br/><br/>
			<input type = "submit" value = "Register" name = "btn" />
		
		</form>
		
		


		<% 
			if(request.getParameter("btn")!=null)
			{
			String un  = request.getParameter("un");
			String pw1 = request.getParameter("pw1");
			String pw2 = request.getParameter("pw2"); 

			if(!pw1.equals(pw2))
			{
				out.println("passwords did not match");
				return;	
			}
			if(pw1.length() < 8)
			{
				out.println("passwords shud be min 8 characters");
				return;	
			}
			try{
			
			
			
	DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

	//get connection
	String url = "jdbc:mysql://localhost:3306/auth_5jan23";
	
	Connection con = DriverManager.getConnection(url , "root", "abc456");
	

	String sql = "insert into users values(?,?)";
	PreparedStatement pst = con.prepareStatement(sql);	
	pst.setString(1 , un);
	pst.setString(2, pw1);
	pst.executeUpdate();
	con.close();
	response.sendRedirect("index.jsp");
	}
	
	
	
catch(SQLException er)
{
	out.println("user already registered" + er);

	
}

	

}		
			
		%>
		</center>
		</body>
		</html>
			