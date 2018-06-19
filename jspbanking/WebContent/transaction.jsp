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
	    	  .mgn-top{margin-top:80px;} 
	         
	    	 </style>
	     
			
		</head>
		<body>
		    <div class="row">
		     <div class="container">
		      <div class="col-lg-3"> </div>
		      <div class="col-lg-6 mgn-top animated fadeInLeft Text-Center">
	 	       <div class="text-center" style="background-color:#665851; margin-top: 0; border-radius:5px 5px 0 0;"><br>
               <font color="#FFFFFF" size="+2">Transaction</font>
  	        </div>
 		      <form action="trans.jsp" method="get" class="role">  
		       <table class="table">
		        <tr>
		         <td>Transaction Id </td>
		         <td><input type="text" class="form-control"  name="trnid" value=<%=trnid %>></td>
		        </tr>       
		        <tr>
		         <td>Account Id </td>
		         <td><input type="text" class="form-control" name="actid"></td>
		        </tr>       
		              <tr>
         <td>Teller Id </td>
         <td><input type="text" class="form-control" readonly="true" name="tid" value=<%=tid %>></td>
        </tr>       
        <tr>
         <td>Type </td>
         <td><input type="radio" name="typ" value="CR" checked="true">CR
          <input type="radio" name="typ" value="DR">DR</td>
        </tr>       
        <tr>
         <td>Amount </td>
         <td><input type="number" class="form-control" name="amt"></td>
        </tr>       
       </table>

        <input type=hidden name=tid value=<%=tid %>></input>
		<input type=hidden name=pas value=<%=tpas %>></input>
                <button class="btn btn-block btn-primary">Submit</button>
		       </form>
		       
					<form action="teller.jsp">
					<input type=hidden name=tid value=<%=tid %>></input>
					<input type=hidden name=pas value=<%=tpas %>></input>					
<button class="btn btn-block btn-danger">Go Back</button></form>
		      </div>
		      <div class="col-lg-3"> </div>
		     </div>
		    </div>
		</body>
		</html>