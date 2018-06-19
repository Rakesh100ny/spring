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
		<form action="delCustAct2.jsp">
	<div class="row">
		<div class="container">
			<div class="col-lg-12 text-center">
				<h1><font>www.M-Banking.com</font></h1>
			</div>
		</div>
	</div>
    <div class="row">
     <div class="container">
      <div class="col-lg-4"> </div>
      <div class="col-lg-4 text-center"><h3><font>Customer Account Deletion </font></h3> 
       <table class="table">
        <tr>
         <td><font class="text-danger">Account Id </td>
         <td><input type="number" name="cactid" class="form-control"></input></td>
        </tr>       
</table>
<button class="btn btn-block btn-primary mgnbtm" name="del" value="Delete">Delete Account</button>
<input type="hidden" name="aid" value=<%=aid %>></input>
<input type="hidden" name="apas" value=<%=apas %>></input>
</form>
	<form action="admin.jsp">
		<input type=hidden name=aid value=<%=aid %>></input>
		<input type=hidden name=apas value=<%=apas %>></input>
		<button class="btn btn-block btn-danger" name=back value=GoBack>Go Back</button>      			
	</form>
 </div>
      <div class="col-lg-4"> </div>
     </div>
    </div>
</body>
</html>
