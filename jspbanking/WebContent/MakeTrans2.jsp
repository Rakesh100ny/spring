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

if(cactid!="" && amt1!="")
{	
	if(ok1)
	{
	try
	{
		selCust.setString(1,cactid);
		ResultSet rs=selCust.executeQuery();
		
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
					status="success";
					tt="CR";
					flag=1;
					msg="Credit";
					System.out.printf("\nflag : "+flag);
				}
				else
				{
					System.out.printf("\namt99 : "+amt);
					if(amt<=bal)
					{
						bal=bal-amt;
						status="success";
						tt="DR";
						msg="Debit";
						System.out.printf("\nflag : "+flag);
						flag=1;
					}
					else
					{
						msg="Unsufficient Balance For Transaction";
						status="failed";
						tt="DR";
						flag=0;
						System.out.printf("\nflag : "+flag);
					}
				}
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
		System.err.println("\nSQL Alert[MakeTrans2.jsp]..."+e.getMessage()+"\n");
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
<div class="row">
	       <form action="MakeTrans3.jsp">
<div class="container">
<div class="col-lg-12 text-center">
	<h1 class="text-primary"><font>www.M-Banking.com</font></h1>
    <h2 class="text-info">Transaction</font></h2>
    <h2 class="text-danger"><font>Confirm Transaction(s) Details </font></h2>
  
</div>
</div>
</div>
<div class="row">
<div class="container">
  <div class="col-lg-3  "></div>
<div class="col-lg-6 text-center form-group">
<table class="table">
<tr>
<td>Transaction Id </td>
<td><%=trnid%></td>
</tr>       
<tr>
<td>Teller Id </td>
<td><%=telid%></td>
</tr>
<tr>
<td>Account Id </td>
<td><%=cactid%></td>
</tr>
<tr>
<td>First Name </td>
<td><%=fnam%></td>
</tr>
<tr>
<td>Last Name </td>
<td><%=lnam%></td>
</tr>
<tr>
<td>Avilable Balance </td>
<td><%=bal%></td>
</tr>
<tr>
<td>Txn Type </td>
<td><%=tt%></td>
</tr>
<tr>
<td>Amount </td>
<td><%=amt%></td>
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

<button class="btn btn-block btn-primary mgnbtm text-danger">Transaction</button>
<input type="hidden" name=telid value=<%=telid %>></input>
<input type="hidden" name=cactid value=<%=cactid %>></input>
<input type="hidden" name=aid value=<%=aid %>></input>
<input type="hidden" name=apas value=<%=apas %>></input>
<input type="hidden" name=trnid value=<%=trnid %>></input>
<input type="hidden" name=tt value=<%=tt %>></input>
<input type="hidden" name=amt value=<%=amt %>></input>
<input type="hidden" name=bal value=<%=bal %>></input>
<input type="hidden" name=status value=<%=status %>></input>
<input type="hidden" name=msg value=<%=msg %>></input>
<input type="hidden" name=bal value=<%=bal %>></input>
</form>

<form action="MakeTrans1.jsp">
<input type="hidden" name="aid" value="<%=aid %>"></input>
<input type="hidden" name="apas" value="<%=apas %>"></input>
<button  name="back" class="btn btn-block btn-danger"> Go Back</button>      
</form>
       </div>
      <div class="col-lg-3"> </div>
   </div>
</div>
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
  <form action="MakeTrans2.jsp">
     <div class="container">
      <div class="col-lg-3"> </div>
      <div class="col-lg-6 text-center"><h3><font>Transaction </font></h3>
      					<h3 class="text-danger">[ <%=text %><%=msg %> ]</h3>       
        <table class="table">
        <tr>
         <td><font>Transaction Id </td>
         <td><input type="text" class="form-control" readonly="true" name="trnid" value=<%=trnid %>></td>
        </tr>       
        <tr>
         <td><font>Account Id </td>
         <td><input type="number" class="form-control" name="cactid" ></td>
        </tr>
        <tr>
         <td><font>Teller Id </td>
         <td><input type="text" class="form-control" readonly="true" name="telid" value=1001 ></td>
        </tr>       
        <tr>
         <td><font>Type </td>
         <td><input type="radio" name="typ" value="CR" checked="true">CR
          <input type="radio" name="typ" value="DR">DR</td>
        </tr>       
        <tr>
         <td><font>Ammount </td>
         <td><input type="number" class="form-control" name="amt"></td>
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
	<%
}
%>
</body>
</html>