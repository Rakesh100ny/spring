<%@ include file="tellerps.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
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
<!-- 
	<div class="row">
	<div class="container mgn-top">
		    <h3><font class="Text-danger">[ All * Fields Are Compulsory - Blank Field is Not Allowed ]</font></h3>

	 </div>
    </div> -->


	         <div class="row">
	          <div class="container mgn-top">
	           <div class="col-lg-6 text-center animated fadeInLeft">
	           <div class="text-center" style="background-color:#665851; margin: 0px auto; border-radius:5px 5px 0 0;"><br>
	           <font color="#FFFFFF" size="+2">Change Password </font>
		        </div>
	 	      <form action="telchangpas.jsp" method="get" class="role">
	
	            <table class="table">
	             <tr>
	              <td><font class="text-danger">Old Password </td>
	              <td><input type="text" class="form-control" name="oldpas"></td>
	             </tr>       
	             <tr>
	              <td><font class="text-success">New Password </td>
	              <td><input type="text" class="form-control" name="newpas"></td>
	             </tr>
	             <tr>
	             <td><font class="text-success">Confirm New Password </td>
	             <td><input type="password" class="form-control" name="cnpas"></td>
	            </tr>       


	            </table>
<input type="hidden" name=tid value=<%=tid %>></input>
	<input type="hidden" name=pas value=<%=tpas %>></input>				
	
	            <button class="btn btn-block btn-primary" name="cp">Change Password</button>
	            </form>
	<form action="teller.jsp">
	<input type=hidden name=tid value=<%=tid %>></input>
	<input type=hidden name=pas value=<%=tpas %>></input>
	 <button class="btn btn-block btn-danger">Go Back</button> 
		</form>           </div>
	           <div class="col-lg-3"> </div>
	           <div class="col-lg-3"> </div>

	          </div>
	         </div>
	     </body>
	     </html>