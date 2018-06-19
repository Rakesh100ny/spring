<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %>
<%@ include file="custps.jsp" %>
<%
Date dot=new Date(new java.util.Date().getTime());

String act=request.getParameter("act");;
String uid=request.getParameter("uid");
String tactid=request.getParameter("tactid");
String cpas=request.getParameter("cpas");
String amt2=request.getParameter("amt1");
int tnid=Integer.parseInt(request.getParameter("tnid"));
Double bal=Double.parseDouble(request.getParameter("bal"));

System.out.printf("\nuid : "+uid);
System.out.printf("\ntactid : "+tactid);
System.out.printf("\nact : "+act);
System.out.printf("\ncpas : "+cpas);
System.out.printf("\namt2 : "+amt2);
System.out.printf("\nbal : "+bal);
System.out.printf("\ntnid1 : "+tnid);

		System.out.printf("\n\nTransfer from-act : "+act);
		System.out.printf("\n\nTransfer to-tactid : "+tactid);

		
if(tactid.equals(act))
{
	%>
		<html>
				<head>
				<meta charset="utf-8">
			    <meta name=viewport content="device-width,initial-scale=1">
				<link rel=stylesheet href="bs/css/bootstrap.min.css">
				<link rel="stylesheet" href="bs/css/animate.css">
				
				 <style>
			   	  .mgn-top{margin-top:100px;}
			   	  </style>

					</head>
					<body style="background: url(image/back_background.jpg) no-repeat center center fixed;background-size: cover;">

				    <div class="row">
					 <div class="container mgn-top">
					   <h3><font class="Text-danger ">[ Transaction Account & Your Account Are Same ] </font></h3>
					   </div>
					</div>
					<div class="row">
					     <div class="container">
					      <div class="col-lg-6 text-center animated fadeInLeft">
					       <div  style="background-color:#665851; margin: 0px auto; border-radius:5px 5px 0 0;"><br>
				           <font color="#FFFFFF" size="+2">POP Money</font>
				            
					        </div>

					      <form action="baltran.jsp" method="get" class="role">
				
					       <table class="table table-condensed ">
						<tr>
					         <td>Transaction Id </td>
					         <td><input type="text" class="form-control btn-block" readonly="true" name="tnid" value=<%=trnid %>></td>
					        </tr>						        					        
						<tr>
					         <td>Transfer From Account</td>
					         <td><input type="text" class="form-control btn-block" placeholder="Account Id" name="tactid"></td>
					        </tr>       
					        <tr>
					         <td> Enter Amount </td>
					         <td><input type="text" class="form-control" name="amt1"></td>
					        </tr>       
					       </table>
						   <input type=hidden name=uid value=<%=uid %>></input>
						<input type=hidden name=cpas value=<%=cpas %>></input>
						<input type="hidden" name=bal value=<%=bal %>></input>
						<input type="hidden" name=act value=<%=act %>></input>
						 <button class="btn btn-block btn-primary">Transfer</button>
					       </form>						
						
					<form action="cust.jsp">
					
					<input type=hidden name=cid value=<%=uid %>></input>
					<input type=hidden name=pas value=<%=cpas %>></input>						

	
					      
					 <button class="btn btn-block btn-danger">Go Back</button></a>      
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
else
{
if(tactid!="" && amt2!="")
{
	try
	{
	getCustAct.setString(1,tactid);
	ResultSet rs1=getCustAct.executeQuery();
	
	if(rs1.next())
	{
		
		Double amt1=Double.parseDouble(amt2);
		if(amt1<=bal)
		{
			try
			{
				bal=bal-amt1;
				System.out.printf("\nbal : "+bal);
				
				setBal.setDouble(1,bal);
				setBal.setInt(2,Integer.parseInt(act));
				setBal.executeUpdate();
		
				getCustAct.setInt(1, Integer.parseInt(tactid));
				ResultSet rs2=getCustAct.executeQuery();
				rs2.next();
				Double bal1=rs2.getDouble("balance");
				bal1=bal1+amt1;
				setBal.setDouble(1,bal1);
				setBal.setInt(2,Integer.parseInt(tactid));
				setBal.executeUpdate();
				
				insTran.setInt(1,tnid);
				insTran.setString(2,act);
				insTran.setInt(3,1004);
				insTran.setString(4,"DR");
				insTran.setDate(5,dot);
				insTran.setDouble(6,amt1);
				insTran.setString(7,"success");
				insTran.executeUpdate();
		
				tnid=tnid+1;
				
				insTran.setInt(1,tnid);
				insTran.setString(2,tactid);
				insTran.setInt(3,1004);
				insTran.setString(4,"CR");
				insTran.setDate(5,dot);
				insTran.setDouble(6,amt1);
				insTran.setString(7,"success");
				insTran.executeUpdate();
%>	

<html>
		   <head>
		   <meta charset="utf-8">
		   <meta name=viewport content="device-width,initial-scale=1">
		   <link rel=stylesheet href="bs/css/bootstrap.min.css">
		  </head>
			  <body style="background: url(image/bg.jpg) no-repeat center center fixed;background-size: cover;">
			   <div class="row">
			    <div class="container">
			     <div class="col-lg-12 text-center">
			      <h1><font class="text-success"><i class="glyphicon glyphicon-ok"></i>&nbsp;Your Transaction is Successfull..!</h1>
			      <h2><font class="text-danger"> Your Available Balance : <%=bal %></h2>
			      <form action="cust.jsp">
	<input type=hidden name=cid value=<%=uid %>></input>
	<input type=hidden name=pas value=<%=cpas %>></input>
				<button class="btn  btn-danger">Go Home</button></a>
					</form>
			     </div>
			    </div>
			   </div>
	
			  </body>
			 </html>

		<% 
			}
			catch(SQLException e)
			{
				System.out.println("\nSQL Alert[baltran1.jsp]...."+e.getMessage()+"\n");
			}
		}
		else
		{	
%>
<html>
				<head>
				<meta charset="utf-8">
			    <meta name=viewport content="device-width,initial-scale=1">
				<link rel=stylesheet href="bs/css/bootstrap.min.css">
				<link rel="stylesheet" href="bs/css/animate.css">
				
				 <style>
			   	  .mgn-top{margin-top:100px;}
			   	  </style>

					</head>
					<body style="background: url(image/back_background.jpg) no-repeat center center fixed;background-size: cover;">

				    <div class="row">
					 <div class="container mgn-top">
					   <h3><font class="Text-danger ">[ Insufficient Balance for Transfer ] </font></h3>
					   </div>
					</div>
					<div class="row">
					     <div class="container">
					      <div class="col-lg-6 text-center animated fadeInLeft">
					       <div  style="background-color:#665851; margin: 0px auto; border-radius:5px 5px 0 0;"><br>
				           <font color="#FFFFFF" size="+2">POP Money</font>
				            
					        </div>

					      <form action="baltran.jsp" method="get" class="role">
				
					       <table class="table">
						<tr>
					         <td>Transaction Id </td>
					         <td><input type="text" class="form-control btn-block" readonly="true" name="tnid" value=<%=trnid %>></td>
					        </tr>       
						        					        
						<tr>
					         <td>Transfer From Account</td>
					         <td><input type="text" class="form-control btn-block" placeholder="Account Id" name="tactid"></td>
					        </tr>       
					        <tr>
					         <td> Enter Amount </td>
					         <td><input type="text" class="form-control" name="amt1"></td>
					        </tr>       
					       </table>
						   <input type=hidden name=uid value=<%=uid %>></input>
						<input type=hidden name=cpas value=<%=cpas %>></input>
						<input type="hidden" name=bal value=<%=bal %>></input>
						<input type="hidden" name=act value=<%=act %>></input>
						 <button class="btn btn-block btn-primary">Transfer</button>
					       </form>						
						
					<form action="cust.jsp">
					
					<input type=hidden name=cid value=<%=uid %>></input>
					<input type=hidden name=pas value=<%=cpas %>></input>						

	
					      
					 <button class="btn btn-block btn-danger">Go Back</button></a>      
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
		
	}
	else
	{
		%>
<html>
				<head>
				<meta charset="utf-8">
			    <meta name=viewport content="device-width,initial-scale=1">
				<link rel=stylesheet href="bs/css/bootstrap.min.css">
				<link rel="stylesheet" href="bs/css/animate.css">
				
				 <style>
			   	  .mgn-top{margin-top:100px;}
			   	  </style>

					</head>
					<body style="background: url(image/back_background.jpg) no-repeat center center fixed;background-size: cover;">

				    <div class="row">
					 <div class="container mgn-top">
					   <h3><font class="Text-danger ">[ Invalid Account Id - <%=tactid %> ] </font></h3>
					   </div>
					</div>
					<div class="row">
					     <div class="container">
					      <div class="col-lg-6 text-center animated fadeInLeft">
					       <div  style="background-color:#665851; margin: 0px auto; border-radius:5px 5px 0 0;"><br>
				           <font color="#FFFFFF" size="+2">POP Money</font>
				            
					        </div>

					      <form action="baltran.jsp" method="get" class="role">
				
					       <table class="table">
						<tr>
					         <td>Transaction Id </td>
					         <td><input type="text" class="form-control btn-block" readonly="true" name="tnid" value=<%=trnid %>></td>
					        </tr>       
						        					        
						<tr>
					         <td>Transfer From Account</td>
					         <td><input type="text" class="form-control btn-block" placeholder="Account Id" name="tactid"></td>
					        </tr>       
					        <tr>
					         <td> Enter Amount </td>
					         <td><input type="text" class="form-control" name="amt1"></td>
					        </tr>       
					       </table>
						   <input type=hidden name=uid value=<%=uid %>></input>
						<input type=hidden name=cpas value=<%=cpas %>></input>
						<input type="hidden" name=bal value=<%=bal %>></input>
						<input type="hidden" name=act value=<%=act %>></input>
						 <button class="btn btn-block btn-primary">Transfer</button>
					       </form>						
						
					<form action="cust.jsp">
					
					<input type=hidden name=cid value=<%=uid %>></input>
					<input type=hidden name=pas value=<%=cpas %>></input>						

	
					      
					 <button class="btn btn-block btn-danger">Go Back</button></a>      
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
	}
	catch(SQLException e)
	{
		System.out.println("\nSQL Alert[baltran2.jsp]...."+e.getMessage()+"\n");
	}
}
else
{
	%>
		<html>
				<head>
				<meta charset="utf-8">
			    <meta name=viewport content="device-width,initial-scale=1">
				<link rel=stylesheet href="bs/css/bootstrap.min.css">
				<link rel="stylesheet" href="bs/css/animate.css">
				
				 <style>
			   	  .mgn-top{margin-top:100px;}
			   	  </style>

					</head>
					<body style="background: url(image/back_background.jpg) no-repeat center center fixed;background-size: cover;">

				    <div class="row">
					 <div class="container mgn-top">
					   <h3><font class="Text-danger ">[ All Fields Are Compulsory - Blank Field is Not Allowed ] </font></h3>
					   </div>
					</div>
					<div class="row">
					     <div class="container">
					      <div class="col-lg-6 text-center animated fadeInLeft">
					       <div  style="background-color:#665851; margin: 0px auto; border-radius:5px 5px 0 0;"><br>
				           <font color="#FFFFFF" size="+2">POP Money</font>
				            
					        </div>

					      <form action="baltran.jsp" method="get" class="role">
				
					       <table class="table">
						<tr>
					         <td>Transaction Id </td>
					         <td><input type="text" class="form-control btn-block" readonly="true" name="tnid" value=<%=trnid %>></td>
					        </tr>       
						        					        
						<tr>
					         <td>Transfer From Account</td>
					         <td><input type="text" class="form-control btn-block" placeholder="Account Id" name="tactid"></td>
					        </tr>       
					        <tr>
					         <td> Enter Amount </td>
					         <td><input type="text" class="form-control" name="amt1"></td>
					        </tr>       
					       </table>
						   <input type=hidden name=uid value=<%=uid %>></input>
						<input type=hidden name=cpas value=<%=cpas %>></input>
						<input type="hidden" name=bal value=<%=bal %>></input>
						<input type="hidden" name=act value=<%=act %>></input>
						 <button class="btn btn-block btn-primary">Transfer</button>
					       </form>						
						
					<form action="cust.jsp">
					
					<input type=hidden name=cid value=<%=uid %>></input>
					<input type=hidden name=pas value=<%=cpas %>></input>						

	
					      
					 <button class="btn btn-block btn-danger">Go Back</button></a>      
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
}
%>