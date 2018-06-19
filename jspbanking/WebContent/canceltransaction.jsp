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
				    

			<div class="row">
		     <div class="container">
		      <div class="col-lg-6 text-center mgn-top animated fadeInLeft">
		       <div class="text-center" style="background-color:#665851; margin: 0px auto; border-radius:5px 5px 0 0;"><br>
	           <font color="#FFFFFF" size="+2">Cancel Transaction </font>
		        </div>

<form action="canceltran.jsp">
      
       <table class="table">
	          <tr>
         <td><font>Account Id </td>
         <td><input type="text" class="form-control" name="actid"></td>
        </tr>       
        <tr>
         <td><font>From</td>
         <td><input type="date" class="form-control" placeholder="01/01/2017" name="datefrom"></td>
        </tr>       
        <tr>
         <td><font>To</td>
         <td><input type="date" class="form-control" name=dateto placeholder="05/01/2017"></td>
        </tr>       
       </table>
	<input type=hidden name=tid value=<%=tid %>></input>
	<input type=hidden name=pas value=<%=tpas %>></input>
       <button class="btn btn-block btn-primary">Submit</button>
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