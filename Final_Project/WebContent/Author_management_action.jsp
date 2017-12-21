<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Author Master</title>
<head>
<style>
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
<h1>View authors</h1>
<%!Connection conn; %>
<%!int idcount=0; %>
<%!PreparedStatement ps; %>
<%!ResultSet rs; %>
<%!ResultSet rs1; %>
<%!String id; %>
<% if (session.getAttribute("username")==null ) 
{
	out.println("Session timed out");
}
Class.forName("com.mysql.jdbc.Driver"); 
conn = DriverManager.getConnection("jdbc:mysql://localhost/Project","root","sa123");
String f1= request.getParameter("aname");
String f2= request.getParameter("category");
String Sub;
Sub=f2.substring(0,3);
Statement stmt = conn.createStatement();   
	String sql = "SELECT * from author;";
	rs = stmt.executeQuery(sql);
	while(rs.next())
	{
		idcount++;
	}
	idcount++;
ps=conn.prepareStatement("insert into author values(?,?,?)");
ps.setInt(1, idcount);
ps.setString(2, f1);
ps.setString(3, Sub);
int c= ps.executeUpdate();
idcount=0;
%>
<table border=2>
<tr>
<td>Author_id</td>
<td>Author_name</td>
<td>Category_id</td>
</tr>
<%
String sql1 = "SELECT * from author";
ResultSet rs2 = stmt.executeQuery(sql1);
while (rs2.next())
{
	String fff1 = rs2.getString(1);
	String fff2=rs2.getString(2);
	String fff3=rs2.getString(3);
	out.println("<tr>\n"+
		    "<td><b>"+fff1+"</b></td>\n"+
		    "<td><b>"+fff2+"</b></td>\n"+
		    "<td><b>"+fff3+"</b></td>\n"+
            "</tr>\n");

}
%>
</table>
<p></p>
<p></p>
<form name="addn_action1" action="Author_management.jsp" method="post">
<table>
<tr>
<td><input type="submit" value="Add a new author"></td>
</tr>
</form>
</table>
       <div style="position: relative">
      <p style="position: fixed; bottom: 0; width:100%; text-align: center"> Designed and developed by AKANKSH.B.S(1MS15CS008)</p>
    </div>
</body>
</html>