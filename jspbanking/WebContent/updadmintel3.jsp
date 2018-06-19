<%@page import="com.mysql.jdbc.SQLError"%>
<%@ include file="adminps.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.String.*" %>
<%@ page import="java.sql.Date" %>
<html>
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
    String teid=request.getParameter("teid");
String tid=request.getParameter("tid");
    String aid=request.getParameter("aid");
    String adid=request.getParameter("adid");
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
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
	String msg="";
	
	int flag=0,flag1=0,flag2=0,flag3=0,flag4=0;
	boolean ok=true,ok1=true,ok2=true,ok3=true,ok4=true;

	if(pass=="" || fname=="" || lname=="" || mno=="" || mid=="" || pinc=="" || address=="" || city=="" || district=="")
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
			char str1[]=lname.toCharArray();
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
		System.out.printf("\nfname : "+fname+"\n");
		char str[]=fname.toCharArray();
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
		
		
		//mobile no
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
		Date dot=new Date(new java.util.Date().getTime());

		try
		{
			updtel.setString(1,pass);
			updtel.setString(2,fname);
			updtel.setString(3,lname);
			updtel.setString(4,gender);
			updtel.setString(5,mno);
			updtel.setString(6,mid);
			updtel.setString(7,address);
			updtel.setString(8,pinc);
			updtel.setString(9,city);
			updtel.setString(10,district);
			updtel.setString(11,state);
			updtel.setString(12,teid);
			updtel.executeUpdate();
			
			%>
			  <div class="row">
			   <div class="container">
			   
			    <div class="col-lg-12 text-center">
			     <h3><font class="text-success"><i class="glyphicon glyphicon-ok"></i>&nbsp;Update Account Successfully..!</h3><br>
			
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
			System.err.println("\nSQL Alert[updadminact3.jsp]..."+e.getMessage()+"\n");
		}

	}
	else
	{
		%>
			<div class="row">
			<div class="container">
				<div class="col-lg-12 text-center">
					<h1 class="text-primary"><font>www.E-Banking.com</font></h1>
		            <h2 class="text-info"><font>New Account </font></h2>            
		            <h2 class="text-danger">[ <%=msg %> ]</font></h2>

				</div>
			</div>
		</div>
		<div class="row">
		 <div class="container">
		<form action="updadmintel3.jsp">
		  <div class="col-lg-3  text-right text-primary"><h3><font> 1) Personal Details :- </h3></div><br><br>
		  <div class="col-lg-6 text-center form-group">
		   <table class="table">
		    <tr>
		     <td>Teller Id </td>
		     <td><input type="number" class="form-control" readonly="true" name="teid" value="<%=teid%>"></td>
		    </tr>       
		    <tr>
		     <td><font>Admin Id </td>
		     <td><input type="number" class="form-control" readonly="true" name="adid" value="<%=adid%>"></td>
		    </tr>       
		    <tr>
		     <td><font>First Name </td>
		     <td><input type="text" class="form-control" name="fname" value=<%=fname %>></td>
		    </tr>       
		    <tr>
		     <td><font>Last Name </td>
		     <td><input type="text" class="form-control" name="lname" value=<%=lname %>></td>
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
		      <td><font>Address</td>
		      <td><textarea name="address" rows="3"  class="form-control" ><%=address%></textarea></td>
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
         <td><select name="state" class="form-control">
         	  <option><%=state%></option>
              <option> AANDHRA PRADESH</option>
              <option> ARUNACHAL PRADESH</option>
              <option> ASSAM </option>
              <option> BIHAR</option>
              <option> CHHATTISGARH</option>
              <option> GOA</option>
              <option> GUJARAT</option>
              <option> HARYANA</option>
              <option> HIMACHAL PRADESH</option>
              <option> JAMMU & KASHMIR</option>
              <option> JHARKHAND</option>
              <option> KARNATAKA</option>
              <option> KERALA</option>
              <option> MADHYA PRADESH</option>
              <option> MAHARASHTRA</option>
              <option> MANIPUR</option>
              <option> MEGHALAYA</option>
              <option> MIZORAM</option>
              <option> NAGALAND</option>
              <option> ODISHA</option>
              <option> PUNJAB</option>
              <option> RAJASTHAN</option>
              <option> SIKKIM</option>
              <option> TAMIL NADU</option>
              <option> TELANGANA</option>
              <option> TRIPURA</option>
              <option> UTTAR PRADESH</option>
              <option> UTTARAKHAND</option>
              <option> WEST BENGAL</option>
              </select>
           </td>
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

		     <button class="btn btn-block btn-primary mgnbtm" name="cna">Update Account</button>
			<input type="hidden" name="aid" value=<%=aid %>></input>
		<input type="hidden" name="apas" value="<%=apas %>"></input>
		</form>

		<form action="updadmintel1.jsp">
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
	%>