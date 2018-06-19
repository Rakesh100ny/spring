<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Date" %>
<%@ include file="tellerps.jsp" %>

<%
Date dot=new Date(new java.util.Date().getTime());

String tid=request.getParameter("tid");
String pas=request.getParameter("pas");
String trnid=request.getParameter("trnid");
String actid=request.getParameter("actid");
String amt1=request.getParameter("amt");
String typ=request.getParameter("typ");

System.out.printf("\ntrnid : "+trnid);
System.out.printf("\nactid : "+actid);
System.out.printf("\ntyp8979 : "+typ);

int flag=0;
Double amt=null,bal=null;
String msg="",status="",tt="",text="",fnam="",lnam="";
boolean ok1=true;

char str[]=amt1.toCharArray();
for(int i=0;i<amt1.length();i++)
{
	if(str[i]>='0' && str[i]<='9')
	{
		try
		{
			amt=Double.parseDouble(amt1);	
		}
		catch(NumberFormatException e)
		{
			msg="Number Format Exception";
			ok1=false;
		}
		
		ok1=true;
	}
	else
	{
		ok1=false;
	}
}


if(actid!="" && amt1!="")
{	
	if(ok1)
	{
	try
	{
		getCust.setString(1,actid);
		ResultSet rs=getCust.executeQuery();
		
		boolean ok=true;
			
		if(rs.next())
		{
		 	bal=rs.getDouble("balance");
		 	fnam=rs.getString("fname");
		 	lnam=rs.getString("lname");
		 	System.out.printf("\nbal : "+bal);
		 	ok=true;
		}
		else
		{
			ok=false;
		}
		if(ok)
		{
			if(amt>0)
			{
				System.out.printf("\namt89 : "+amt);
    			System.out.printf("\nbal : "+bal);
				if(typ.equals("CR"))
				{
					System.out.printf("\namt989 : "+amt);
					bal=bal+amt;
					System.out.printf("\namt989798 : "+amt);
					msg="Credit Amount Successfully";
					updCust.setDouble(1,bal);
					updCust.setInt(2,Integer.parseInt(actid));
					updCust.executeUpdate();
					System.out.printf("\nbal : "+bal);
					status="success";
					tt="CR";
					flag=1;
				}
				else
				{
					System.out.printf("\namt99 : "+amt);
					if(amt<=bal)
					{
						bal=bal-amt;
						msg="Debit Amount Successfully";
						updCust.setDouble(1,bal);
						updCust.setInt(2,Integer.parseInt(actid));
						updCust.executeUpdate();
						status="success";
						tt="DR";	
						flag=1;
					}
					else
					{
						msg="Unsufficient Balance For Transaction";
						status="failed";
						tt="DR";
						flag=0;
					}
				}
				insTrans.setInt(1,Integer.parseInt(trnid));
				insTrans.setInt(2,Integer.parseInt(actid));
				insTrans.setInt(3,Integer.parseInt(tid));
				insTrans.setString(4,tt);
				insTrans.setDate(5,dot);
				insTrans.setDouble(6,amt);
				insTrans.setString(7,status);
				insTrans.executeUpdate();
			}
			else
			{
				 text="Ammount Must Be Positive Integer"; 			
			}
		}
		else
		{
			text="Account ID Is Invalid";
		}
	}
	catch(SQLException e)
	{
		System.err.println("\nSQL Alert[InitTeller]..."+e.getMessage()+"\n");
	}
	
	}
	else
	{
		 text="Ammount Must Be Positive Integer";
	}
}
else
{
	text="All Fields Are Maindatory";
	
}

if(flag==1)
{
	%>
	  <html>
        <head>
        <meta charset="utf-8">
        <meta name=viewport content="device-width,initial-scale=1">
        <link rel=stylesheet href="bs/css/bootstrap.min.css">
       </head>
       <body>
       
       <div class="row">
	     <div class="container">
	     <div class="col-lg-12 text-center">
	   <h3><font class="text-success"><i class="glyphicon glyphicon-ok"></i>&nbsp;<%=fnam %> <%=lnam %>  </h3>
	      <h3><font class="text-success"><i class="glyphicon glyphicon-ok"></i>&nbsp;Your Transaction is Completed Successfully..!</h3>
       <form action="transaction.jsp">  
      <input type=hidden name=tid value=<%=tid %>></input>
			<input type=hidden name=tpas value=<%=pas %>></input>
      <button class="btn  btn-primary">Create More Transaction</button><br>
      </form>
    <form action="teller.jsp">  
      <input type=hidden name=tid value=<%=tid %>></input>
	<input type=hidden name=pas value=<%=pas %>></input>
      <button class="btn  btn-danger"><i class="glyphicon glyphicon-home"></i>&nbsp;Go Home</button>
      </form>
    </div>
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
	    	  .mgn-top{margin-top:80px;} 
	         
	    	 </style>
	     
			
		</head>
		<body>
		
		<div class="row">
	<div class="container mgn-top Text-center">
		    <h3><font class="Text-danger "> [ <%=text %> ] </font></h3>

	</div>
</div>
		
		
		    <div class="row">
		     <div class="container">
		      <div class="col-lg-3"> </div>
		      <div class="col-lg-6 animated fadeInLeft Text-Center">
	 	       <div class="text-center" style="background-color:#665851; margin-top: 0; border-radius:5px 5px 0 0;"><br>
               <font color="#FFFFFF" size="+2">Transaction</font>
               
  	        </div>
 		      <form action="trans.jsp" method="get" class="role">  
		       <table class="table">
		        <tr>
		         <td>Transaction Id </td>
		         <td><input type="text" class="form-control"  name="trnid" value=<%=trnid %>></td>
		        </tr>       
		        <tr>
		         <td>Account Id </td>
		         <td><input type="text" class="form-control" name="actid"></td>
		        </tr>       
		              <tr>
         <td>Teller Id </td>
         <td><input type="text" class="form-control" readonly="true" name="tid" value=<%=tid %>></td>
        </tr>       
        <tr>
         <td>Type </td>
         <td><input type="radio" name="typ" value="CR" checked="true">CR
          <input type="radio" name="typ" value="DR">DR</td>
        </tr>       
        <tr>
         <td>Amount </td>
         <td><input type="number" class="form-control" name="amt" value=<%=amt1 %>></td>
        </tr>       
       </table>

       
        <input type=hidden name=tid value=<%=tid %>></input>
		<input type=hidden name=pas value=<%=pas %>></input>
        <button class="btn btn-block btn-primary">Submit</button>
</form>
					<form action="teller.jsp">
					<input type=hidden name=tid value=<%=tid %>></input>
					<input type=hidden name=pas value=<%=pas %>></input>
					
<button class="btn btn-block btn-danger">Go Back</button></form>
       				</form>      
      </div>
      <div class="col-lg-3"> </div>
     </div>
    </div>
<% 
}
%>
</center>
</body>
</html>