<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <html> <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>JSP Page</title> </head> <body> 
   <% String username=request.getParameter("username"); 
   String password=request.getParameter("password"); 
   if((username.equals("akanksh") && password.equals("library"))) 
   {
	   session.setAttribute("username",username); 
	   response.sendRedirect("special.jsp");
	   } 
   else 
   {
		out.println("<center><h2><font color='red'>Login Failed</font></h2></center>");
	   out.println("<br>");
		out.println("<center><h3><font color='red'>You are not Akanksh!!</font></h3></center>");
	   request.getRequestDispatcher("login_head.jsp").include(request, response);
   }
   %> 
   </body> </html>