<%@ page import="java.util.*"%>
<%@ include file="tellerps.jsp" %>

<%
String msg="";
String tid=request.getParameter("tid");
String pas=request.getParameter("pas");
String oldpas=request.getParameter("oldpas");
String newpas=request.getParameter("newpas");
String cnpas=request.getParameter("cnpas");
System.out.printf("\noldpas : "+oldpas);
System.out.printf("\nnewpas : "+newpas);
boolean ok1=true;
if(oldpas!="" && newpas!="" && cnpas!="")
{
		try
		{
			getPas.setInt(1,Integer.parseInt(tid));
			ResultSet rs=getPas.executeQuery();
			
			boolean ok=true;
			if(rs.next())
			{
				ok=rs.getString("passwd").equals(oldpas);
			}
			else
			{
				ok=false;
			}
			if(ok)
			{
				System.out.printf("\ncnpas1 : "+cnpas);
				System.out.printf("\nnewpas1 : "+newpas);

				if(newpas.equals(cnpas))
    			{

					System.out.printf("\ncnpas : "+cnpas);
					System.out.printf("\nnewpas : "+newpas);

    				if(!oldpas.equals(newpas))
    				{
    					ok1=true;
    					
				cngPas.setString(1,newpas);
				cngPas.setInt(2,Integer.parseInt(tid));
				System.out.printf("\n\nTelleriddkdhj\n\n : "+tid);
				cngPas.executeUpdate();
    				}
    				else
					{
						msg="[ Old Password & New Password Must Not Be Same ]";
						ok1=false;
					}
    			}
				else
    			{
    				msg="[ Mismatch New Password & Confirm New Password ]";
					ok1=false;
    			}
			}
			else
			{
					msg="[ Invlid Old Password ]";
					ok1=false;
			}
		}
		catch(SQLException e)
		{
		System.out.println("\nSQL Alert[telchangpas.jsp]...."+e.getMessage()+"\n");
		}
}
else
{
	msg="[ All Fields Are Compulsory - Blank Field is Not Allowed ]";
	ok1=false;
}
if(ok1)
{
	%>
	<html>
	                    <head>
	                    <meta charset="utf-8">
	                    <meta name=viewport content="device-width,initial-scale=1">
	                    <link rel=stylesheet href="bs/css/bootstrap.min.css">
	                   </head>
	                   <body  style="background: url(image/bg.jpg) no-repeat center center fixed;background-size: cover;">
	                    <div class="row">
	                     <div class="container">
	                      <div class="col-lg-12 text-center">
	                       <h3><font class="text-success"><i class="glyphicon glyphicon-ok"></i>&nbsp;Change Password Successfully..!</h3>
	                        <a href="tellogin.html">
				<button class="btn  btn-primary">Login-Again</button></a></form> <br><br>
	                      </div>
	                     </div>
	                    </div>

	                   </body>
	                  </html>

	<%
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
	   	  .mgn-top{margin-top:50px;} 
	   	  </style>
	     </head>
	     <body style="background: url(image/back_background.jpg) no-repeat center center fixed;background-size: cover;">

	<div class="row">
	<div class="container mgn-top">
		    <h3><font class="Text-danger"><%=msg %></font></h3>

	 </div>
    </div>


	         <div class="row">
	          <div class="container">
	           <div class="col-lg-6 text-center animated fadeInLeft">
	           <div class="text-center" style="background-color:#665851; margin: 0px auto; border-radius:5px 5px 0 0;"><br>
	           <font color="#FFFFFF" size="+2">Change Password </font>
		        </div>
	 	      <form action="telchangpas.jsp" method="get" class="role">
	
	            <table class="table">
	             <tr>
	              <td><font class="text-danger">Old Password </td>
	              <td><input type="text" class="form-control" name="oldpas"></td>
	             </tr>       
	             <tr>
	              <td><font class="text-success">New Password </td>
	              <td><input type="text" class="form-control" name="newpas"></td>
	             </tr>
	             <tr>
	             <td><font class="text-success">Confirm New Password </td>
	             <td><input type="password" class="form-control" name="cnpas"></td>
	            </tr>       


	            </table>
<input type="hidden" name=tid value=<%=tid %>></input>
	<input type="hidden" name=pas value=<%=pas %>></input>				
	
	            <button class="btn btn-block btn-primary" name="cp">Change Password</button>
	            </form>
	<form action="teller.jsp">
	<input type=hidden name=tid value=<%=tid %>></input>
	<input type=hidden name=pas value=<%=pas %>></input>
	 <button class="btn btn-block btn-danger">Go Back</button> 
		</form>           </div>
	           <div class="col-lg-3"> </div>
	           <div class="col-lg-3"> </div>

	          </div>
	         </div>
	     </body>
	     </html>
<% 
}
	%>
</body>
</html>