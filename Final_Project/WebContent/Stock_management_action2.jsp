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
<h1>View stock</h1>
<h2>See the total no of copies,rented copies and last rented date</h2>
<%!Connection conn; %>
<%!int idcount=0; %>
<%!int flag=0; %>
<%!PreparedStatement ps,ps2; %>
<%!ResultSet rs; %>
<%!ResultSet rs1; %>
<%!ResultSet rs3; %>
<%!ResultSet rs4; %>
<%!String id,Sub,samp; %>
<%Class.forName("com.mysql.jdbc.Driver"); 
conn = DriverManager.getConnection("jdbc:mysql://localhost/Project","root","sa123");
String f1= request.getParameter("bid");
String f2= request.getParameter("nc");
int f21=Integer.parseInt(f2);
String Sub1;
Sub1=f1.substring(0,5);
Statement stmt1 = conn.createStatement(); 
String sql2="Select * from stock";
ResultSet rs4 = stmt1.executeQuery(sql2);
while(rs4.next())
{
	samp=rs4.getString(1);
	if(samp.equals(Sub1))
	{
		flag=1;
		break;
	}
}
if(flag==0)
{	
ps=conn.prepareStatement("insert into stock values(?,?,?,?)");
ps.setString(1, Sub1);
ps.setInt(2, f21);
ps.setInt(3,0);
ps.setString(4, null);
int c= ps.executeUpdate();
idcount=0;
}
if(flag==1)
{
	Statement stmt4=conn.createStatement();
	System.out.println(samp);
	String sql5="Update stock set No_of_copies=No_of_copies+"+f21+" where Book_id=\""+samp+"\"";;
	System.out.println(sql5);
	stmt4.executeUpdate(sql5);
}
%>
<table border=2>
<tr>
<td>Book_id</td>
<td>Total no of copies</td>
<td>No of rented copies</td>
<td>Last rented date</td>
</tr>
<%
Statement stmt= conn.createStatement();
String sql1 = "SELECT * from stock";
ResultSet rs2 = stmt.executeQuery(sql1);
while (rs2.next())
{
	String fff1 = rs2.getString(1);
	int fff2=rs2.getInt(2);
	int fff3=rs2.getInt(3);
	String fff4 = rs2.getString(4);
	out.println("<tr>\n"+
		    "<td><b>"+fff1+"</b></td>\n"+
		    "<td><b>"+fff2+"</b></td>\n"+
		    "<td><b>"+fff3+"</b></td>\n"+
		    "<td><b>"+fff4+"</b></td>\n"+
            "</tr>\n");

}
%>
</table>
<% 
Statement stmt2 = conn.createStatement();   
String sql3 = "SELECT * from bar_code where Book_id="+"\""+Sub1+"\""+";";
rs3 = stmt.executeQuery(sql3);
while(rs3.next())
{
	idcount++;
}
idcount++;
int l = idcount+f21;
for(int k=idcount;k<l;k++)
{	
 id=Sub1+"-"+k;
 ps2=conn.prepareStatement("insert into bar_code values(?,?,?)");
 ps2.setString(1, Sub1);
 ps2.setString(2, id);
 ps2.setInt(3, 1);
 int c1= ps2.executeUpdate();
}
 idcount=0; 
 flag=0;
%>
       <div style="position: relative">
      <p style="position: fixed; bottom: 0; width:100%; text-align: center"> Designed and developed by AKANKSH.B.S(1MS15CS008)</p>
    </div>
<%}%>