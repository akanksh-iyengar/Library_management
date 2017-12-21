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
<% String a=session.getAttribute("username").toString(); %>
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
<h1> Select a filtering option to ease your search </h1>
<style>
    .lnkbtn{
        display: block;
        width: 100px;
        background-color: lightgrey;
        border: 1px solid black;
        text-align: center;
        text-decoration: none;
        padding: 5px 0px 5px 0px;
    }

    .lnkbtn:hover{
        background-color: #aaa;
    }

    .lnkbtn:visited{
        color: blue;
    }

    .lnkbtn:active{
        border: 1px solid red;
    }

</style>
<body>
    <a href = "Rent_a_book_action1a.jsp" class = "lnkbtn">Author</a>
    <a href = "Rent_a_book_action1b.jsp" class = "lnkbtn">Category</a>
</body>

       <div style="position: relative">
      <p style="position: fixed; bottom: 0; width:100%; text-align: center"> Designed and developed by AKANKSH.B.S(1MS15CS008)</p>
    </div>
</body>
</html>
<%}%>