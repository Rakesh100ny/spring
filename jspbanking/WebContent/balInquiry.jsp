<%@ page import="java.sql.*" %>
<%@ include file="custps.jsp" %>

<% 
String uid,cpas;
		uid=request.getParameter("uid");
		cpas=request.getParameter("cpas");
		System.out.printf("\ncpas : %s",cpas);
		System.out.printf("\nuid : %s",uid);
					try
			{
				getCust.setString(1,uid);
				ResultSet rs1=getCust.executeQuery();
				rs1.next();
				int bal=rs1.getInt("balance");		
				String actid=rs1.getString("actid");
%>
<html>
						<head>
						<meta charset="utf-8">
					    <meta name=viewport content="device-width,initial-scale=1">
						<link rel=stylesheet href="bs/css/bootstrap.min.css">
						<link rel="stylesheet" href="bs/css/animate.css">
						 <style>
				   	  .mgn-top{margin-top:85px;}
				   	  .mgn-btm
				   	  {
				   	  	margin-bottom:5px;
				   	  }
				   	  </style>
					</head>
					<body style="background: url(image/Cool-Background-High-Resolution.jpg) no-repeat center center fixed;background-size: cover;">
						<form action="downloadab.jsp">
					    <div class="row">
					     <div class="container">
					      <div class="col-lg-2"> </div>
					      <div class="col-lg-8 text-center mgn-top animated fadeInLeft">
					       <div class="text-center" style="background-color:#665851; margin: 0px auto; border-radius:5px 5px 0 0;"><br>
				           <font color="#FFFFFF" size="+2">Balance Inquiry </font>
					        </div>
					 	    
					        <div style="background-color:#FFF" class="well">
						    
					       <table>
					        <tr>
					         <td><h1><font class="text-danger">Your Current Balance   </font></h1> </td>
					         <td><h1><font color="#000000">  &nbsp;&nbsp;Rs.  <%=bal %> </font></td>
					        </tr>       
					       </table>
						<button class="btn btn-block btn-primary mgn-btm">Download Reciept</button>
						<input type=hidden name=uid value=<%=uid %>></input>
						<input type="hidden" name="actid" value=<%=actid %>></input>
						<input type=hidden name=bal value=<%=bal %>></input>
						</form>
						<form action="cust.jsp">
						<input type=hidden name=cid value=<%=uid %>></input>
						<input type=hidden name=pas value=<%=cpas %>></input>
						 <button class="btn btn-block btn-danger">Go Back</button> 
						</form>
	
					      </div>
					      </div>
					      <div class="col-lg-2"> </div>
					     </div>
					    </div>
					</body>
					</html>
		<%
			}
			catch(SQLException e)
			{
				System.out.println("\nSQL Alert[custMenu.jsp]...."+e.getMessage()+"\n");
			}
		%>
	