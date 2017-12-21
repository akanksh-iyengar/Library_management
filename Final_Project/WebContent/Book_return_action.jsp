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
<h1>View details</h1>
<%!Connection conn; %>
<%!int idcount=0; %>
<%!int fine=0; %>
<%!int fine_amt=0; %>
<%!int stat=0; %>
<%!int flag=0; %>
<%!int count1=0; %>
<%!int count2=0; %>
<%!PreparedStatement ps,ps2; %>
<%!ResultSet rs; %>
<%!ResultSet rs1; %>
<%!ResultSet rs3; %>
<%!ResultSet rs4; %>
<%!String id,Sub,samp,init,fff2; %>
<%try{
Class.forName("com.mysql.jdbc.Driver"); 
conn = DriverManager.getConnection("jdbc:mysql://localhost/Project","root","sa123");
String f2= request.getParameter("usn");
%>
<table border=2>
<tr>
<td>USN</td>
<td>Unique Book code</td>
<td>Renting date</td>
</tr>
<% 

Statement stmt6= conn.createStatement();
String sql7 = "SELECT * from rented_book where USN=\""+f2+"\";";
ResultSet rs6 = stmt6.executeQuery(sql7);
while (rs6.next())
{
	String fff1 = rs6.getString(1);
    fff2=rs6.getString(2);
	String fff3=rs6.getString(3);
	out.println("<tr>\n"+
		    "<td><b>"+fff1+"</b></td>\n"+
		    "<td><b>"+fff2+"</b></td>\n"+
		    "<td><b>"+fff3+"</b></td>\n"+
            "</tr>\n");

}
out.println("<br>");
Statement stmt1=conn.createStatement();
String sql2="select datediff(curdate(),Return_date) as days from rented_book where USN=\""+f2+"\";";
ResultSet rst = stmt1.executeQuery(sql2);
while(rst.next())
{
 fine=rst.getInt(1);
}
if(fine<=0)
{
	out.println("No fine to be paid");
}
else
{   
	fine_amt=fine*2;
	out.println("Fine to be paid is "+fine_amt+"");
}
Statement stmt2 = conn.createStatement();
String sql3="delete from rented_book where USN=\""+f2+"\";";
stmt2.executeUpdate(sql3);
Sub=fff2.substring(0, 5);
Statement stmt4=conn.createStatement();
String sql5="Update stock set Rented_count=Rented_count-1 where Book_id=\""+Sub+"\";";
stmt4.executeUpdate(sql5);
Statement stmt5=conn.createStatement();
String sql6="Update bar_code set Status=1 where Bar_code=\""+fff2+"\";";
stmt5.executeUpdate(sql6);
}catch(Exception e){
	out.println("<h1>No book rented for this USN</h1>");
}
%>
       <div style="position: relative">
      <p style="position: fixed; bottom: 0; width:100%; text-align: center"> Designed and developed by AKANKSH.B.S(1MS15CS008)</p>
    </div>
<%}%>