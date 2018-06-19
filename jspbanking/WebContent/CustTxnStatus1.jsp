<%@ page import="java.sql.*" %>
<%@ include file="custps.jsp" %>

<%
		String uid,cpas,act="";
		uid=request.getParameter("uid");
		cpas=request.getParameter("cpas");
		System.out.printf("\ncpas : %s",cpas);
		System.out.printf("\nuid : %s",uid);
		try
		{
			getCust.setString(1,uid);
			ResultSet rs1=getCust.executeQuery();
			
			if(rs1.next())
			{
				act=rs1.getString("actid");
			}
		}
		catch(SQLException e)
		{
			System.err.println("SQL Alert[1st loop] - "+e.getMessage());
		}
	
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
								     <div class="container">
								      <div class="col-lg-6 text-center mgn-top animated fadeInLeft">
								       <div  style="background-color:#665851; margin: 0px auto; border-radius:5px 5px 0 0;"><br>
							           <font color="#FFFFFF" size="+2">TXN STATUS</font>
								        </div>

								      <form action="CustTxnStatus2.jsp" method="get" class="role">
							
								       <table class="table">
									<tr>
								         <td>Date From </td>
								         <td><input type="date" class="form-control btn-block" name="frm" ></td>
								        </tr>       
									        					        
									<tr>
								         <td>To</td>
								         <td><input type="date" class="form-control btn-block"  name="to"></td>
								        </tr>
								       </table>
									   <input type=hidden name=uid value=<%=uid %>></input>
									<input type=hidden name=cpas value=<%=cpas %>></input>
											<input type=hidden name=act value=<%=act %>></input>
									 <button class="btn btn-block btn-primary">Txn Status</button>
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
			     
