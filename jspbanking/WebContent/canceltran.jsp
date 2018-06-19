<%@page import="java.sql.Date"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ include file="tellerps.jsp"%>
<%@ page import="java.lang.String.*" %>
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
String pas=request.getParameter("pas");
String datefrom=request.getParameter("datefrom");
String dateto=request.getParameter("dateto");
String act=request.getParameter("actid");

System.out.printf("\ndatefrom : "+datefrom);
System.out.printf("\ndateto : "+dateto);
System.out.printf("\nact : "+act);

String msg="";
int flag=0;
if(datefrom!="" && dateto!="" && act=="")
{	
try
{
	getTrans.setString(1,tid);
	getTrans.setString(2,request.getParameter("datefrom"));
	getTrans.setString(3,request.getParameter("dateto"));
	ResultSet rs=getTrans.executeQuery();
	
	
	%>
	<div class="row">
		<div class="container">
	<form action=delTran.jsp>
				<div class="col-lg-12 text-center">
				<h1><font>www.M-Banking.com</font></h1>
			</div>
		</div>
	</div>
    <div class="row">
     <div class="container">
      <div class="col-lg-1"> </div>
      <div class="col-lg-10 text-center"><h3><font>Delete Transaction </font></h3> 
       <table class="table table-striped">
        <tr>
         <th>Select</th>
         <th>Transaction Id</th>
         <th>Account Id</th>
         <th>Teller Id</th>
         <th>Type</th>
         <th>DOB</th>
         <th>Amount</th>
         <th>Status</th>
        </tr>

	<%
	while(rs.next())
	{
		int trnid=rs.getInt("trnid");
		int acid=rs.getInt("actid");
		double amt=rs.getDouble("amt");
		String status=rs.getString("status");
		String dt=rs.getString("dot");
		String tt=rs.getString("type");
		String teid=rs.getString("tellerid");
		
		%>
        <tr>
         <td><input type=checkbox name=<%=trnid %> value=<%= trnid%>></td>
         <td><%=trnid %></td>
         <td><%=acid %></td>
         <td><%=teid %></td>
         <td><%=tt %></td>
         <td><%=dt %></td>
         <td><%=amt %></td>
         <td><%=status%></td>
        </tr>  
		<% 
	}
	%>
	     
       </table>
       <button class="btn btn-danger mgnbtm" > Delete Selected Transaction(s)</button>      
    	<input type=hidden name=tid value=<%=tid %>></input>
	<input type=hidden name=pas value=<%=pas %>></input>
	</form>
	<form action="teller.jsp">
	<input type=hidden name=tid value=<%=tid %>></input>
	<input type=hidden name=pas value=<%=pas %>></input>
       <button class="btn btn-primary"> Go Back</button>      
		</form>
      </div>
      <div class="col-lg-1"> </div>
     </div>
    </div>

	<% 
	
	
}
catch(SQLException e)
{
	System.err.println("\nsql alert[canceltran.jsp] - "+e.getMessage());
}
}
else
if(datefrom!="" && dateto!="" && act!="")
{
try
{
	getCust.setString(1,act);
	ResultSet rsa=getCust.executeQuery();
	if(rsa.next())
	{	
	getTran.setString(1,act);
	getTran.setString(2,request.getParameter("datefrom"));
	getTran.setString(3,request.getParameter("dateto"));
	ResultSet rs=getTran.executeQuery();
	
	%>
	<div class="row">
		<div class="container">
	<form action=delTran.jsp>
				<div class="col-lg-12 text-center">
				<h1><font>www.M-Banking.com</font></h1>
			</div>
		</div>
	</div>
    <div class="row">
     <div class="container">
      <div class="col-lg-1"> </div>
      <div class="col-lg-10 text-center"><h3><font>Delete Transaction </font></h3> 
       <table class="table table-striped">
        <tr>
         <th>Select</th>
         <th>Transaction Id</th>
         <th>Account Id</th>
         <th>Teller Id</th>
         <th>Type</th>
         <th>DOB</th>
         <th>Amount</th>
         <th>Status</th>
        </tr>       
	<%
	while(rs.next())
	{
		int trnid=rs.getInt("trnid");
		double amt=rs.getDouble("amt");
		int teid=rs.getInt("tellerid");
		String status=rs.getString("status");
		String dt=rs.getString("dot");
		String tt=rs.getString("type");
		String acid=rs.getString("actid");
		%>

        <tr>
         <td><input type=checkbox name=<%=trnid %> value=<%= trnid%>></td>
         <td><%=trnid %></td>
         <td><%=acid %></td>
         <td><%=teid %></td>
         <td><%=tt %></td>
         <td><%=dt %></td>
         <td><%=amt %></td>
         <td><%=status%></td>
        </tr>   
		<% 
	}
	%>    
       </table>
       <button class="btn btn-danger mgnbtm"> Delete Selected Transaction(s)</button>      
    	<input type=hidden name=tid value=<%=tid %>></input>
	<input type=hidden name=pas value=<%=pas %>></input>
	</form>
	<form action="teller.jsp">
	<input type=hidden name=tid value=<%=tid %>></input>
	<input type=hidden name=pas value=<%=pas %>></input>
       <button class="btn btn-primary"> Go Back</button>      
		</form>
      </div>
      <div class="col-lg-1"> </div>
     </div>
    </div>

	<%
	}
	else
	{
		msg="Account Id Invalid";
		flag=1;
	}
}
catch(SQLException e)
{
	System.err.println("\nsql alert[canceltran.jsp] - "+e.getMessage());
}
}
else
{
	msg="All Fields Are Compulsory";
	flag=1;
}

if(flag==1)
{
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
	<div class="container mgn-top">
		    <h3><font class="Text-danger "><%=msg %></font></h3>

	</div>
</div>
<div class="row">
		     <div class="container">
		      <div class="col-lg-6 text-center animated fadeInLeft">
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
	<input type=hidden name=pas value=<%=pas %>></input>
       <button class="btn btn-block btn-primary">Submit</button>
	</form>
	<form action="teller.jsp">
	<input type=hidden name=tid value=<%=tid %>></input>
	<input type=hidden name=pas value=<%=pas %>></input>
       <button class="btn btn-block btn-danger"> Back</button>      
	</form>
     </div>
	        <div class="col-lg-3"> </div>
	        <div class="col-lg-3"> </div>
	       </div>
	      </div>
	  </body>
	  </html>
	<%	
}
%>
