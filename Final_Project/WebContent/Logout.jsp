<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<html> <head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>JSP Page</title> </head> <body> 
<% session.removeAttribute("username"); 
session.removeAttribute("password"); 
session.invalidate(); 
request.getRequestDispatcher("login.jsp").include(request, response);
%> 
<h3>Logout was done successfully.</h3> 
</body> </html>

