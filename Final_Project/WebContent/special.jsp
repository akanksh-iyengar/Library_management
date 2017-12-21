<!DOCTYPE html>
<html>
<head>
<style>
<% if (session.getAttribute("username")==null ) 
{
	request.getRequestDispatcher("login.jsp").include(request, response);
	out.println("<h3>Session timed out</h3>");
}
else
{%>
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
<body background="fin.jpg">

<ul>
  <li><a class="active" href="#home">Home</a></li>
  <li><a href="Add.jsp">Add account</a></li>
  <li><a href="Delete.jsp">Delete account</a></li>
  <li><a href="Logout_head.jsp">Logout</a></li>
</ul>

<div style="margin-left:25%;padding:1px 16px;height:1000px;">
  <h2>Welcome to MSRIT</h2>
  <h3>Engineering Sciences Library Management</h3>
  <p>This page is accessible only by authorities</p>
  <p>You can add and delete librarian accounts</p> 
</div>
       <div style="position: relative">
      <p style="position: fixed; bottom: 0; width:100%; text-align: center"> Designed and developed by AKANKSH.B.S(1MS15CS008)</p>
    </div>
</body>
</html>
<% } %>