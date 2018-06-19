<%@page import="java.sql.Date"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ include file="adminps.jsp"%>
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
String aid=request.getParameter("aid");
String apas=request.getParameter("apas");
String tid=request.getParameter("tid");
String datefrom=request.getParameter("datefrom");
String dateto=request.getParameter("dateto");
String act=request.getParameter("act");

System.out.printf("\ndatefrom : "+datefrom);
System.out.printf("\ndateto : "+dateto);
System.out.printf("\nact : "+act);
System.out.printf("\nCancelTrans2-telid : "+telid);

String msg="";
int flag=0;
if(datefrom!="" && dateto!="" && act=="" && tid=="")
{	

System.out.printf("\n\nCancelTrans2--Vikas soni baberwal \n\n");
try
{
	getTrans.setInt(1,1001);   
	getTrans.setString(2,request.getParameter("datefrom"));
	getTrans.setString(3,request.getParameter("dateto"));
	ResultSet rs=getTrans.executeQuery();
	
	
	%>
	<div class="row">
		<div class="container">
	<form action=CancelTrans3.jsp>
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
		System.out.printf("\n\nCancelTrans2--Vikas soni baberwal 22 \n\n");
	
		int tnid=rs.getInt("trnid");
		int acid=rs.getInt("actid");
		int teid=rs.getInt("tellerid");
		double amt=rs.getDouble("amt");
		String status=rs.getString("status");
		String dt=rs.getString("dot");
		String tt=rs.getString("type");
		
		%>
        <tr>
         <td><input type=checkbox name=<%=tnid %> value=<%= tnid%>></td>
         <td><%=tnid %></td>
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
    	<input type=hidden name=aid value=<%=aid %>></input>
	<input type=hidden name=apas value=<%=apas %>></input>
	</form>
	<form action="CancelTrans1.jsp">
	<input type=hidden name=aid value=<%=aid %>></input>
	<input type=hidden name=apas value=<%=apas %>></input>
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
if(datefrom!="" && dateto!="" && act!="" && tid=="")
{
try
{
	getCust.setString(1,act);
	ResultSet rsa=getCust.executeQuery();
	if(rsa.next())
	{	
		System.out.printf("\n\nCancelTrans2--Vikas soni baberwal 11 \n\n");
		
	getTran.setString(1,act);
	getTran.setString(2,request.getParameter("datefrom"));
	getTran.setString(3,request.getParameter("dateto"));
	ResultSet rs=getTran.executeQuery();
	
	%>
	<div class="row">
		<div class="container">
	<form action=CancelTrans3.jsp>
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
		int tnid=rs.getInt("trnid");
		double amt=rs.getDouble("amt");
		int tellid=rs.getInt("tellerid");
		String status=rs.getString("status");
		String dt=rs.getString("dot");
		String tt=rs.getString("type");
		%>

        <tr>
         <td><input type=checkbox name=<%=tnid %> value=<%= tnid%>></td>
         <td><%=tnid %></td>
         <td><%=act %></td>
         <td><%=tellid %></td>
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
    	<input type=hidden name=aid value=<%=aid %>></input>
	<input type=hidden name=apas value=<%=apas %>></input>
	</form>
	<form action="CancelTrans1.jsp">
	<input type=hidden name=aid value=<%=aid %>></input>
	<input type=hidden name=apas value=<%=apas %>></input>
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
if(datefrom!="" && dateto!="" && tid!="" && act=="")
{
try
{
	selTell.setString(1,tid);
	ResultSet rsa=selTell.executeQuery();
	if(rsa.next())
	{	
		System.out.printf("\n\nCancelTrans2--Vikas soni baberwal 44 \n\n");
		
	getTrans.setString(1,tid);
	getTrans.setString(2,request.getParameter("datefrom"));
	getTrans.setString(3,request.getParameter("dateto"));
	ResultSet rs=getTrans.executeQuery();
	
	%>
	<div class="row">
		<div class="container">
	<form action=CancelTrans3.jsp>
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
		int tnid=rs.getInt("trnid");
		double amt=rs.getDouble("amt");
		String atid=rs.getString("actid");
		String status=rs.getString("status");
		String dt=rs.getString("dot");
		String tt=rs.getString("type");
		%>

        <tr>
         <td><input type=checkbox name=<%=tnid %> value=<%= tnid%>></td>
         <td><%=tnid %></td>
         <td><%=atid %></td>
         <td><%=tid %></td>
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
    	<input type=hidden name=aid value=<%=aid %>></input>
	<input type=hidden name=apas value=<%=apas %>></input>
	</form>
	<form action="CancelTrans1.jsp">
	<input type=hidden name=aid value=<%=aid %>></input>
	<input type=hidden name=apas value=<%=apas %>></input>
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
		msg="Teller Id Invalid";
		flag=1;
	}
}
catch(SQLException e)
{
	System.err.println("\nsql alert[canceltran.jsp] - "+e.getMessage());
}
}
else
if(datefrom!="" && dateto!="" && tid!="" && act!="")
{
try
{
	selTell.setString(1,tid);
	ResultSet rsa=selTell.executeQuery();
	
	getCust.setString(1,act);
	ResultSet rsb=getCust.executeQuery();
	
	if(rsa.next() && rsb.next())
	{	
		System.out.printf("\n\nCancelTrans2--Vikas soni baberwal 44 \n\n");
		
	getTranss.setString(1,tid);
	getTranss.setString(2,act);
	getTranss.setString(3,request.getParameter("datefrom"));
	getTranss.setString(4,request.getParameter("dateto"));
	ResultSet rs=getTranss.executeQuery();
	
	%>
	<div class="row">
		<div class="container">
	<form action=CancelTrans3.jsp>
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
		System.out.printf("\n\nCancelTrans2--Vikas soni baberwal 32131 \n\n");
		
		int tnid=rs.getInt("trnid");
		int teid=rs.getInt("tellerid");
		int acid=rs.getInt("actid");
		
		double amt=rs.getDouble("amt");
		String status=rs.getString("status");
		String dt=rs.getString("dot");
		String tt=rs.getString("type");
		%>

        <tr>
         <td><input type=checkbox name=<%=tnid %> value=<%= tnid%>></td>
         <td><%=tnid %></td>
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
    	<input type=hidden name=aid value=<%=aid %>></input>
	<input type=hidden name=apas value=<%=apas %>></input>
	</form>
	<form action="CancelTrans1.jsp">
	<input type=hidden name=aid value=<%=aid %>></input>
	<input type=hidden name=apas value=<%=apas %>></input>
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
		msg="Teller or Account Id Invalid ";
		flag=1;
	}
}
catch(SQLException e)
{
	System.err.println("\nsql alert[CancelTrans2.jsp] - "+e.getMessage());
}
}
else
{
	msg="* Fields Are Compulsory";
	flag=1;
}

if(flag==1)
{
	%>
<div class="row">
		<div class="container">
<form action="CancelTrans2.jsp">
      <div class="col-lg-4"> </div>
      <div class="col-lg-4 text-center"><h3><font>Cancel Transaction </font></h3>
      <div class="text-danger">[ <%=msg %> ] </div>
       <table class="table">
        <tr>
         <td><font>Teller Id </td>
         <td><input type="text" class="form-control" name="tid" value=<%=tid%>></td>
        </tr>
        <tr>
         <td><font>Account Id </td>
         <td><input type="text" class="form-control" name="act" value=<%=act %>></td>
        </tr>       
        <tr>
         <td><font>From *</td>
         <td><input type="date" class="form-control" placeholder="01/01/2017" name="datefrom" value=<%=datefrom %>></td>
        </tr>       
        <tr>
         <td><font>To *</td>
         <td><input type="date" class="form-control" name=dateto placeholder="05/01/2017"  value=<%=dateto %>></td>
        </tr>       
       </table>
<input type=hidden name=aid value=<%=aid %>></input>
	<input type=hidden name=apas value=<%=apas %>></input>
       <button class="btn btn-block btn-primary">Submit</button><br>
	</form>

	<form action="CancelTrans1.jsp">
	<input type=hidden name=aid value=<%=aid %>></input>
	<input type=hidden name=apas value=<%=apas %>></input>
       <button class="btn btn-block btn-danger"> Back</button>      
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
