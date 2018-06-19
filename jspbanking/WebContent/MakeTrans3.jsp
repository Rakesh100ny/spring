<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Date" %>
<%@ include file="adminps.jsp" %>

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
Date dot=new Date(new java.util.Date().getTime());

String aid,apas,telid;
aid=request.getParameter("aid");
apas=request.getParameter("apas");
telid=request.getParameter("telid");


System.out.printf("\naid: %s",aid);
System.out.printf("\ntelid: %s",telid);
System.out.printf("\napas : %s",apas);

String trnid=request.getParameter("trnid");
String cactid=request.getParameter("cactid");
String amt1=request.getParameter("amt");
String typ=request.getParameter("typ");
String bal1=request.getParameter("bal");
String tt=request.getParameter("tt");
String status=request.getParameter("status");
String msg=request.getParameter("msg");

System.out.printf("\nbal1 : %s",bal1);

int flag=0;
Double amt=null,bal=null;
try
{
	amt=Double.parseDouble(amt1);
	bal=Double.parseDouble(bal1);
	System.out.printf("\nbal : %s",bal);
}
catch(NumberFormatException e)
{
	msg="Number Format Exception";
}

try
{
	
	updateCust.setDouble(1,bal);
	updateCust.setInt(2,Integer.parseInt(cactid));
	updateCust.executeUpdate();
	
insTrans.setInt(1,Integer.parseInt(trnid));
insTrans.setInt(2,Integer.parseInt(cactid));
insTrans.setInt(3,Integer.parseInt(telid));
insTrans.setString(4,tt);
insTrans.setDate(5,dot);
insTrans.setDouble(6,amt);
insTrans.setString(7,status);
insTrans.executeUpdate();
}
catch(SQLException e)
{
	System.err.println("\nSQL Alert[MakeTrans3.jsp]..."+e.getMessage()+"\n");
}
					%>
					
					<div class="row">
   <div class="container">
    <div class="col-lg-12 text-center">
     <h3><font class="text-success"><i class="glyphicon glyphicon-ok"></i> <%=msg %> Amount Successfully<br>Your Transaction is Completed..! </h3>
       <form action="MakeTrans1.jsp">  
      <input type=hidden name=aid value=<%=aid %>></input>
			<input type=hidden name=apas value=<%=apas %>></input>
      <button class="btn  btn-primary">Create More Transaction</button><br>
      </form>
    <form action="admin.jsp">  
      <input type=hidden name=aid value=<%=aid %>></input>
	<input type=hidden name=apas value=<%=apas %>></input>
      <button class="btn  btn-danger"><i class="glyphicon glyphicon-home"></i>&nbsp;Go Home</button>
      </form>
    </div>
   </div>
  </div>