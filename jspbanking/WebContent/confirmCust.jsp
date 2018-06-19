<%@ page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@ include file="tellerps.jsp" %>

<%String fnam="",lnam="";
String tid=request.getParameter("tid");
String tpas=request.getParameter("pas");
String cactid=request.getParameter("cactid");
System.out.printf("\ncactid : "+cactid);
System.out.printf("\ntpas : "+tpas);


if(cactid!="")
{
	try
	{
		getCust.setString(1,cactid);
		ResultSet rs2=getCust.executeQuery();
		
		if(rs2.next())
		{
			fnam=rs2.getString("fname");
			lnam=rs2.getString("lname");
		
			%>
		<html>
					     <head>
					 	<meta charset="utf-8">
					     <meta name=viewport content="device-width,initial-scale=1">
					 	<link rel=stylesheet href="bs/css/bootstrap.min.css">
					    <link rel="stylesheet" href="bs/css/animate.css">
							    <style> .mgn-top   {    	margin-top: 5px;	    } </style>
					 	
					 </head>
					 <body>

<form action="confirmCust1.jsp">
<div class="row">
					 		<div class="container">
					 			<div class="col-lg-12 text-center animated fadeInDown">
					    	
    <h1><font>Confirmation</font></h1>
    <h2><font>Please Check Your Details Carefully For Confirmation.. </font></h2> <br>
  
</div>
</div>
</div>
<div class="row">
<div class="container">
   <div class="col-lg-4"> </div>
					       <div class="col-lg-4 animated fadeInUp text-center">
					     
<table class="table">
<tr>
<td class="text-center">Account Id </td>
<td class="text-center"><%=cactid%></td>
</tr>       
<tr>
<td class="text-center">First Name </td>
<td class="text-center"><%=fnam%></td>
</tr>
<tr>
<td class="text-center">Last Name </td>
<td class="text-center"><%=lnam%></td>
</tr>
</table>

<button class="btn btn-block btn-primary mgnbtm text-danger">Confirm Delete Account</button>
<input type="hidden" name=cactid value=<%=cactid %>></input>
<input type="hidden" name=tid value=<%=tid %>></input>
<input type="hidden" name=tpas value=<%=tpas %>></input>
</form>

<form action="teller.jsp">
<input type="hidden" name="tid" value="<%=tid %>"></input>
<input type="hidden" name="pas" value="<%=tpas %>"></input>
<button  name="back" class="btn btn-block btn-danger mgn-top"> Go Back</button>      
</form>
      </div>
					       <div class="col-lg-4"> </div>
					      </div>
					     </div>
		</body>
		</html>
			<% 
		}
		else
		{
			%>
<html>
	<head>
	<meta charset="utf-8">
    <meta name=viewport content="device-width,initial-scale=1">
	<link rel=stylesheet href="bs/css/bootstrap.min.css">
	<link rel="stylesheet" href="bs/css/animate.css">
	 <style>
	  .mgn-top{margin-top:85px;} 
	  </style>
   
</head>
<body style="background: url(image/back_background.jpg) no-repeat center center fixed;background-size: cover;">
   
   <div class="row">
	<div class="container mgn-top">
		    <h3><font class="Text-danger ">[ Account Doesn't Exist ] </font></h3>

	</div>
</div>
    

<div class="row">
<div class="container">
<div class="col-lg-6 text-center animated fadeInLeft">
<div class="text-center" style="background-color:#665851; margin: 0px auto; border-radius:5px 5px 0 0;"><br>
<font color="#FFFFFF" size="+2">Customer Account Deletion </font>
</div>

<form action="confirmCust.jsp" method="get" class="role">

<table class="table">
<tr>
<td>Enter Account Id </td>
<td><input type="number" class="form-control" name="cactid"></td>
</tr>       
</table>
<input type=hidden name=tid value=<%=tid %>></input>
<input type=hidden name=pas value=<%=tpas %>></input>
<button class="btn btn-block btn-primary">Delete Account</button>
</form>
	<form action="teller.jsp">
	<input type=hidden name=tid value=<%=tid %>></input>
	<input type=hidden name=pas value=<%=tpas %>></input>
	
		<button class="btn btn-block btn-danger"> Back</button>
		</form>
</div>
<div class="col-lg-3"> </div>
<div class="col-lg-3"> </div>
</div>
</div>
</body>
</html>
			<% 
		}
	}
	catch(SQLException e)
	{
		System.err.println("\nSQL Alert[confirmCust.jsp]..."+e.getMessage()+"\n");
	}
}
else
{
	%>
	<html>
	<head>
	<meta charset="utf-8">
    <meta name=viewport content="device-width,initial-scale=1">
	<link rel=stylesheet href="bs/css/bootstrap.min.css">
	<link rel="stylesheet" href="bs/css/animate.css">
	 <style>
	  .mgn-top{margin-top:85px;} 
	  </style>
   
</head>
<body style="background: url(image/back_background.jpg) no-repeat center center fixed;background-size: cover;">
   
   <div class="row">
	<div class="container mgn-top">
		    <h3><font class="Text-danger ">[ Account Id Doesn't Blank ] </font></h3>

	</div>
</div>
    

<div class="row">
<div class="container">
<div class="col-lg-6 text-center animated fadeInLeft">
<div class="text-center" style="background-color:#665851; margin: 0px auto; border-radius:5px 5px 0 0;"><br>
<font color="#FFFFFF" size="+2">Customer Account Deletion </font>
</div>

<form action="confirmCust.jsp" method="get" class="role">

<table class="table">
<tr>
<td>Enter Account Id </td>
<td><input type="number" class="form-control" name="cactid"></td>
</tr>       
</table>
<input type=hidden name=tid value=<%=tid %>></input>
<input type=hidden name=pas value=<%=tpas %>></input>
<button class="btn btn-block btn-primary">Delete Account</button>
</form>
	<form action="teller.jsp">
	<input type=hidden name=tid value=<%=tid %>></input>
	<input type=hidden name=pas value=<%=tpas %>></input>
	
		<button class="btn btn-block btn-danger"> Back</button>
		</form>
</div>
<div class="col-lg-3"> </div>
<div class="col-lg-3"> </div>
</div>
</div>
</body>
</html>
<%
}
%>
</body>
</html>