<%@ include file="tellerps.jsp" %>
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
String tid=request.getParameter("tid");
String pas=request.getParameter("pas");
String act=request.getParameter("act");

System.out.printf("\ntid: %s",tid);
System.out.printf("\npas : %s",pas);
System.out.printf("\nact : %s",act);

boolean ok=true;

String mobileno="",balance="",teid="",fname="",lname="",gender="",uid="",passwd="",mailid="",address="",city="",district="",state="";
String pincode="";

if(act!="")
{
	try
	{
		getCust.setString(1,act);
		ResultSet rs=getCust.executeQuery();
		
		if(rs.next())
		{
		 	teid=rs.getString("tellerid");
		 	fname=rs.getString("fname");
		 	lname=rs.getString("lname");
		 	gender=rs.getString("gender");
		 	uid=rs.getString("uid");
		 	passwd=rs.getString("passwd");
		 	mobileno=rs.getString("mobileno");
		 	mailid=rs.getString("mailid");
		 	address=rs.getString("address");
		 	pincode=rs.getString("pincode");
		 	city=rs.getString("city");
		 	state=rs.getString("state");
		 	district=rs.getString("district");
		 	balance=rs.getString("balance");
		 	
		 	System.out.printf("\nbalance : "+balance);
		 	ok=true;
		}
		else
		{
			ok=false;
		}
	}
	catch(SQLException e)
	{
		System.err.println("\nSQL Alert[updact2.jsp]..."+e.getMessage()+"\n");
	}
	
	if(ok)
	{
		%>
<html>
					<head>
					<meta charset="utf-8">
				    <meta name=viewport content="device-width,initial-scale=1">
					<link rel=stylesheet href="bs/css/bootstrap.min.css">
				    <link rel="stylesheet" href="bs/css/animate.css">
				</head>
				<body>
					<div class="row">
						<div class="container">
							<div class="col-lg-12 ">
							     <h1 class="text-info"><font>Account Details </font></h1> 

							</div>
						</div>
					</div>
				    <div class="row">
				     <div class="container">
				      <div class="col-lg-3  animated fadeInLeft text-right text-primary"><h3><font> 1) Personal Details :- </h3></div><br><br>
				      <div class="col-lg-6  animated fadeInRight text-center form-group">
				      <form action="updact3.jsp" method="get" class="role">

				       <table class="table">
				        <tr>
				         <td><font>Account Id </td>
				         <td><input type="number" class="form-control" readonly="true" name="act" value=<%=act%>></td>
				        </tr>
				        <tr>
				         <td><font>Teller Id </td>
				         <td><input type="number" class="form-control" name="teid" readonly="true" value=<%=teid%>></td>
				        </tr>
				         <tr>
				         <td><font>First Name </td>
				         <td><input type="text" class="form-control" name="fname" value=<%=fname%>></td>
				        </tr>
				        <tr>
				         <td><font>Last Name </td>
				         <td><input type="text" class="form-control" name="lname" value=<%=lname%>></td>
				        </tr>       
				        <tr>
				         <td><font>Gender </td>
					<td><span class="radio-inline"><input type="radio" value="male" checked="true" name="tt">Male</span>
				             <span class="radio-inline mgn-left"><input type="radio" value="female" name="tt">Female</span></td>
				        </tr>       
				        <tr>
				         <td><font>User Id </td>
				         <td><input type="text" class="form-control" name="uid" value=<%=uid%>></td>
				        </tr>
				        <tr>
				         <td><font>Password </td>
				         <td><input type="password" class="form-control" name="pass" value=<%=passwd%>></td>
				        </tr>
				        <tr>
				         <td><font>Moblie No</td>
				         <td><input type="number" class="form-control" name="mno" value=<%=mobileno%>></td>
				        </tr>
				        <tr>
				         <td><font>Email Id</td>
				         <td><input type="email" class="form-control" name="mid" value=<%=mailid%>></td>
				        </tr>
			 	        </table>
				      </div>
				      <div class="col-lg-3"> </div>
				     </div>
				    </div>

					    <div class="row">
				     <div class="container">
				      <div class="col-lg-3  animated fadeInLeft text-right text-info"><h3><font> 2) Address Details :- </h3></div><br><br>
				      <div class="col-lg-6  animated fadeInRight text-center form-group">
				       <table class="table">
				        <tr>      
			          <td><font>Address</td>
			          <td><textarea name="address" rows="3" class="form-control"><%=address%></textarea></td>
			        </tr>       
			        <tr>
			         <td><font>Zip/Postal Code</td>
			         <td><input type="number" class="form-control" name="pinc" value=<%=pincode%>></td>
			        </tr>       
			        <tr>
			         <td><font>City</td>
			         <td><input type="text" class="form-control" name="city" value=<%=city%>></td>
			        </tr>       
			        <tr>
			         <td><font>District</td>
			         <td><input type="text" spellcheck="true" class="form-control" name="district" value=<%=district%>></td>
			        </tr>       
			        <tr>
			         <td><font>State</td>
			         <td><select name="state" class="form-control">
         	  <option><%=state%></option>
              <option> AANDHRA PRADESH</option>
              <option> ARUNACHAL PRADESH</option>
              <option> ASSAM </option>
              <option> BIHAR</option>
              <option> CHHATTISGARH</option>
              <option> GOA</option>
              <option> GUJARAT</option>
              <option> HARYANA</option>
              <option> HIMACHAL PRADESH</option>
              <option> JAMMU & KASHMIR</option>
              <option> JHARKHAND</option>
              <option> KARNATAKA</option>
              <option> KERALA</option>
              <option> MADHYA PRADESH</option>
              <option> MAHARASHTRA</option>
              <option> MANIPUR</option>
              <option> MEGHALAYA</option>
              <option> MIZORAM</option>
              <option> NAGALAND</option>
              <option> ODISHA</option>
              <option> PUNJAB</option>
              <option> RAJASTHAN</option>
              <option> SIKKIM</option>
              <option> TAMIL NADU</option>
              <option> TELANGANA</option>
              <option> TRIPURA</option>
              <option> UTTAR PRADESH</option>
              <option> UTTARAKHAND</option>
              <option> WEST BENGAL</option>
              </select>
           </td>
			        </tr> 
			      </table>
			       </div>
			      <div class="col-lg-3"> </div>
			     </div>
			    </div>
			    <div class="row">
			     <div class="container">
			      <div class="col-lg-3  animated fadeInLeft text-right text-danger"><h3><font> 3) Balance Details:- </h3></div><br><br>
			      <div class="col-lg-6  animated fadeInRight text-center form-group">
			       <table class="table">
			        <tr>
			         <td><font>Opening Balance</td>
			         <td><input type="text" class="form-control" readonly="true" name="obal" value=<%=balance%>></td>
			        </tr>       
			      </table>
<input type="hidden" name="tid" value=<%=tid %>></input>
	<input type="hidden" name="pas" value=<%=pas %>></input>
				       <button class="btn btn-block btn-primary">Upadte</button><br>
				       </form>
<form action="teller.jsp">
	<input type="hidden" name="tid" value=<%=tid %>></input>
	<input type="hidden" name="pas" value=<%=pas %>></input>
	
         <button  name="back" class="btn btn-block btn-danger"> Back</button>      
      </form>
				      </div>
				      <div class="col-lg-3"> </div>
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
			   	  .mgn-top{margin-top:85px;} 
			   	  </style>
				   
				</head>
				<body style="background: url(image/back_background.jpg) no-repeat center center fixed;background-size: cover;">
				    
<div class="row">
	<div class="container mgn-top">
		    <h3><font class="Text-danger ">[ Account Id Doesn't Exists ] </font></h3>

	</div>
</div>


			<div class="row">
		     <div class="container">
		      <div class="col-lg-6 text-center animated fadeInLeft">
		       <div class="text-center" style="background-color:#665851; margin: 0px auto; border-radius:5px 5px 0 0;"><br>
	           <font color="#FFFFFF" size="+2">Customer Account Details</font>
		        </div>

		      <form action="updact2.jsp" method="get" class="role">

	         <table class="table">
	          <tr>
	           <td>Enter Account Id </td>
	           <td><input type="number" class="form-control" name="act"></td>
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
	  </html>		<%
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
			   	  .mgn-top{margin-top:85px;} 
			   	  </style>
				   
				</head>
				<body style="background: url(image/back_background.jpg) no-repeat center center fixed;background-size: cover;">
				    
<div class="row">
	<div class="container mgn-top">
		    <h3><font class="Text-danger ">[ Account Id Field Is Compulsory ] </font></h3>

	</div>
</div>


			<div class="row">
		     <div class="container">
		      <div class="col-lg-6 text-center animated fadeInLeft">
		       <div class="text-center" style="background-color:#665851; margin: 0px auto; border-radius:5px 5px 0 0;"><br>
	           <font color="#FFFFFF" size="+2">Customer Account Details</font>
		        </div>

		      <form action="updact2.jsp" method="get" class="role">

	         <table class="table">
	          <tr>
	           <td>Enter Account Id </td>
	           <td><input type="number" class="form-control" name="act"></td>
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