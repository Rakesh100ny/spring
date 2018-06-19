<%@ page import="java.sql.*" %>
<%@ include file="custps.jsp" %>

<%
		String cid,pas,frm,to,actt;
		cid=request.getParameter("uid");
		actt=request.getParameter("act");
		pas=request.getParameter("cpas");
		System.out.printf("\npas : %s",pas);
		System.out.printf("\ncid : %s",cid);
		frm=request.getParameter("frm");
    	to=request.getParameter("to");
    	System.out.printf("\nfrm : %s",frm);
		System.out.printf("\nto : %s",to);
		
    	if(frm!="" && to!="")
        {
    		System.out.printf("\nVikas");

    		try
    		{
        		System.out.printf("\nVikas1");
				getTrans.setString(1,actt);
				getTrans.setString(2,frm);
				getTrans.setString(3,to);
				
				ResultSet rs1=getTrans.executeQuery();
				
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
		      <div class="col-lg-1"> </div>
		      <div class="col-lg-10 text-center"><h2><font color="#FF9900">Transaction Status</font></h2>

		       <table class="table table-striped">
		        <tr>
		         <th class="text-center">Transaction Id</th>
		         <th class="text-center">Account Id</th>
		         <th class="text-center">Teller Id</th>
		         <th class="text-center">Type</th>
		         <th class="text-center">DOB</th>
		         <th class="text-center">Amount</th>
		         <th class="text-center">Status</th>
		        </tr>
		        
		        <%
				
				while(rs1.next())
				{
		    		System.out.printf("\nVikas2");
					int tnid=rs1.getInt("trnid");
					String act=rs1.getString("actid");
					String telllid=rs1.getString("tellerid");
	                String tt=rs1.getString("type");
	                String dt=rs1.getString("dot");
				    int amt=rs1.getInt("amt");
					String status=rs1.getString("status");
					%>
					<tr>
		            <td class="text-center"><font color="#000"> <%=tnid%>  </font>  </td>
		    	    <td class="text-center"><font color="#000"> <%=act%>  </font>  </td>
				    <td class="text-center"><font color="#000"> <%=telllid%>    </font>  </td>
				    <td class="text-center"><font color="#000"> <%=tt%>     </font>  </td>
				    <td class="text-center"><font color="#000"> <%=dt%>     </font>  </td>
				    <td class="text-center"><font color="#000"> <%=amt%>    </font>  </td>
				    <td class="text-center"><font color="#000"> <%=status%> </font>  </td>    
                  </tr>
                  <%
				}
        %>
        </table>
					
					<a href="cust.jsp?cid=<%=cid%>&pas=<%=pas%>"><button type=submit class="btn btn-primary"><i class="glyphicon glyphicon-Home"></i>&nbsp;&nbsp;GO Home</button></a>
                    </div>
					<div class="col-lg-1 text-center"></div>
					</div>
					</div>
					</body>
					</html>
				
        <%

    		}
    		catch(SQLException e)
    		{
    			System.err.println("SQL Alert[1st loop] - "+e.getMessage());
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
		    						<h3><font class="Text-danger">[ All Fields Are Compulsory - Blank Field is Not Allowed ]</font></h3>

								</div>
							</div>
								<div class="row">
								     <div class="container">
								      <div class="col-lg-6 text-center animated fadeInLeft">
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
									   <input type=hidden name=uid value=<%=cid %>></input>
									<input type=hidden name=cpas value=<%=pas %>></input>
											<input type=hidden name=act value=<%=actt %>></input>
									 <button class="btn btn-block btn-primary">Txn Status</button>
								       </form>						
									
								<form action="cust.jsp">
								
								<input type=hidden name=cid value=<%=cid %>></input>
								<input type=hidden name=pas value=<%=pas %>></input>						

				
								      
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
        %>