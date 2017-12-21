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
<%!Connection conn; %>
<%!int flag=0; %>
<%!PreparedStatement ps,ps1; %>
<%!ResultSet rs; %>
<%!ResultSet rs1; %>
<%!String id; %>
<%Class.forName("com.mysql.jdbc.Driver"); 
conn = DriverManager.getConnection("jdbc:mysql://localhost/Project","root","sa123");
String f1= request.getParameter("name");
String f2= request.getParameter("id");
String f3= request.getParameter("pwd");

String Sub;
Sub=f2.substring(0,3);
Statement stmt = conn.createStatement();   
	String sql = "SELECT * from login;";
	rs = stmt.executeQuery(sql);
	while(rs.next())
	{
		id=rs.getString(1);
		if(id.equals(f2))
		{
			flag=1;
			break;
		}
	}
if(flag==1)
{
	out.println("<h1>ID already taken,try a different one</h1>");
}
if(flag==0)
{	
ps=conn.prepareStatement("insert into login values(?,?)");
ps.setString(1, f2);
ps.setString(2, f3);
int c= ps.executeUpdate();
ps1=conn.prepareStatement("insert into librarian values(?,?)");
ps1.setString(1, f2);
ps1.setString(2, f1);
int c1= ps1.executeUpdate();
%>
<h2>List of existing librarian accounts</h2>
<table border=2>
<tr>
<td>Librarian_id</td>
<td>Name</td>
</tr>
<%
String sql1 = "SELECT * from librarian;";
ResultSet rs2 = stmt.executeQuery(sql1);
while (rs2.next())
{
	String fff1 = rs2.getString(1);
	String fff2=rs2.getString(2);
	out.println("<tr>\n"+
		    "<td><b>"+fff1+"</b></td>\n"+
		    "<td><b>"+fff2+"</b></td>\n"+
            "</tr>\n");

}
%>
</table>
<p></p>
<p></p>
<%} 
flag=0;
%>
</table>
     <div style="position: relative">
      <p style="position: fixed; bottom: 0; width:100%; text-align: center"> Designed and developed by AKANKSH.B.S(1MS15CS008)</p>
    </div>
</body>
</html>
<%}%>