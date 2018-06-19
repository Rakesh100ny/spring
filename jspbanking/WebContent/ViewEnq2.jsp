<%@ page import="java.util.*" %>
<%@ include file="adminps.jsp" %>
<%@ page import="java.sql.*" %>

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

Enumeration fname=request.getParameterNames();
System.out.println("\nfname : "+fname);

while(fname.hasMoreElements())
{
	  String trn=request.getParameter((String)fname.nextElement());
	  try
	  {
		  System.out.printf("\n trn : %s",trn);
		  
		  delEnq.setString(1,trn);
		  delEnq.executeUpdate();
	  }
	  catch(SQLException e)
	  {
		  System.err.println("SQL Alert [ViewEnq2.jsp] - "+e.getMessage());
	  }
}
%>
  <div class="row">
   <div class="container">
    <div class="col-lg-12 text-center">
     <h2><font class="text-success"><i class="glyphicon glyphicon-ok"></i>&nbsp;Enquiry Deleted....!</h2>
<form action="admin.jsp">
<input type=hidden name=aid value=<%=aid %>></input>
	<input type=hidden name=apas value=<%=apas %>></input>
     <button class="btn  btn-danger"><i class="glyphicon glyphicon-home"></i>&nbsp;Home</button>
     </form>
    </div>
   </div>
  </div>
</body>
</html>