<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Master</title>
<head>
<style>
<%
if (session.getAttribute("username")==null ) 
{
	request.getRequestDispatcher("login.jsp").include(request, response);
	out.println("<h3>Session timed out</h3>");
}
else
{
 %>
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
  <li><a class="active" href="Home_mainlink.jsp">Home</a></li>
  <li><a href="Book_addn_new.jsp">Book Master Management</a></li>
  <li><a href="Student_management.jsp">Student Master Management</a></li>
    <li><a href="Author_management.jsp">Author Master Management</a></li>
      <li><a href="Book_author_management.jsp">Book_author Master Management</a></li>
          <li><a href="Stock_management.jsp">Stock Management</a></li>
    <li><a href="Rent_a_book.jsp">Rent a book</a></li>
    <li><a href="Book_return.jsp">Return a book</a></li>
    <li><a href="Logout.jsp">Logout</a></li>
</ul>
<div style="margin-left:25%;padding:1px 16px;height:1000px;">
<h1> Add a new student </h1>
<form name="stud" action="Student_management_action.jsp" method="post">
<table>
<tr>
  <td>USN:</td>
  <td><input type="text" name="usn"></td>
</tr>
<tr>
  <td>Name:</td>
  <td><input type="text" name="name"></td>
</tr>
<tr>
  <td>Section:</td>
  <td><select name="section">

<%!Connection conn = null; %>
<%!Statement stmt = null; %>

<% String a=session.getAttribute("username").toString();
Class.forName("com.mysql.jdbc.Driver"); 
conn = DriverManager.getConnection("jdbc:mysql://localhost/Project","root","sa123");
stmt = conn.createStatement();
String sql1 = "SELECT * from section";
ResultSet rs1 = stmt.executeQuery(sql1);
while (rs1.next())
{
	String ff1 = rs1.getString(1);
	String ff2 = rs1.getString(2);
	String ff3 = ff1+"("+ff2+")";
	out.println("<option>"+ff3+"</option>\n");
}
%>
  </select>
  </td>
  </tr>
  <tr>
  <td><input type="submit" value="add"></td>
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