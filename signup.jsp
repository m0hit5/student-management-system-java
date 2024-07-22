<%@page  import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="javax.mail.*" %>
<%@page import="javax.mail.internet.*" %>
<%@page import="javax.activation.*" %>


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

<html>
<head>
	<title>signup</title>
	<style>
		*{ font-size:40px; font-family:SimSun; }
		.nav {background-color:black;}
		.nav a {color:white; text-decoration:none; margin:5%;}
	</style>
</head>

<body>
<center>
	<h1> Signup Page</h1>
		<form>
			<input type = "submit" value="Logout" name="btn1"/>
			<input type = "submit" value="Manage Teachers" name="btn2"/>

		</form>
			<%
				if(request.getParameter("btn1") != null)
				{

					request.getSession().invalidate();
					response.sendRedirect("index.jsp");

				}

				if(request.getParameter("btn2") != null)
				{

					response.sendRedirect("editup.jsp");

				}


			%>
	<br/>
	<h2> NOTE user email will be saved as the user id  </h2>
	<br/>
	<form method = "POST">
	<input type="email" name="un" placeholder=" enter user email " required/>
	<br/><br/>
	<input type="password" name="pw1" placeholder=" enter password  " required minlength="8"/>
	<br/><br/>
	<input type="password" name="pw2" placeholder="re enter password  " required minlength="8"/>
	<br/><br/>
	<input type="submit" name="btn" value="Register" />
	<br/><br/>
	</form>

	<%
	if( request.getParameter("btn") != null)
	{
	String un = request.getParameter("un");
	String pw1 = request.getParameter("pw1");
	String pw2 = request.getParameter("pw2");


	if(! pw1.equals(pw2))
	{
		out.println("Passwords does not match");

	}


	try
	{
	DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver() );
	String url = "jdbc:mysql://localhost:3306/auth";
	Connection con = DriverManager.getConnection(url, "root", "1234");
	String sql = "insert into users values(?, ?)";
	PreparedStatement pst = con.prepareStatement(sql);
	pst.setString(1, un);
	pst.setString(2, pw1);
	pst.executeUpdate();
	
	}
	catch(SQLException err)	
	{
		out.println("");
	}

     String email = request.getParameter("un");
     try
     {
      DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver()); 
      String url = "jdbc:mysql://localhost:3306/auth";
      Connection con = DriverManager.getConnection(url,"root","1234");
      String sql = "insert into subs values(?)";
      PreparedStatement pst = con.prepareStatement(sql);
      pst.setString(1,email);
      pst.executeUpdate();
     %>
	<script>	
		alert("Account Created :) ");
	</script>
	<%      
      // mail kahan se jayega

      Properties p = System.getProperties();
      p.put("mail.smtp.host", "smtp.gmail.com");
      p.put("mail.smtp.port", 587);
      p.put("mail.smtp.auth", true);
      p.put("mail.smtp.starttls.enable", true);
 
      // appka un and pw ka authentication

      Session ms = Session.getInstance(p, new Authenticator()
      {
       public PasswordAuthentication getPasswordAuthentication() 
       { 
        String un = "karnikayush@gmail.com";
        String pw = "oxqicrynnyabncgv";
        return new PasswordAuthentication(un, pw);
       }
      });
      
      try
      {
       // mail ko draft karke bhejo
	  String un1 = request.getParameter("un");
	  String pww = request.getParameter("pw1");

       MimeMessage msg = new MimeMessage(ms);
       String subject = "Teacher Login";
       msg.setSubject(subject);
       String txt = " Your id = " + un1 + " Password = " + pww ; 
       msg.setText(txt);
       msg.setFrom(new InternetAddress("karnikayush@gmail.com")); 
       msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
       Transport.send(msg);  

      }
      catch(Exception e)
      {
       out.println("Issue "+e);
      }
             
      con.close();
     }
     catch(SQLIntegrityConstraintViolationException sea)
     {
     %>
	<script>	
		alert("WrongPassword! >_<");
	</script>
	<%
	return;
     }

     catch(SQLException ea)
     {
      out.println("Issue "+ea);
     }

	}
	
   %>






</center>
</body>
</html>