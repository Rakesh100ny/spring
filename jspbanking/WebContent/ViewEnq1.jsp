<%@ include file="adminps.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.String.*" %>
<%@ page import="java.sql.Date" %>
<html>
<head>

	<meta charset="utf-8">
    <meta name=viewport content="device-width,initial-scale=1">
	<link rel=stylesheet href="bs/css/bootstrap.min.css">
	<style>
	.mgnbtm
	{
		margin-bottom: 5px;
	}
	</style>
</head>
<body>
<%
    String aid=request.getParameter("aid");
    String apas=request.getParameter("apas");
try
{

	%>
	<div class="row">
	<div class="container">
<form action=ViewEnq2.jsp>
			<div class="col-lg-12 text-center">
			<h1><font>www.M-Banking.com</font></h1>
		</div>
	</div>
</div>
<div class="row">
 <div class="container">
  <div class="col-lg-1"> </div>
  <div class="col-lg-10 text-center"><h3><font>Delete Transaction </font></h3> 
   <table class="table table-striped">
    <tr>
     <th>Select</th>
     <th>fname</th>
     <th>lname</th>
     <th>Mobileno</th>
     <th>Mailid</th>
     <th>Subject</th>
     <th>Message</th>
    </tr>       
<%
	ResultSet rs=getEnq.executeQuery();
	
	while(rs.next())
	{
		String fname=rs.getString("fname");
		String lname=rs.getString("lname");
		String mno=rs.getString("mobileno");
		String mid=rs.getString("mailid");
		String sub=rs.getString("subject");
		String msg=rs.getString("message");
		
	%>
	<tr>
         <td><input type=checkbox name=<%=fname %> value=<%= fname%>></td>
         <td><%=fname %></td>
         <td><%=lname %></td>
         <td><%=mno %></td>
         <td><%=mid %></td>
         <td><%=sub %></td>
         <td><%=msg %></td>
        </tr>   
		<% 	
	}
	%>
	  </table>
       <button class="btn btn-danger mgnbtm"> Delete Selected Transaction(s)</button>      
    	<input type=hidden name=aid value=<%=aid %>></input>
	<input type=hidden name=apas value=<%=apas %>></input>
	</form>
	<form action="admin.jsp">
	<input type=hidden name=aid value=<%=aid %>></input>
	<input type=hidden name=apas value=<%=apas %>></input>
       <button class="btn btn-primary"> Go Back</button>      
		</form>
      </div>
      <div class="col-lg-1"> </div>
     </div>
    </div>

	<%
	
}
catch(SQLException e)
{
	System.err.println("\nsql alert[ViewEnq.jsp] - "+e.getMessage());
}


    %>
    