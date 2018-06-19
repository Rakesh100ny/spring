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
String aid=request.getParameter("aid");
String apas=request.getParameter("apas");
String act=request.getParameter("act");

System.out.printf("\naid: %s",aid);
System.out.printf("\napas : %s",apas);
System.out.printf("\nact : %s",act);

boolean ok=true;

String mobileno="",balance="",teid="",fname="",lname="",gender="",uid="",passwd="",mailid="",address="",city="",district="",state="";
String pincode="";

if(act!="")
{
	try
	{
		getCust.setInt(1,Integer.parseInt(act));
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
			<div class="row">
		<div class="container">
			<div class="col-lg-12 text-center">
				<h1><font>www.M-Banking.com</font></h1>
			</div>
		</div>
	</div>
    <div class="row">
  <form action="updadminact3.jsp">
	    <div class="col-lg-3  text-right text-primary"><h3><font> 1) Personal Details :- </h3></div><br><br>
      <div class="col-lg-6 text-center form-group">
       <table class="table">
        <tr>
         <td>Account Id </td>
         <td><input type="number" class="form-control" readonly="true" name="act" value="<%=act%>"></td>
        </tr>       
        <tr>
         <td><font> TellerId </td>
         <td><input type="number" class="form-control" name="teid" readonly="true" value="<%=teid%>"></td>
        </tr>       
        <tr>
         <td><font>First Name </td>
         <td><input type="text" class="form-control" name="fname" value="<%=fname%>"></td>
        </tr>       
        <tr>
         <td><font>Last Name </td>
         <td><input type="text" class="form-control" name="lname" value="<%=lname%>"></td>
        </tr>
        <tr>
         <td><font>Gender </td>
         <td><span class="radio-inline"><input type="radio" value="male" checked="true" name="tt">Male</span>
             <span class="radio-inline mgn-left"><input type="radio" value="female" name="tt">Female</span></td>
        </tr>       
        <tr>
         <td><font>User Id </td>
         <td><input type="text" readonly="true" class="form-control" name="uid" value="<%=uid%>"></td>
        </tr>       
        <tr>
         <td><font>password </td>
         <td><input type="text" class="form-control" name="pass" value="<%=passwd%>"></td>
        </tr>       
        <tr>
         <td><font>Mobile NO</td>
         <td><input type="text" class="form-control" name="mno" value="<%=mobileno%>"></td>
        </tr>       
        <tr>
         <td><font>Email Id</td>
         <td><input type="email" class="form-control" name="mid" value="<%=mailid%>"></td>
        </tr>       
        
        </table>
      </div>
      <div class="col-lg-3"> </div>
     </div>
    </div>
        
    <div class="row">
     <div class="container">
      <div class="col-lg-3  text-right text-info"><h3><font> 2) Address Details :- </h3></div><br><br>
      <div class="col-lg-6 text-center form-group">
       <table class="table">
         <tr>      
          <td><font>Address</td>
          <td><textarea name="address" rows="3" class="form-control"><%=address%></textarea></td>
        </tr>       
        <tr>
         <td><font>Zip/Postal Code</td>
         <td><input type="number" class="form-control" name="pinc" value="<%=pincode%>"></td>
        </tr>       
        <tr>
         <td><font>City</td>
         <td><input type="text" class="form-control" name="city" value="<%=city%>"></td>
        </tr>       
        <tr>
         <td><font>District</td>
         <td><input type="text" spellcheck="true" class="form-control" name="district" value="<%=district%>"></td>
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
      <div class="col-lg-3  text-right text-danger"><h3><font> 3) Balance Details:- </h3></div><br><br>
      <div class="col-lg-6 text-center form-group">
       <table class="table">
        <tr>
         <td><font>Opening Balance</td>
         <td><input type="number" class="form-control" readonly="true" name="obal" value="<%=balance%>"></td>
        </tr>       
      </table>
      <button class="btn btn-block btn-primary mgnbtm">Update Account</button>
      	<input type="hidden" name="aid" value=<%=aid %>></input>
	<input type="hidden" name="apas" value="<%=apas %>"></input>
	</form>
	
	<form action="updadminact1.jsp">
	<input type="hidden" name="aid" value="<%=aid %>"></input>
	<input type="hidden" name="apas" value="<%=apas %>"></input>
	
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
		<div class="row">
		<div class="container">
			<div class="col-lg-12 text-center">
				<h1><font>www.M-Banking.com</font></h1>
			</div>
		</div>
	</div>
    <div class="row">
  <form action="updadminact2.jsp">
	     <div class="container">
      <div class="col-lg-3"> </div>
      <div class="col-lg-6 text-center"><h3><font>Update Customer Account </font></h3>
      <h3><font class="text-danger">[ Account Id Doesn't Exists ] </font></h3> 
      <table class="table">
        <tr>
         <td><font>Account Id </td>
         <td><input type="text" class="form-control" name="act" ></td>
        </tr>       
        </table>
       
        <input type=hidden name=aid value=<%=aid %>></input>
		<input type=hidden name=apas value=<%=apas %>></input>
       <button class="btn btn-block btn-primary mgnbtm">Submit</button>	
</form>
					<form action="admin.jsp">
					<input type=hidden name=aid value=<%=aid %>></input>
					<input type=hidden name=apas value=<%=apas %>></input>
					
       				<button class="btn btn-block btn-danger"> Back</button>
       				</form>      
      </div>
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
	<div class="row">
		<div class="container">
			<div class="col-lg-12 text-center">
				<h1><font>www.M-Banking.com</font></h1>
			</div>
		</div>
	</div>
    <div class="row">
  <form action="updadminact2.jsp">
	     <div class="container">
      <div class="col-lg-3"> </div>
      <div class="col-lg-6 text-center"><h3><font>Update Customer Account </font></h3>
      <h3><font class="text-danger">[ Account Id Field Is Compulsory ] </font></h3> 
      <table class="table">
        <tr>
         <td><font>Account Id </td>
         <td><input type="text" class="form-control" name="act" ></td>
        </tr>       
        </table>
       
        <input type=hidden name=aid value=<%=aid %>></input>
		<input type=hidden name=apas value=<%=apas %>></input>
       <button class="btn btn-block btn-primary mgnbtm">Submit</button>	
</form>
					<form action="admin.jsp">
					<input type=hidden name=aid value=<%=aid %>></input>
					<input type=hidden name=apas value=<%=apas %>></input>
					
       				<button class="btn btn-block btn-danger"> Back</button>
       				</form>      
      </div>
      <div class="col-lg-3"> </div>
     </div>
    </div>
</body>
</html>
	<%		
}
 %>