<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@ include file="custps.jsp" %>

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
HttpSession ssn=request.getSession(false);
if(ssn==null)
{
	ssn=request.getSession();
	System.out.println("Session is Created... [cashwd.jsp]");
}
else
{
	String uid,cpas,amt1,trnid;
	uid=request.getParameter("uid");
	cpas=request.getParameter("cpas");
	amt1=request.getParameter("amt");
	trnid=request.getParameter("trnid");
	System.out.printf("\nuid : %s",uid);
	System.out.printf("\ncpas : %s",cpas);
int amt=Integer.parseInt(amt1);
	if(amt>=0)
	{
		
		Date dot=new Date(new java.util.Date().getTime());
	try
	{
		getCust.setString(1,uid);
		ResultSet rs2=getCust.executeQuery();
		rs2.next();
		int bal=rs2.getInt("balance");
		String actid=rs2.getString("actid");
		
		if(amt<=bal)
		{
		
		insTran.setInt(1,Integer.parseInt(trnid));
		insTran.setInt(2,Integer.parseInt(actid));
		insTran.setInt(3,1004);
		insTran.setString(4,"DR");
		insTran.setDate(5,dot);
		insTran.setInt(6,amt);
		
		if(bal>=amt)
		{
			bal=bal-amt;
			insTran.setString(7,"Success");
			setBal.setInt(1,bal);
			setBal.setInt(2,Integer.parseInt(actid));
			setBal.executeUpdate();
		}
		else
		{
			insTran.setString(7,"Failed");
		}
		
		insTran.executeUpdate();
%>
 
	<form action="download.jsp">
  <div class="row">
   <div class="container">
    <div class="col-lg-12 text-center">
     <h1><font class="text-success">
     	<i class="glyphicon glyphicon-ok"></i>&nbsp;Your Transaction is Successfull..!</h1>
     <h2><font class="text-danger"> Thank You For Banking With Us.</h2>
     <button name="submit" class="btn  btn-primary mgnbtm"><i class="glyphicon glyphicon-download-alt"></i>&nbsp;Download Receipt</button>
    <input type="hidden" name="actid" value=<%=actid %>>
	<input type="hidden" name="cpas" value=<%=cpas %>>
	<input type="hidden" name="dot" value=<%=dot %>>
	<input type="hidden" name="amt" value=<%=amt %>>
	<input type="hidden" name="bal" value=<%=bal %>>
   </form>

     <form action="custlogin.html">
     <button class="btn  btn-danger" name="submit">Go Home</button>
     </form>
    </div>
   </div>
  </div>

<% 		
		}
		else
		{
			%>
			<br>
		<Font face="lucida console" size=12	 color=Yellow>	Transaction Failed</Font><br><br>
		<Font face="lucida console" size=12 color=red> 	Unsufficent Balance</Font>
		<br>
	<form action="cust.jsp">
	<input type=hidden name=cid value=<%=uid %>></input>
	<input type=hidden name=pas value=<%=cpas %>></input>
	<input type=submit name=back value=GoBack class=div2></input>
		</form>
		
			<% 
		}
	}
	catch(SQLException e)
	{
		System.out.println("\nSQL Alert[cashwd.jsp]...."+e.getMessage()+"\n");
	}
	}
	else
	{
		%>
	<div class="row">
		<div class="container">
			<div class="col-lg-12 text-center">
				<h1><font>www.E-Banking.com</font></h1>
				<h3 class="text-danger">Invalid Ammount</font></h3>
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
         <td><input type="number" class="form-control" name="amt"></td>
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
    <button name="back" class="btn btn-block btn-danger mgntop">Go Back</button> 
    </form>
      </div>
      <div class="col-lg-4"> </div>
     </div>
    </div>
		<%
	}
}

%>
 </body>
</html>