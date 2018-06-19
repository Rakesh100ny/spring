<%@ include file="adminps.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.String.*" %>
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
	String telid=request.getParameter("telid");
    String aid=request.getParameter("aid");
	String fnam=request.getParameter("fnam");
	String lnam=request.getParameter("lnam");
	String gender=request.getParameter("tt");
	String pass=request.getParameter("pass");
	String mno=request.getParameter("mno");
	String mid=request.getParameter("mid");
	String address=request.getParameter("address");
	String pinc=request.getParameter("pinc");
	String city=request.getParameter("city");
	String district=request.getParameter("district");
	String state=request.getParameter("state");
	String apas=request.getParameter("apas");

	System.out.printf("\napas cna: "+apas);
	System.out.printf("\ntelid cna: "+telid);
	System.out.printf("\npass cna: "+pass);
	System.out.printf("\nlnam cna: "+lnam);
	System.out.printf("\nmno cna: "+mno);
	System.out.printf("\nmid cna: "+mid);
	System.out.printf("\npinc cna: "+pinc);
	System.out.printf("\naddress cna: "+address);
	System.out.printf("\ncity cna: "+city);
	System.out.printf("\nstate cna: "+state);
	System.out.printf("\ndistrict cna: "+district);
	System.out.printf("\ngender cna: "+gender);
	
	String msg="";
	
	int flag=0,flag1=0,flag2=0,flag3=0,flag4=0;
	boolean ok=true,ok1=true,ok2=true,ok3=true,ok4=true;


	if(pass=="" || fnam=="" || lnam=="" || mno=="" || mid=="" || pinc=="" || address=="" || city=="" || district=="")
	{
		msg=" Blank Fields Not Allowed - All Fields Compulsory ";
	}
	else
	{
		// District
		System.out.printf("\nok3 first: "+ok3+"\n");
		System.out.printf("\nDistrict : "+district+"\n");
		char str3[]=district.toCharArray();
		 if(str3.length<=15)   // sql alert isse solve ho rhi h or Array out of bound apne aap solve ho rhi h
		 { 
			for(int i=0;i<str3.length;i++)
			{
				if(((str3[i]>='a' && str3[i]<='z') || (str3[i]>='A' && str3[i]<='Z')) || str3[i]==' ')
				{
					ok3=true;
				}
				else
				{
					ok3=false;
					System.out.printf("\nok3 Second: "+ok3+"\n");
					flag3=1;
					msg="District Must Be In Word";
				}
			}
		 }
		else
		{
			ok3=false;
			System.out.printf("\nok3 Third: "+ok3+"\n");
			flag3=1;
			msg="Enter District, Maximum length Is 15 Word";
		}  
	System.out.printf("\n\nok3 complete"+ok3+"\n");
		
		
	// City
			System.out.printf("\nok4 first: "+ok4+"\n");
			System.out.printf("\nCity : "+city+"\n");
			char str4[]=city.toCharArray();
			 if(str4.length<=15)   // sql alert isse solve ho rhi h or Array out of bound apne aap solve ho rhi h
			 { 
				for(int i=0;i<str4.length;i++)
				{
					if(((str4[i]>='a' && str4[i]<='z') || (str4[i]>='A' && str4[i]<='Z')) || str4[i]==' ')
					{
						ok4=true;
					}
					else
					{
						ok4=false;
						System.out.printf("\nok4 Second: "+ok4+"\n");
						flag4=1;
						msg="City Must Be In Word";
					}
				}
			 }
			else
			{
				ok4=false;
				System.out.printf("\nok4 Third: "+ok3+"\n");
				flag4=1;
				msg="Enter City, Maximum length Is 15 Word";
			}  
		System.out.printf("\n\nok4 complete"+ok4+"\n");
	
		
		// last name
			char str1[]=lnam.toCharArray();
		if(str1.length<=15)
		{
			for(int i=0;i<str1.length;i++)
			{
				if(((str1[i]>='a' && str1[i]<='z') || (str1[i]>='A' && str1[i]<='Z')) || str1[i]==' ')
				{
					ok1=true;
				}
				else
				{
					ok1=false;
					flag1=1;
					msg="Last Name Is Incorrect";
				}
			}
		}
		else
		{
			ok1=false;
			flag1=1;
			msg="Enter Last Name, Maximum length 15 Word";
		}
		
	
		System.out.printf("\n\nok1 : "+ok1);
	
		// First Name
		System.out.printf("\nok first: "+ok+"\n");
		System.out.printf("\nfname : "+fnam+"\n");
		char str[]=fnam.toCharArray();
		 if(str.length<=15)   // sql alert isse solve ho rhi h or Array out of bound apne aap solve ho rhi h
		 { 
			for(int i=0;i<str.length;i++)
			{
				if(((str[i]>='a' && str[i]<='z') || (str[i]>='A' && str[i]<='Z')) || str[i]==' ')
				{
					ok=true;
				}
				else
				{
					ok=false;
					System.out.printf("\nok Second: "+ok+"\n");
					flag2=1;
					msg="First Name Is Incorrect2";
				}
			}
		 }
		else
		{
			ok=false;
			System.out.printf("\nok Third: "+ok+"\n");
			flag2=1;
			msg="Enter First Name, Maximum length Is 15 Word";
		}  
	System.out.printf("\n\nok complete"+ok+"\n");

		char str2[]=mno.toCharArray();
		for(int i=0;i<str2.length;i++)
		{
			if(str2[i]>='0' && str2[i]<='9')
			{
				ok2=true;
			}
			else
			{
				ok2=false;
			}
		}
		System.out.printf("\n\nok2 : "+ok2);
	
		
	
				System.out.printf("\n\nok1 : "+ok1);
					if(mno.length()==10)
					{
						System.out.printf("\n\nmno : "+mno);
						try
						{
							
						double mnu=Double.parseDouble(mno);
						if(ok2 && mnu>0)
						{
						if(pinc.length()==6)
						{
							System.out.printf("\n\npinc : "+pinc);
				
							int pincode=Integer.parseInt(pinc);
							if(pincode>0)
							{
									System.out.printf("\n\npinc : "+pinc);
									flag=1;
							}
							else
							{
								msg="Invalid Pin Code";
							}
						}
						else
						{
							msg="Pin Code Must Be In 6 Digit";
						}
					}
					else
					{
						msg="Mobile Number Must Be Integer";
					}
					}
					catch(NumberFormatException e)
					{
						msg="Mobile Number Must Be Integer";
					}
					}
					
					else
					{
						msg="Mobile Number Must Be In 10 Digits & Must Be Integer";					
					}			
	}
	
	if(flag==1 && flag1==0 && flag2==0 && flag3==0 && flag4==0)
	{
		
%>
<div class="row">
<div class="container">
<div class="col-lg-12 text-center">
	<h1 class="text-primary"><font>www.E-Banking.com</font></h1>
    <h2 class="text-info">Add Teller</font></h2>
    <h2 class="text-danger"><font>Confirm Your Details </font></h2>

</div>
</div>
</div>
<div class="row">
<div class="container">
<form action="teladdteller.jsp">
<div class="col-lg-3  text-right text-primary"><h3><font> 1) Personal Details :- </h3></div><br><br>
<div class="col-lg-6 text-center form-group">
<table class="table">
<tr>
<td>Teller Id </td>
<td><%=telid%></td>
</tr>       
<tr>
<td><font>Admin Id </td>
<td><%=aid%></td>
</tr>       
<tr>
<td><font>First Name </td>
<td><%=fnam %></td>
</tr>       
<tr>
<td><font>Last Name </td>
<td><%=lnam %></td>
</tr>
<tr>
<td><font>Gender </td>
<td><%=gender %></td>
</tr>    
<tr>
<td><font>Password </td>
<td><%=pass %></td>
</tr>       
<tr>
<td><font>Mobile NO</td>
<td><%=mno %></td>
</tr>       
<tr>
<td><font>Email Id</td>
<td><%=mid %></td>
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
<td><font>State</td>
<td><%=state %></td>
</tr> 
<tr>
<td><font>District</td>
<td><%=district %></td>
</tr>       
<tr>
<td><font>City</td>
<td><%=city %></td>
</tr>     
<tr>
<td><font>Zip/Postal Code</td>
<td><%=pinc %></td>
</tr>     
<tr>      
<td><font>Address</td>
<td><%=address %></td>
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


<button class="btn btn-block btn-primary mgnbtm">Confirm Add Teller</button>
<input type="hidden" name=telid value=<%=telid %>></input>
<input type="hidden" name="aid" value="<%=aid %>"></input>
<input type="hidden" name="trnid" value="<%=trnid %>"></input>
<input type="hidden" name="apas" value="<%=apas %>"></input>
<input type="hidden" name="fnam" value="<%=request.getParameter("fnam") %>"></input>
<input type="hidden" name="lnam" value="<%=request.getParameter("lnam") %>"></input>
<input type="hidden" name="gender" value="<%=request.getParameter("tt") %>"></input>
<input type="hidden" name="mno" value="<%=request.getParameter("mno") %>"></input>
<input type="hidden" name="mid" value="<%=request.getParameter("mid") %>"></input>
<input type="hidden" name="address" value="<%=request.getParameter("address") %>"></input>
<input type="hidden" name="pinc" value="<%=request.getParameter("pinc") %>"></input>
<input type="hidden" name="city" value="<%=request.getParameter("city") %>"></input>
<input type="hidden" name="district" value="<%=request.getParameter("district") %>"></input>
<input type="hidden" name="state" value="<%=request.getParameter("state") %>"></input>
<input type="hidden" name="pass" value="<%=request.getParameter("pass") %>"></input>
</form>

<form action="addteller.jsp">
<input type="hidden" name="aid" value="<%=aid %>"></input>
<input type="hidden" name="apas" value="<%=apas %>"></input>
<button  name="back" class="btn btn-block btn-danger"> Go Home</button>      
</form>
       </div>
      <div class="col-lg-3"> </div>
     </div>
    </div></body>
</html>


<%
	
	}
	else
	{
		%>
		<div class="row">
			<div class="container">
				<div class="col-lg-12 text-center">
					<h1 class="text-primary"><font>www.E-Banking.com</font></h1>
		            <h2 class="text-info"><font>Add Teller</font></h2>            
		            <h2 class="text-danger">[ <%=msg %> ]</font></h2>

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
		     <td><input type="number" class="form-control" readonly="true" name="aid" value="<%=aid%>"></td>
		    </tr>       
		    <tr>
		     <td><font>First Name </td>
		     <td><input type="text" class="form-control" name="fnam" value=<%=fnam %>></td>
		    </tr>       
		    <tr>
		     <td><font>Last Name </td>
		     <td><input type="text" class="form-control" name="lnam" value=<%=lnam %>></td>
		    </tr>
		    <tr>
		     <td><font>Gender </td>
		     <td><span class="radio-inline"><input type="radio" value="male" checked="true" name="tt">Male</span>
		         <span class="radio-inline mgn-left"><input type="radio" value="female" name="tt">Female</span></td>
		    </tr>
		    <tr>
		     <td><font>Password </td>
		     <td><input type="text" class="form-control" name="pass" value=<%=pass %>></td>
		    </tr>       
		    <tr>
		     <td><font>Mobile NO</td>
		     <td><input type="text" class="form-control" name="mno" value=<%=mno %>></td>
		    </tr>       
		    <tr>
		     <td><font>Email Id</td>
		     <td><input type="email" class="form-control" name="mid" value=<%=mid %>></td>
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
		     <td><font>State</td>
		     <td><select name="state"  class="form-control" >
		     <option ><%=state %></option> 
		     </select>
		       </td>
		    </tr>
		    <tr>
		     <td><font>District</td>
		     <td><input type="text" spellcheck="true" class="form-control" name="district" value=<%=district %>></td>
		    </tr>
		    <tr>
		     <td><font>City</td>
		     <td><input type="text" class="form-control" name="city" value=<%=city %>></td>
		    </tr>
		    <tr>
		     <td><font>Zip/Postal Code</td>
		     <td><input type="number" class="form-control" name="pinc" value=<%=pinc %>></td>
		    </tr>
		    <tr>      
		      <td><font>Address</td>
		      <td><textarea name="address" rows="3"  class="form-control" ><%=address%></textarea></td>
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


		     <button class="btn btn-block btn-primary mgnbtm" name="cna">Add Teller</button>
		     <input type="hidden" name=telid value=<%=request.getParameter("telid") %>></input>
		<input type="hidden" name="aid" value="<%=request.getParameter("aid") %>"></input>
		<input type="hidden" name="trnid" value="<%=request.getParameter("trnid") %>"></input>
		<input type="hidden" name="apas" value="<%=apas %>"></input>
		</form>

		<form action="admin.jsp">
		<input type="hidden" name="aid" value="<%=aid %>"></input>
		<input type="hidden" name="apas" value="<%=apas %>"></input>

		     <button  name="back" class="btn btn-block btn-danger"> Go Home</button>      
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
