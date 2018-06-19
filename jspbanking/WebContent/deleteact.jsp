<%@ include file="tellerps.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
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
String tid,tpas;
tid=request.getParameter("tid");
tpas=request.getParameter("tpas");

System.out.printf("\ntid: %s",tid);
System.out.printf("\ntpas : %s",tpas);

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
		     <div class="container">
		      <div class="col-lg-6 text-center mgn-top animated fadeInLeft">
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
