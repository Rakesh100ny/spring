<%@page import="java.util.*"%>
<%@ include file="tellerps.jsp" %>
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

String actid=request.getParameter("actid");
String pass=request.getParameter("pass");
String fnam=request.getParameter("fnam");
String lnam=request.getParameter("lnam");
String obal=request.getParameter("obal");
String uid=request.getParameter("uid");
String mno=request.getParameter("mno");
String mid=request.getParameter("mid");
String pinc=request.getParameter("pinc");
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String tpas=request.getParameter("tpas");
String district=request.getParameter("district");
String gender=request.getParameter("gender");
String tid=request.getParameter("tid");
String trnid=request.getParameter("trnid");

System.out.printf("\nactid : "+actid);
System.out.printf("\nuid : "+uid);
System.out.printf("\npass : "+pass);
System.out.printf("\nfnam : "+fnam);
System.out.printf("\nlnam : "+lnam);
System.out.printf("\nobal : "+obal);
System.out.printf("\nmno : "+mno);
System.out.printf("\nmid : "+mid);
System.out.printf("\npinc : "+pinc);
System.out.printf("\naddress : "+address);
System.out.printf("\ncity : "+city);
System.out.printf("\nstate : "+state);

Date dot=new Date(new java.util.Date().getTime());

try
{
	insCust.setString(1,actid);
	insCust.setString(2,tid);
	insCust.setString(3,fnam);
	insCust.setString(4,lnam);
	insCust.setString(5,gender);
	insCust.setString(6,uid);
	insCust.setString(7,pass);
	insCust.setString(8,mno);
	insCust.setString(9,mid);
	insCust.setString(10,address);
	insCust.setString(11,pinc);
	insCust.setString(12,city);
	insCust.setString(13,district);
	insCust.setString(14,state);
	insCust.setString(15,obal);
	insCust.executeUpdate();
	
	insTrans.setString(1,trnid);
	insTrans.setString(2,actid);
	insTrans.setString(3,tid);
	insTrans.setString(4,"CR");
	insTrans.setDate(5,dot);
	insTrans.setString(6,obal);
	insTrans.setString(7,"success");
	insTrans.executeUpdate();
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
			   <form action="newAccount.jsp" method="get" class="role">
			   <div class="container">
			    <div class="col-lg-12 text-center">
			     <h3 class="animated fadeInLeft"><font class="text-success"><i class="glyphicon glyphicon-ok "></i>&nbsp;Account Created Successfully..!</h3>
			      <input type="hidden" name="tid" value=<%=request.getParameter("tid") %>></input>
<input type="hidden" name="tpas" value=<%=request.getParameter("tpas") %>></input>
<button class="btn  btn-primary animated fadeInRight">Create More Account</button><br></form>
      <form action="teller.jsp">
	<input type="hidden" name="tid" value=<%=request.getParameter("tid") %>></input>
	<input type="hidden" name="pas" value=<%=request.getParameter("tpas") %>></input>
<button class="btn  btn-danger animated fadeInLeft"><i class="glyphicon glyphicon-home"></i>&nbsp;Go Home</button>
</form>
			    </div>
			   </div>
			  </div>

			 </body>
			</html>
<% 
	
}
catch(SQLException e)
{	
	System.err.println("\nSQL Alert[newact.jsp]..."+e.getMessage()+"\n");
}
%>
