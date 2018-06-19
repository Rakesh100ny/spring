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
String aid,apas,cactid,fnam,lnam;
aid=request.getParameter("aid");
apas=request.getParameter("apas");
cactid=request.getParameter("cactid");

System.out.printf("\naid: %s",aid);
System.out.printf("\napas : %s",apas);
System.out.printf("\ncactid : %s",cactid);


if(cactid!="")
{
	try
	{
		selCust.setString(1,cactid);
		ResultSet rs2=selCust.executeQuery();
		
		if(rs2.next())
		{
			fnam=rs2.getString("fname");
			lnam=rs2.getString("lname");

%>
	<form action="delCustAct3.jsp">
       <div class="row">
<div class="container">
<div class="col-lg-12 text-center">
	<h1 class="text-primary"><font>www.M-Banking.com</font></h1>
    <h2 class="text-info">Customer Account Deletion</font></h2>
    <h2 class="text-danger"><font>Confirm Your Details </font></h2>
  
</div>
</div>
</div>
<div class="row">
<div class="container">
  <div class="col-lg-3  "></div>
<div class="col-lg-6 text-center form-group">
<table class="table">
<tr>
<td>Account Id </td>
<td><%=cactid%></td>
</tr>       
<tr>
<td>First Name </td>
<td><%=fnam%></td>
</tr>
<tr>
<td>Last Name </td>
<td><%=lnam%></td>
</tr>
</table>
</div>
<div class="col-lg-3"> </div>
</div>
</div>

<div class="row">
   <div class="container">
     <div class="col-lg-3  "></div>
     <div class="col-lg-6 text-center ">

<button class="btn btn-block btn-primary mgnbtm text-danger">Confirm Delete Account</button>
<input type="hidden" name=cactid value=<%=cactid %>></input>
<input type="hidden" name=aid value=<%=aid %>></input>
<input type="hidden" name=apas value=<%=apas %>></input>
</form>

<form action="delCustAct1.jsp">
<input type="hidden" name="aid" value="<%=aid %>"></input>
<input type="hidden" name="apas" value="<%=apas %>"></input>
<button  name="back" class="btn btn-block btn-danger"> Go Back</button>      
</form>
       </div>
      <div class="col-lg-3"> </div>
   </div>
</div>
<%
		}
		else
		{
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
      <div class="col-lg-4 text-center">
      <h3><font>Customer Account Deletion </font></h3>
      <h4><font class="text-danger">[ Customer Does not Exist ] </font></h4>
       <table class="table">
        <tr>
         <td><font class="text-danger">Account Id </td>
         <td><input type="number" name="cactid" class="form-control"></input></td>
        </tr>       
</table>
<button class="btn btn-block btn-primary mgnbtm" name="del" value="Delete">Delete Teller</button>
<input type="hidden" name="aid" value=<%=aid %>></input>
<input type="hidden" name="apas" value=<%=apas %>></input>
<input type="hidden" name="cactid" value=<%=cactid %>></input>
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

	<% 
		}
	}
	catch(SQLException e)
	{
		System.err.println("\nSQL Alert[delCustAct2.jsp]..."+e.getMessage()+"\n");
	}	
}
else
{
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
<div class="col-lg-4 text-center">
<h3><font>Customer Account Deletion </font></h3>
<h4><font class="text-danger">[ Customer Does not Exist ] </font></h4>
<table class="table">
<tr>
 <td><font class="text-danger">Account Id </td>
 <td><input type="number" name="cactid" class="form-control"></input></td>
</tr>       
</table>
<button class="btn btn-block btn-primary mgnbtm" name="del" value="Delete">Delete Customer</button>
<input type="hidden" name="aid" value=<%=aid %>></input>
<input type="hidden" name="apas" value=<%=apas %>></input>
<input type="hidden" name="cactid" value=<%=cactid %>></input>
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

<%
	}
%>

</body>
</html>		