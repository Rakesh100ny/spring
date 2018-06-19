<%@ include file="tellerps.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.String.*" %>


<%
	String actid=request.getParameter("actid");
    String tid=request.getParameter("tid");
	String fnam=request.getParameter("fnam");
	String lnam=request.getParameter("lnam");
	String gender=request.getParameter("tt");
	String uid=request.getParameter("uid");
	String pass=request.getParameter("pass");
	String mno=request.getParameter("mno");
	String mid=request.getParameter("mid");
	String address=request.getParameter("address");
	String pinc=request.getParameter("pinc");
	String city=request.getParameter("city");
	String district=request.getParameter("district");
	String state=request.getParameter("state");
	String obal1=(request.getParameter("obal"));
	String tpas=request.getParameter("tpas");

	System.out.printf("\ntpas cna: "+tpas);
	System.out.printf("\nactid cna: "+actid);
	System.out.printf("\nuid cna: "+uid);
	System.out.printf("\npass cna: "+pass);
	System.out.printf("\nlnam cna: "+lnam);
	System.out.printf("\nobal1 cna: "+obal1);
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


	if(obal1=="" || pass=="" || fnam=="" || lnam=="" || mno=="" || mid=="" || uid=="" || pinc=="" || address=="" || city=="" || district=="")
	{
		msg="[ Blank Fields Not Allowed - All Fields Compulsory ]";
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
				getCustuid.setString(1,uid);
				ResultSet rs=getCustuid.executeQuery();
				if(!rs.next())
				{
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
								double obal=Double.parseDouble(obal1);
								if(obal>=0)
								{
									System.out.printf("\n\nobal : "+obal);
									flag=1;
								}
								else	
								{	
									
									
									msg="Balance Is Incorrect";
								}	
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
				else
				{
					msg="User ID Is Already Exist";	
				}
	}
	
	if(flag==1 && flag1==0 && flag2==0 && flag3==0 && flag4==0)
	{
		
%>
<html>
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
					 			<div class="col-lg-12 text-center animated fadeInDown">
					                 <h1><font>Confirmation</font></h1>
					                 <h2><font>Please Check Your Details Carefully For Confirmation.. </font></h2> <br>
					 			</div>
					 		</div>
					 	</div>
					     <div class="row">
					      <div class="container">
					       <div class="col-lg-4"> </div>
					       <div class="col-lg-4 animated fadeInUp text-center">
					       <form action="newact.jsp" method="get" class="role">
				
					        <table class="table">
					         <tr>
					          <td class="text-center"><font > Account Id</td>
					          <td class="text-center"><%=actid%></td>
					         </tr>
					         <tr>
					          <td class="text-center"><font>Teller Id</td>
					          <td class="text-center"><%=tid %></td>
					         </tr>       
					         <tr>
					          <td class="text-center"><font>First Name </td>
					          <td class="text-center"><%=fnam %></td>
					         </tr>
					         <tr>
					          <td class="text-center"><font>Last Name </td>
					          <td class="text-center"><%=lnam %></td>
					         </tr>       
					         <tr>
					          <td class="text-center"><font>Gender</td>
					          <td class="text-center"><%=gender %></td>
					         </tr>       
					         <tr>
					          <td class="text-center"><font>uid </td>
					          <td class="text-center"><%=uid %></td>
					         </tr>       
					         <tr>
					          <td class="text-center"><font>Password </td>
					          <td class="text-center"><%=pass %></td>
					         </tr>
					         <tr>
					          <td class="text-center"><font>Mobile no</td>
					          <td class="text-center"><%=mno %></td>
					         </tr>       
					         <tr>
					          <td class="text-center"><font>Email Id</td>
					          <td class="text-center"><%=mid %></td>
					         </tr>
					         <tr>
					          <td class="text-center"><font>Address</td>
					          <td class="text-center"><%=address %></td>
					         </tr>       
					          <tr>
						         <tr>
						          <td class="text-center"><font>Zip/ Postal Code</td>
						          <td class="text-center"><%=pinc %></td>
						         </tr>       

					         <tr>
					          <td class="text-center"><font>City</td>
					          <td class="text-center"><%=city %></td>
					         </tr>       

					         <tr>
					          <td class="text-center"><font>District</td>
					          <td class="text-center"><%=district %></td>
					         </tr>       

					         <tr>
					          <td class="text-center"><font>State</td>
					          <td class="text-center"><%=state %></td>
					         </tr>       

					            <td class="text-center"><font>Openning Balance </td>
					            <td class="text-center"><%=obal1 %></td>
					         </tr>       
				
					        </table>

<input type="hidden" name=actid value=<%=actid %>></input>
<input type="hidden" name="uid" value=<%=uid %>></input>
<input type="hidden" name="trnid" value=<%=trnid %>></input>
<input type="hidden" name="tid" value=<%=tid %>></input>
<input type="hidden" name="tpas" value=<%=tpas %>></input>
<input type="hidden" name="fnam" value=<%=request.getParameter("fnam") %>></input>
<input type="hidden" name="lnam" value=<%=request.getParameter("lnam") %>></input>
<input type="hidden" name="gender" value=<%=request.getParameter("tt") %>></input>
<input type="hidden" name="mno" value=<%=request.getParameter("mno") %>></input>
<input type="hidden" name="mid" value=<%=request.getParameter("mid") %>></input>
<input type="hidden" name="address" value=<%=request.getParameter("address") %>></input>
<input type="hidden" name="pinc" value=<%=request.getParameter("pinc") %>></input>
<input type="hidden" name="city" value=<%=request.getParameter("city") %>></input>
<input type="hidden" name="district" value=<%=request.getParameter("district") %>></input>
<input type="hidden" name="state" value=<%=request.getParameter("state") %>></input>
<input type="hidden" name="obal" value=<%=request.getParameter("obal") %>></input>
<input type="hidden" name="pass" value=<%=request.getParameter("pass") %>></input>
					        <button class="btn btn-block btn-primary">Confirm and Submit</button>
					        </form>
					        <form action="newAccount.jsp">
<input type="hidden" name="tid" value=<%=tid %>></input>
<input type="hidden" name="tpas" value=<%=tpas %>></input>
<button class="btn btn-block btn-danger mgn-top">Edit Details</button>  
</form>
					       </div>
					       <div class="col-lg-4"> </div>
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
	    <style> .mgn-top   {    	margin-top: 5px;	    }	    </style>
	</head>
	<body>
		<div class="row">
			<div class="container">
				<div class="col-lg-12 ">
				     <h1 class="text-info"><font>New Account </font></h1> 
				<h3 class=\"text-danger animated fadeInLeft text-center\"><font><%=msg %></font></h1>
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
	         <td><input type="text" class="form-control" name="fnam" value=<%=fnam %>></td>
	        </tr>
	        <tr>
	         <td><font>Last Name </td>
	         <td><input type="text" class="form-control" name="lnam" value=<%=lnam %>></td>
	        </tr>       
	        <tr>
	         <td><font>Sex </td>
	         <td><span class="radio-inline"><input type="radio" value="male" checked="true" name="tt">Male</span>
	             <span class="radio-inline mgn-left"><input type="radio" value="female" name="tt">Female</span></td>
	        </tr>       
	        <tr>
	         <td><font>User Id </td>
	         <td><input type="text" class="form-control" name="uid" value=<%=uid %>></td>
	        </tr>

	        <tr>
	         <td><font>Password </td>
	         <td><input type="password" class="form-control" name="pass" value=<%=pass %>></td>
	        </tr>
	        <tr>
	         <td><font>Moblie No</td>
	         <td><input type="number" class="form-control" name="mno" value=<%=mno %>></td>
	        </tr>
	        <tr>
	         <td><font>Email Id</td>
	         <td><input type="email" class="form-control" name="mid" value=<%=mid %>></td>
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
          <td><textarea name="address" rows="3"  class="form-control"><%=address%></textarea></td>
        </tr>       
        <tr>
         <td><font>Zip/Postal Code</td>
         <td><input type="number" class="form-control" name="pinc" value=<%=pinc %>></td>
        </tr>       
        <tr>
         <td><font>City</td>
         <td><input type="text" class="form-control" name="city" value=<%=city %>></td>
        </tr>       
        <tr>
         <td><font>District</td>
         <td><input type="text" spellcheck="true" class="form-control" name="district" value=<%=district %>></td>
        </tr>       
        <tr>
         <td><font>State</td>
         <td><select name="state"  class="form-control">
         	  <option> <%=state %></option>    
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
         <td><input type="number" class="form-control" name="obal" value=<%=obal1 %>></td>
        </tr>       
      </table>
<input type="hidden" name=actid value=<%=request.getParameter("actid") %>></input>
		<input type="hidden" name="uid" value="<%=request.getParameter("uid") %>"></input>
		<input type="hidden" name="trnid" value="<%=request.getParameter("trnid") %>"></input>
			<input type="hidden" name="tid" value=<%=tid %>></input>
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
		<%	
	}
%>
