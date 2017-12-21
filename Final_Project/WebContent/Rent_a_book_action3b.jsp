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
<h1>View student information</h1>
<%!Connection conn; %>
<%!int idcount=0; %>
<%!int stat=0; %>
<%!int flag=0; %>
<%!int flag1=0; %>
<%!int count1=0; %>
<%!int count2=0; %>
<%!PreparedStatement ps,ps2; %>
<%!ResultSet rs; %>
<%!ResultSet rs1; %>
<%!ResultSet rs3; %>
<%!ResultSet rs4; %>
<%!String id,Sub,samp,init,id1; %>
<%Class.forName("com.mysql.jdbc.Driver"); 
conn = DriverManager.getConnection("jdbc:mysql://localhost/Project","root","sa123");
String f1= request.getParameter("bid");
String f2= request.getParameter("usn");
String Sub1;
Sub1=f1.substring(0,5);
Statement stmt15=conn.createStatement();
Statement stmt10=conn.createStatement();
String sql11="Select * from stock where Book_id=\""+Sub1+"\"";
ResultSet rs11=stmt10.executeQuery(sql11);
while(rs11.next())
{
	count1=rs11.getInt(2);
	count2=rs11.getInt(3);
}
if(count2>=count1)
{
	out.println("The book is currently not in stock");
	out.println("<br>");
	Statement stmt11=conn.createStatement();
	String sql12="Select * from stock where Book_id=\""+Sub1+"\"";
	ResultSet rs12=stmt11.executeQuery(sql12);
	while(rs12.next())
	{
      init=rs12.getString(4);
	}
	out.println("Last rented date of the book is "+init+"");
}
else
{	
Statement stmt1 = conn.createStatement(); 
String sql2="Select * from bar_code where Book_id=\""+Sub1+"\"";
ResultSet rs4 = stmt1.executeQuery(sql2);
while(rs4.next())
{
	samp=rs4.getString(2);
	stat=rs4.getInt(3);
	if(stat==1)
	{
	     break;
	}
}   
try{
ps=conn.prepareStatement("insert into rented_book values(?,?,?,?,?)");
ps.setString(1, f2);
ps.setString(2, samp);
ps.setDate(3, java.sql.Date.valueOf(java.time.LocalDate.now()));
ps.setString(4, null);
ps.setInt(5, 0);
int c= ps.executeUpdate();
idcount=0;
stat=0;
Statement stmt2 = conn.createStatement();
String sql3="update rented_book set Return_date=adddate(Renting_date,30);";
stmt2.executeUpdate(sql3);
Statement stmt3 = conn.createStatement();
String sql4="update stock set Last_rented_date=current_date() where Book_id=\""+Sub1+"\";";
stmt3.executeUpdate(sql4);
Statement stmt4=conn.createStatement();
String sql5="Update stock set Rented_count=Rented_count+1 where Book_id=\""+Sub1+"\";";
stmt4.executeUpdate(sql5);
Statement stmt5=conn.createStatement();
String sql6="Update bar_code set Status=0 where Bar_code=\""+samp+"\";";
stmt5.executeUpdate(sql6);
%>
<table border=2>
<tr>
<td>USN</td>
<td>Unique Book code</td>
<td>Renting date</td>
<td>Return date</td>
</tr>
<%
Statement stmt6= conn.createStatement();
String sql7 = "SELECT * from rented_book where USN=\""+f2+"\";";
ResultSet rs6 = stmt6.executeQuery(sql7);
while (rs6.next())
{
	String fff1 = rs6.getString(1);
	String fff2=rs6.getString(2);
	String fff3=rs6.getString(3);
	String fff4 = rs6.getString(4);
	out.println("<tr>\n"+
		    "<td><b>"+fff1+"</b></td>\n"+
		    "<td><b>"+fff2+"</b></td>\n"+
		    "<td><b>"+fff3+"</b></td>\n"+
		    "<td><b>"+fff4+"</b></td>\n"+
            "</tr>\n");

}
%>
<h2>Updated stock information</h2>
</table>
<table border=2>
<tr>
<td>Book_id</td>
<td>No_of_copies</td>
<td>Rented count</td>
<td>Last Rented Date</td>
</tr>
<%
Statement stmt7= conn.createStatement();
String sql8 = "SELECT * from stock where Book_id=\""+Sub1+"\";";
ResultSet rs7 = stmt7.executeQuery(sql8);
while (rs7.next())
{
	String fff1 = rs7.getString(1);
	String fff2=rs7.getString(2);
	String fff3=rs7.getString(3);
	String fff4 = rs7.getString(4);
	out.println("<tr>\n"+
		    "<td><b>"+fff1+"</b></td>\n"+
		    "<td><b>"+fff2+"</b></td>\n"+
		    "<td><b>"+fff3+"</b></td>\n"+
		    "<td><b>"+fff4+"</b></td>\n"+
            "</tr>\n");

}
}catch(SQLException e){
	out.println("<h1>USN not registered</h1>");
}
%>
</table>
<%} %>
       <div style="position: relative">
      <p style="position: fixed; bottom: 0; width:100%; text-align: center"> Designed and developed by AKANKSH.B.S(1MS15CS008)</p>
    </div>
<%} %>    
