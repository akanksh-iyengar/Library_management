<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>   
        <%@ page import="javax.servlet.*"%> 
    <%@ page import="javax.servlet.http.*"%> 
    <%@ page import="javax.servlet.http.HttpServletResponse"%> 
    <%@ page import="javax.servlet.http.HttpServletRequest"%>
 <html> <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>JSP Page</title> </head> <body> 
   <%!Connection conn=null; %>
   <%!Statement stmt=null; %>
   <%!ResultSet rs; %>
   <%!String s1,s2; %>
   <%!int flag=0; %>
   <%Class.forName("com.mysql.jdbc.Driver"); 
   conn = DriverManager.getConnection("jdbc:mysql://localhost/Project","root","sa123"); 
   String username=request.getParameter("username"); 
   String password=request.getParameter("password"); 
   stmt = conn.createStatement();
   String sql = "select * from login;";
   rs=stmt.executeQuery(sql);
   while(rs.next())
   {
	   s1=rs.getString(1);
	   s2=rs.getString(2);
	   if((username.equals(s1) && password.equals(s2))) 
	   {
		   flag=1;
		   break;
	   }
   }
   if(flag==1) 
   {
	   session.setAttribute("username",username); 
	   response.sendRedirect("Home_mainlink.jsp");
	   } 
   else 
   {
		out.println("<center><h2><font color='red'>Login Failed</font></h2></center>");
	   out.println("<br>");
		out.println("<center><h3><font color='red'>Invalid username or password,try again!!</font></h3></center>");
	   request.getRequestDispatcher("login.jsp").include(request, response);
   }
   flag=0;
   %> 
   </body> </html>

