<%@page import ="java.sql.*" %>

<html>
	<head>
	<title>SMS App </title>
	<style>
		input[type ="number"]{
		width: 800px;
		

		}
		input[type ="text"]{
		width: 800px;
		

		}
			* {font-size:50px ; font-family:Times New Roman;}
		
		.nav a {color:white ; text-decoration:none ;margin:5%;}
		body {
  background-image: url("https://www.setaswall.com/wp-content/uploads/2017/12/Back-To-School-Wallpaper-19-1024x768.jpg");
}
	</style>
	</head>
	</body>
	<center>
		<div class = "nav" >
			<a href = "view.jsp">View</a>
			<a href = "create.jsp">Create </a>
			<a href = "update.jsp">Update</a>
			<a href = "delete.jsp">Delete</a>
			<a href = "index.jsp">Logout</a>
		</div>
		<h1> Update page </h1>
		<form >
			
			<input type = "number" name = "rno" placeholder = "enter rno "  required min = "1"/>
			<br/><br/>
			<input type = "text"  name = "name"  placeholder = "enter ur name" id = "name"  required minlength ="2" pattern ="[A-Za-z]*" />
			
			<br/><br/>
			<input type = "number" name = "marks1" placeholder = "enter sub marks 1 "  required min="0"  max="100"  />
			<br/><br/>
			<input type = "number" name = "marks2" placeholder = "enter sub  marks 2 " required min="0"  max="100"  />
			<br/><br/>
			<input type = "number" name = "marks3" placeholder = "enter sub  marks 3 " required min="0"  max="100" />
			<br/><br/>
			<input type = "submit" value = "Save" name ="btn" />
			<br/><br/>
		</form>
		<%
			if(request.getParameter("btn")!=null)
			{
			int rno = Integer.parseInt(request.getParameter("rno"));
			String name  = request.getParameter("name");
			int marks1 = Integer.parseInt(request.getParameter("marks1"));
			int marks2 = Integer.parseInt(request.getParameter("marks2"));
			int marks3 = Integer.parseInt(request.getParameter("marks3"));
			
			
			try
			{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

	//get connection
	String url = "jdbc:mysql://localhost:3306/yp_5jan23";
	String username = "root";
	String password = "abc456";
	Connection con = DriverManager.getConnection(url , username , password);
	String sql = "update  student set name = ? , marks1 = ? ,marks2 = ? ,marks3 = ? where rno = ? ";
	PreparedStatement pst = con.prepareStatement(sql);	
	
	pst.setString(1, name);
	pst.setInt(2, marks1);
	pst.setInt(3, marks2);
	pst.setInt(4, marks3);
	pst.setInt(5 , rno);
	long r = pst.executeUpdate();
	con.close();
	if(r == 1)
		out.println("record updated");
	else
		out.println("record does not exists");

	
	}
		
	catch(SQLException err)
	{
		out.println("issue " + err);

	}
}

	%>
	
	
		</center>
		</body>
		</html>
			

	
	