<%@ page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@ include file="adminps.jsp" %>

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
String telid=request.getParameter("telid");
System.out.printf("\ntelid : "+telid);
System.out.printf("\napas : "+apas);

	try
	{
			delTell.setString(1,telid);
			delTell.executeUpdate();
			%>

	<div class="row">
		<div class="container">
			<div class="col-lg-12 text-center">
				<h1><font>[ Teller is Successfully Deleted ]</font></h1>
			</div>
		</div>
	</div>
    <div class="row">
     <div class="container">
      <div class="col-lg-4"> </div>			
			<div class="col-lg-4 text-center">
			<form action="admin.jsp">
			<input type=hidden name=aid value=<%=aid %>></input>
	        <input type=hidden name=apas value=<%=apas %>></input>
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
		System.err.println("\nSQL Alert[DeleteTeller.jsp]..."+e.getMessage()+"\n");
	}
	
%>

</body>
</html>		