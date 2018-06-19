<%@ include file="adminps.jsp" %>
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
String aid,apas;
aid=request.getParameter("aid");
apas=request.getParameter("apas");

System.out.printf("\naid: %s",aid);
System.out.printf("\napas : %s",apas);

%>
	<div class="row">
		<div class="container">
			<div class="col-lg-12 text-center">
				<h1><font>www.M-Banking.com</font></h1>
			</div>
		</div>
	</div>
    <div class="row">
  <form action="MakeTrans2.jsp">
     <div class="container">
      <div class="col-lg-3"> </div>
      <div class="col-lg-6 text-center"><h3><font>Transaction </font></h3>       
       <table class="table">
        <tr>
         <td><font>Transaction Id </td>
         <td><input type="text" class="form-control" readonly="true" name="trnid" value=<%=trnid %>></td>
        </tr>       
        <tr>
         <td><font>Account Id </td>
         <td><input type="number" class="form-control" name="cactid" ></td>
        </tr>
        <tr>
         <td><font>Teller Id </td>
         <td><input type="text" class="form-control" readonly="true" name="telid" value=1001 ></td>
        </tr>       
        <tr>
         <td><font>Type </td>
         <td><input type="radio" name="typ" value="CR" checked="true">CR
          <input type="radio" name="typ" value="DR">DR</td>
        </tr>       
        <tr>
         <td><font>Ammount </td>
         <td><input type="number" class="form-control" name="amt"></td>
        </tr>       
       </table>
 
        <input type=hidden name=aid value=<%=aid %>></input>
		<input type=hidden name=apas value=<%=apas %>></input>
       <button class="btn btn-block btn-primary mgnbtm">Submit</button>	
</form>
					<form action="admin.jsp">
					<input type=hidden name=aid value=<%=aid %>></input>
					<input type=hidden name=apas value=<%=apas %>></input>			
       				<button class="btn btn-block btn-danger"> Back</button>
       				</form>      
      </div>
      <div class="col-lg-3"> </div>
     </div>
    </div>
</body>
</html>