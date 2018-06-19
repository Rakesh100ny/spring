<%@ include file="tellerps.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
String tid,tpas;
tid=request.getParameter("tid");
tpas=request.getParameter("tpas");

System.out.printf("\ntid: newAccount : "+tid);
System.out.printf("\ntpas newAccount :"+tpas);
System.out.printf("\ntrnid newAccount : "+trnid);


%><html>
		<head>
		<meta charset="utf-8">
	    <meta name=viewport content="device-width,initial-scale=1">
		<link rel=stylesheet href="bs/css/bootstrap.min.css">
	    <link rel="stylesheet" href="bs/css/animate.css">
	    <style> .mgn-top   {    	margin-top: 5px;	    }	    </style>
	</head>
	<body>
		<div class="row">
			<div class="container">
				<div class="col-lg-12 ">
				     <h1 class="text-info"><font>New Account </font></h1> 

				</div>
			</div>
		</div>
	    <div class="row">
	     <div class="container">
	      <div class="col-lg-3  animated fadeInLeft text-right text-primary"><h3><font> 1) Personal Details :- </h3></div><br><br>
	      <div class="col-lg-6  animated fadeInRight text-center form-group">
	      <form action="confirmNewAct.jsp" method="get" class="role">

	       <table class="table">
	        <tr>
	         <td><font>Account Id </td>
	         <td><input type="number" class="form-control" name="actid" value="<%=actid%>"  readonly=true></td>
	        </tr>
	        <tr>
	         <td><font>Teller Id </td>
	         <td><input type="number" class="form-control" name="tid"  readonly=true value="<%=tid%>"></td>
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
	         <td><font>Sex </td>
	         <td><span class="radio-inline"><input type="radio" value="male" checked="true" name="tt">Male</span>
	             <span class="radio-inline mgn-left"><input type="radio" value="female" name="tt">Female</span></td>
	        </tr>       
	        <tr>
	         <td><font>User Id </td>
	         <td><input type="text" class="form-control" name="uid"></td>
	        </tr>

	        <tr>
	         <td><font>Password </td>
	         <td><input type="password" class="form-control" name="pass"></td>
	        </tr>
	        <tr>
	         <td><font>Moblie No</td>
	         <td><input type="number" class="form-control" name="mno"></td>
	        </tr>
	        <tr>
	         <td><font>Email Id</td>
	         <td><input type="email" class="form-control" name="mid"></td>
	        </tr>
 	        </table>
	      </div>
	      </div>
 	        
	      <div class="col-lg-3"> </div>
	     </div>
	    </div>

		    <div class="row">
	     <div class="container">
	      <div class="col-lg-3 animated fadeInLeft text-right text-info"><h3><font> 2) Address Details :- </h3></div><br><br>
	      <div class="col-lg-6 animated fadeInRight text-center form-group">
	       <table class="table">
	        <tr>      
          <td><font>Address</td>
          <td><textarea name="address" rows="3"  class="form-control"></textarea></td>
        </tr>       
        <tr>
         <td><font>Zip/Postal Code</td>
         <td><input type="number" class="form-control" name="pinc"></td>
        </tr>       
        <tr>
         <td><font>City</td>
         <td><input type="text" class="form-control" name="city"></td>
        </tr>       
        <tr>
         <td><font>District</td>
         <td><input type="text" spellcheck="true" class="form-control" name="district"></td>
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
     <div class="container ">
      <div class="col-lg-3 animated fadeInLeft text-right text-danger"><h3><font> 3) Balance Details:- </h3></div><br><br>
      <div class="col-lg-6 animated fadeInRight text-center form-group">
       <table class="table">
        <tr>
         <td><font>Opening Balance</td>
         <td><input type="number" class="form-control" name="obal"></td>
        </tr>       
      </table>
<input type="hidden" name=actid value="<%=actid %>"></input>
    <input type="hidden" name="uid" value="<%=uid %>"></input>
    <input type="hidden" name="trnid" value="<%=trnid %>"></input>
    	<input type="hidden" name="tid" value="<%=tid %>"></input>
	<input type="hidden" name="tpas" value="<%=tpas %>"></input>
	       <button class="btn btn-block btn-primary">Create New Account</button>
	       </form>
	       <form action="teller.jsp">
	<input type="hidden" name="tid" value="<%=tid %>"></input>
	<input type="hidden" name="pas" value="<%=tpas %>"></input>
		<button class="btn btn-block btn-danger mgn-top"> Back</button></a>      
	</form>
	      </div>
	      <div class="col-lg-3"> </div>
	     </div>
	    </div>
	</body>
	</html>