<%@ page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@ include file="tellerps.jsp" %>

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

String tid=request.getParameter("tid");
String tpas=request.getParameter("tpas");
String cactid=request.getParameter("cactid");
System.out.printf("\ncactid : "+cactid);
System.out.printf("\ntpas : "+tpas);
System.out.printf("\ntid : "+tid);

	try
	{
		delCust.setString(1,cactid);
		delCust.executeUpdate(); 
			%>

	<div class="row">
		<div class="container">
			<div class="col-lg-12 text-center">
				<h1><font>[ Account is Successfully Deleted ]</font></h1>
			</div>
		</div>
	</div>
    <div class="row">
     <div class="container">
      <div class="col-lg-4"> </div>			
			<div class="col-lg-4 text-center">
			<form action="teller.jsp">
			<input type=hidden name=tid value=<%=tid %>></input>
	        <input type=hidden name=pas value=<%=tpas %>></input>
		<button class="btn btn-block btn-danger" name=back value=GoBack>Go Home</button>			
		</form>
		</div>
      <div class="col-lg-4"> </div>
     </div>
    </div>
	<% 
	}
	catch(SQLException e)
	{
		System.err.println("\nSQL Alert[confCust1.jsp]..."+e.getMessage()+"\n");
	}
%>
</body>
</html>		