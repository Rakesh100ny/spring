<%@ page import="java.sql.*" %>
<%@ include file="custps.jsp" %>

<%
		String uid,cpas;
		uid=request.getParameter("uid");
		cpas=request.getParameter("cpas");
		System.out.printf("\ncpas : %s",cpas);
		System.out.printf("\nuid : %s",uid);
		
 %>
<html>
<head>
	<meta charset="utf-8">
    <meta name=viewport content="device-width,initial-scale=1">
	<link rel=stylesheet href="bs/css/bootstrap.min.css">
	<style>
	.mgntop
	{
		margin-top:5px;
	}
	</style>
</head>
<body>
	<div class="row">
		<div class="container">
			<div class="col-lg-12 text-center">
				<h1><font>www.E-Banking.com</font></h1>
			</div>
		</div>
	</div>
    
<form action="cashwd.jsp">
    <div class="row">
     <div class="container">
      <div class="col-lg-4"> </div>
      <div class="col-lg-4"> 
       <table class="table">
        <tr>
         <td>Enter Ammount </td>
         <td><input type="number" name="amt" class="form-control" name="amt"></td>
        </tr>       
       </table>
       <button class="btn btn-block btn-primary" name="submit">Submit</button>
       <input type="hidden" name="uid" value=<%=uid %>></input>
	<input type="hidden" name="cpas" value=<%=cpas %>></input>
    <input type="hidden" name="trnid" value=<%=trnid %>></input>				
	</form>
    <form action="cust.jsp">
	<input type=hidden name=cid value=<%=uid %>></input>
	<input type=hidden name=pas value=<%=cpas %>></input>
    <button name="back" class="btn btn-block btn-danger  mgntop">Go Back</button> 
    </form>
      </div>
      <div class="col-lg-4"> </div>
     </div>
    </div>
</body>
</html> 