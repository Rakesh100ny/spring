<%@ page import="java.util.*" %>
<%@ include file="tellerps.jsp" %>
<%@ page import="java.sql.*" %>

<html>
 <head>
  <meta charset="utf-8">
  <meta name=viewport content="device-width,initial-scale=1">
  <link rel=stylesheet href="bs/css/bootstrap.min.css">
 </head>
 <body>
<%

String log,pas;
log=request.getParameter("tid");
pas=request.getParameter("pas");

Enumeration tid=request.getParameterNames();
System.out.println("\ntid : "+tid);
int cnt=0;

while(tid.hasMoreElements())
{
	  String trn=request.getParameter((String)tid.nextElement());
	  try
	  {
		  System.out.printf("\n trn : %s",trn);
		  trnDets.setString(1,trn);
		  ResultSet rst=trnDets.executeQuery();
		  rst.next();
		  
		  double amt =rst.getDouble("amt"); 
		  String actid=rst.getString("actid");
		  String tt=rst.getString("type");
		  String status=rst.getString("status");
		  
		  
		  getCust.setString(1,actid);
		  ResultSet rsc=getCust.executeQuery();
		  rsc.next();
		  
		  double bal=rsc.getDouble("balance");
				  
		  if(status.equals("success"))
		  {
			 if(tt.equals("CR"))
			 {
				 bal=bal-amt;
			 }
			 else
			 {
				 bal=bal+amt;
			 }
			 updCust.setDouble(1,bal);
			 updCust.setString(2,actid);
			 
			 updCust.executeUpdate();
		  }
		  
		  delTran.setString(1,trn);
		  delTran.executeUpdate();
		  cnt++;
	  }
	  catch(SQLException e)
	  {
		  System.err.println("SQL Alert [deltrans] - "+e.getMessage());
	  }
}
%>
  <div class="row">
   <div class="container">
    <div class="col-lg-12 text-center">
     <h2><font class="text-success"><i class="glyphicon glyphicon-ok"></i>&nbsp;[ <%=cnt %> ] Transactions Deleted....!</h2>
<form action="teller.jsp">
<input type=hidden name=tid value=<%=log %>></input>
	<input type=hidden name=pas value=<%=pas %>></input>
     <button class="btn  btn-danger"><i class="glyphicon glyphicon-home"></i>&nbsp;Home</button>
     </form>
    </div>
   </div>
  </div>
</body>
</html>