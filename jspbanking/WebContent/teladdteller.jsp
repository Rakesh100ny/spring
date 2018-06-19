<%@page import="java.util.*"%>
<%@ include file="adminps.jsp" %>
<%@ page import="java.sql.Date" %>
<html>
 <head>
  <meta charset="utf-8">
  <meta name=viewport content="device-width,initial-scale=1">
  <link rel=stylesheet href="bs/css/bootstrap.min.css">
  <style>
  .mgnbtm
  {
	  margin-bottom:5px;
  }
  </style>
 </head>
 <body>

<%

String telid=request.getParameter("telid");
String pass=request.getParameter("pass");
String fnam=request.getParameter("fnam");
String lnam=request.getParameter("lnam");
String mno=request.getParameter("mno");
String mid=request.getParameter("mid");
String pinc=request.getParameter("pinc");
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String apas=request.getParameter("apas");
String district=request.getParameter("district");
String gender=request.getParameter("gender");
String aid=request.getParameter("aid");
String trnid=request.getParameter("trnid");

System.out.printf("\ntelid : "+telid);
System.out.printf("\naid : "+aid);
System.out.printf("\npass : "+pass);
System.out.printf("\nfnam : "+fnam);
System.out.printf("\nlnam : "+lnam);
System.out.printf("\nmno : "+mno);
System.out.printf("\nmid : "+mid);
System.out.printf("\npinc : "+pinc);
System.out.printf("\naddress : "+address);
System.out.printf("\ncity : "+city);
System.out.printf("\nstate : "+state);

try
{
	insTeller.setString(1,telid);
	insTeller.setString(2,aid);
	insTeller.setString(3,pass);
	insTeller.setString(4,fnam);
	insTeller.setString(5,lnam);
	insTeller.setString(6,gender);
	insTeller.setString(7,mno);
	insTeller.setString(8,mid);
	insTeller.setString(9,address);
	insTeller.setString(10,pinc);
	insTeller.setString(11,city);
	insTeller.setString(12,district);
	insTeller.setString(13,state);
	insTeller.executeUpdate(); 
 %>
  <div class="row">
   <div class="container">
   <form action="addteller.jsp">
    <div class="col-lg-12 text-center">
     <h3><font class="text-success"><i class="glyphicon glyphicon-ok"></i>&nbsp;Add Teller Successfully..!</h3>
<input type="hidden" name="aid" value="<%=request.getParameter("aid") %>"></input>
<input type="hidden" name="apas" value=<%=request.getParameter("apas") %>></input>
      <button class="btn  btn-primary mgnbtm">Create More Account</button><br><br>
</form>      
      <form action="admin.jsp">
	<input type="hidden" name="aid" value="<%=request.getParameter("aid") %>"></input>
	<input type="hidden" name="apas" value="<%=request.getParameter("apas") %>"></input>
      <button class="btn  btn-danger"><i class="glyphicon glyphicon-home"></i>&nbsp;Go Home</button></form>
    </div>
   </div>
  </div>
<% 
	
}
catch(SQLException e)
{	
	System.err.println("\nSQL Alert[newact.jsp]..."+e.getMessage()+"\n");
}
%>
</body>
</html>

