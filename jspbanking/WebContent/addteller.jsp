<%@ include file="adminps.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<html>
<head>
<title>newTellerAccount.jsp</title>
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
String aid,apas;
aid=request.getParameter("aid");
apas=request.getParameter("apas");

System.out.printf("\ntid: newTAccount : "+aid);
System.out.printf("\ntpas newTAccount :"+apas);
System.out.printf("\ntrnid newTAccount : "+trnid);
%>
	<div class="row">
		<div class="container">
			<div class="col-lg-12 text-center">
				<h1 class="text-primary"><font>www.E-Banking.com</font></h1>
                <h2 class="text-info"><font>New Teller </font></h2>
			</div>
		</div>
	</div>
    <div class="row">
     <div class="container">
<form action="telconfNewAct.jsp">
      <div class="col-lg-3  text-right text-primary"><h3><font> 1) Personal Details :- </h3></div><br><br>
      <div class="col-lg-6 text-center form-group">
       <table class="table">
        <tr>
         <td>Teller Id </td>
         <td><input type="number" class="form-control" readonly="true" name="telid" value="<%=telid%>"></td>
        </tr>       
        <tr>
         <td><font>Admin Id </td>
         <td><input type="number" class="form-control" name="aid" readonly="true" value="<%=aid%>"></td>
        </tr>       
        <tr>
         <td><font>First Name </td>
         <td><input type="text" class="form-control" name="fnam"></td>
        </tr>       
        <tr>
         <td><font>Last Name </td>
         <td><input type="text" class="form-control" name="lnam"></td>
        </tr>
        <tr>
         <td><font>Gender </td>
         <td><span class="radio-inline"><input type="radio" value="male" checked="true" name="tt">Male</span>
             <span class="radio-inline mgn-left"><input type="radio" value="female" name="tt">Female</span></td>
        </tr>       
        <tr>
         <td><font>Password </td>
         <td><input type="text" class="form-control" name="pass"></td>
        </tr>       
        <tr>
         <td><font>Mobile NO</td>
         <td><input type="text" class="form-control" name="mno"></td>
        </tr>       
        <tr>
         <td><font>Email Id</td>
         <td><input type="email" class="form-control" name="mid"></td>
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
          <td><textarea name="address" rows="3" class="form-control"></textarea></td>
        </tr>       
        <tr>
         <td><font>Zip/Postal Code</td>
         <td><input type="number" class="form-control" name="pinc"></td>
        </tr>
        <tr>
         <td><font>State</td>
         <td><select name="state"  class="form-control">
              <option> RAJASTHAN</option>
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
        <tr>
         <td><font>District</td>
         <td><input type="text" spellcheck="true" class="form-control" name="district"></td>
        </tr>
        <tr>
         <td><font>City</td>
         <td><input type="text" class="form-control" name="city"></td>
        </tr>
         
      </table>
       </div>
      <div class="col-lg-3"> </div>
     </div>
    </div>

<div class="row">
     <div class="container">
     <div class="col-lg-3  "></div>
     <div class="col-lg-6 text-center ">

        <button class="btn btn-block btn-primary mgnbtm">Create Teller Account</button>
        <input type="hidden" name=telid value=<%=telid %>></input>
    	<input type="hidden" name="trnid" value="<%=trnid %>"></input>
    	<input type="hidden" name="aid" value=<%=aid %>></input>
	<input type="hidden" name="apas" value="<%=apas %>"></input>
	</form>
	
    <form action="admin.jsp">
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