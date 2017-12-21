<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Master</title>
<head>
<style>
<% if (session.getAttribute("username")==null ) 
{
	request.getRequestDispatcher("login.jsp").include(request, response);
	out.println("<h3>Session timed out</h3>");
}
else
{ %>
body {
    margin: 0;
}

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 25%;
    background-color: #f1f1f1;
    position: fixed;
    height: 100%;
    overflow: auto;
}

li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}

li a.active {
    background-color: #4CAF50;
    color: white;
}

li a:hover:not(.active) {
    background-color: #555;
    color: white;
}
</style>
</head>
<body>

<ul>
  <li><a class="active" href="#home">Home</a></li>
  <li><a href="Add.jsp">Add account</a></li>
  <li><a href="Delete.jsp">Delete account</a></li>
  <li><a href="Logout_head.jsp">Logout</a></li>
</ul>
<div style="margin-left:25%;padding:1px 16px;height:1000px;">
<h1> Delete a librarian account </h1>
<form name="addn1" action="Delete_action.jsp" method="post">
<table>
<tr>
  <td>Enter ID:</td>
  <td><input type="text" name="id"></td>
</tr>
  <tr>
  <td><input type="submit" value="delete"></td>
    <td><input type="reset" value="clear"></td>
  </tr>
</table>

</form>
       <div style="position: relative">
      <p style="position: fixed; bottom: 0; width:100%; text-align: center"> Designed and developed by AKANKSH.B.S(1MS15CS008)</p>
    </div>
</body>
</html>
<%}%>