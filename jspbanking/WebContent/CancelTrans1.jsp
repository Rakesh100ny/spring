<%@ include file="adminps.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<html>
<head>
	<meta charset="utf-8">
    <meta name=viewport content="device-width,initial-scale=1">
	<link rel=stylesheet href="bs/css/bootstrap.min.css">
	
</head>
<body>
<%
String aid,apas;
aid=request.getParameter("aid");
apas=request.getParameter("apas");

System.out.printf("\naid: %s",aid);
System.out.printf("\napas : %s",apas);

%>
	<div class="row">
		<div class="container">
<form action="CancelTrans2.jsp">
      <div class="col-lg-4"> </div>
      <div class="col-lg-4 text-center"><h3><font>Cancel Transaction </font></h3> 
       <table class="table">
        <tr>
         <td><font>Teller Id </td>
         <td><input type="text" class="form-control" name="tid"></td>
        </tr>
        <tr>
         <td><font>Account Id </td>
         <td><input type="text" class="form-control" name="act"></td>
        </tr>       
        <tr>
         <td><font>From</td>
         <td><input type="date" class="form-control" name="datefrom"></td>
        </tr>       
        <tr>
         <td><font>To</td>
         <td><input type="date" class="form-control" name=dateto ></td>
        </tr>       
       </table>
	<input type=hidden name=aid value=<%=aid %>></input>
	<input type=hidden name=apas value=<%=apas %>></input>
       <button class="btn btn-block btn-primary">Submit</button><br>
	</form>

	<form action="admin.jsp">
	<input type=hidden name=aid value=<%=aid %>></input>
	<input type=hidden name=apas value=<%=apas %>></input>
       <button class="btn btn-block btn-danger"> Back</button>      
	</form>

      </div>
      <div class="col-lg-4"> </div>
     </div>
    </div>
</body>
</html>
