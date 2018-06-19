<%@page import="java.util.*"%>
<%@ include file="contactusps.jsp" %>

<%
String fnam,lnam,mno,mid,sub,msg;
fnam=request.getParameter("fnam");
lnam=request.getParameter("lnam");
mno=request.getParameter("mno");
mid=request.getParameter("mid");
sub=request.getParameter("sub");
msg=request.getParameter("msg");

System.out.printf("\nfnam : "+fnam);
System.out.printf("\nlnam : "+lnam);
System.out.printf("\nmno : "+mno);
System.out.printf("\nmid : "+mid);
System.out.printf("\nsub : "+sub);
System.out.printf("\nmsg : "+msg);


int flag=0,flag1=0,flag2=0,flag4=0;
boolean ok=true,ok1=true,ok2=true,ok4=true;

String text="";

if(fnam!="" && lnam!="" && mno!="" && mid!="" && sub!="" && msg!="")
{
try
{
	
	// Sub
				System.out.printf("\nok4 first: "+ok4+"\n");
				System.out.printf("\nSub : "+sub+"\n");
				char str4[]=sub.toCharArray();
				 if(str4.length<=50)   // sql alert isse solve ho rhi h or Array out of bound apne aap solve ho rhi h
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
							text="Subject Must Be In Word";
						}
					}
				 }
				else
				{
					ok4=false;
					System.out.printf("\nok4 Third: "+ok4+"\n");
					flag4=1;
					text="Enter Subject, Maximum length Is 50 Word";
				}  
			System.out.printf("\n\nok4 complete"+ok4+"\n");
		
			
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

//lname
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
				text="Last Name Is Incorrect";
			}
		}
	}
	else
	{
		ok1=false;
		flag1=1;
		text="Enter Last Name, Maximum length 15 Word";
	}
	

	System.out.printf("\n\nok1 : "+ok1);

	// First Name
	System.out.printf("\nok first: "+ok+"\n");
	System.out.printf("\nfnam : "+fnam+"\n");
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
				text="First Name Is Incorrect2";
			}
		}
	 }
	else
	{
		ok=false;
		System.out.printf("\nok Third: "+ok+"\n");
		flag2=1;
		text="Enter First Name, Maximum length Is 15 Word";
	}  
System.out.printf("\n\nok complete"+ok+"\n");
	
	
if(mno.length()==10)
{
	System.out.printf("\n\nmno : "+mno);
	try
	{					
	double mnu=Double.parseDouble(mno);
	if(ok2 && mnu>0)
	{
		flag=1;
	insContact.setString(1,fnam);
	insContact.setString(2,lnam);
	insContact.setString(3,mno);
	insContact.setString(4,mid);
	insContact.setString(5,sub);
	insContact.setString(6,msg);

	insContact.executeUpdate();

	}
	else
	{
		text="Mobile Number Must Be Integer";
	}
	}
	catch(NumberFormatException e)
	{
		text="Mobile Number Must Be Integer";
	}
	}
	
	else
	{
		text="Mobile Number Must Be In 10 Digits & Must Be Integer";					
	}		
}
catch(SQLException e)
{	
	System.err.println("\nSQL Alert[contactus1.jsp]..."+e.getMessage()+"\n");
}
}
else
{
	text="Blank Fields Not Allowed - All Fields Compulsory";
	flag=0;
}
if(flag==1 && flag1==0 && flag2==0 && flag4==0)
{
	%>
	
	<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="bs/css/bootstrap.min.css">
   <link href="bs/css/pnc-com.fancyBox.min.css">
   <script src="bs/js/jquery.min.js"></script>
   <script src="bs/js/bootstrap.min.js"></script>
 
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    .mgn-btn
    {
    	margin-top:10px;
    }
    
    /* Add a gray background color and some padding to the footer */
   
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 340px) {
    .carousel-caption {
	  font-size-adjust:inherit;	
      display: none;
    }
  }
  

.card {
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
    border-radius: 5px;
	margin:0 auto;
}
.mgn-left
{
margin-left: 60px;
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2)
}

img {
    border-radius: 5px 5px 0 0;
}
.mgn-left3
{
margin-left:20px; 
}
.container {
    padding: 2px 16px;
}

.mgn-left2
{
 margin-left:5px;  
}

  </style>
</head>
<body style=" background-size: cover;">
<nav class="navbar navbar-inverse navbar-fixed-top" >
  <div class="container-fluid ">
    <div class="navbar-header" >
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
      </button>
      <i class="navbar-brand" style="padding: 0px; " ><img src="image/savboj.png"></img></i>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav " >
        <li><a href="index.html">Home</a></li>
        <li><a href="aboutus.html" >About</a></li>
        <li class="active" ><a href="contactus.html" >Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right ">
        <li><a href="homeCust.html"><span class="glyphicon glyphicon-log-in "></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>


<div class="jumbotron card" style="background-color:#f58025;  padding-top:70px;">
  <div class="container text-left" style="color:#FFF">
    <h1>Online & Mobile Banking</h1>
    <p><font face="Comic Sans MS, cursive" color="#000000">Online Banking provides you with the tools to take control of your money and to simplify how you manage your finances. It's FREE,easy and secure!</font><br>
    <font face="Lucida Sans Unicode, Lucida Grande, sans-serif"><span style="margin-left: 350px;"> - Bank of JODHANA</span></font></p>
  </div>
</div>


<div id="myCarousel" class="carousel slide card" data-ride="carousel">
    <!-- Wrapper for slides -->
    <div class="carousel-inner " role="listbox">
      <div class="item active" style="width:100%; height:70%; background-color:#CCC;"> 
      <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14368.724289114702!2d73.2914628!3d25.7975997!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x2beffcb914b6406e!2sJIET!5e0!3m2!1sen!2sin!4v1491280784062" width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen></iframe>
      </div>
    </div>
<div class="container well" style="background-color:#ccc; margin:0 auto; padding:0px;">
  <h1 class="text-center" style="border-bottom:1px dotted #999;"><font face="Comic Sans MS, cursive" size="+3">Contact Us</font>
 <div class="col-lg-1"></div>
 <div class="col-lg-10">
   <div class="container">
    <div class="col-lg-5"><br>
		<form action="contactus1.jsp" method="get">
		<h4><font class="text-primary">Query Submitted Successfully</font></h4>
           <table class="table-condensed mgn-left">
            <tr>
             <td><font>First Name</font> </td>
             <td><input type="text" class="form-control" name="fnam"></td>
            </tr>       
            <tr>
             <td><font>Last Name</font> </td>
             <td><input type="text" class="form-control" name="lnam"></td>
            </tr>       
            <tr>
             <td><font>Mobile NO</font></td>
             <td><input type="number" class="form-control" name="mno"></td>
            </tr>       
            <tr>
             <td><font>Email Id</font></td>
             <td><input type="email" class="form-control" name="mid"></td>
            </tr>
            <tr>
             <td><font>Subject</font></td>
             <td><input type="text" class="form-control" name="sub"></td>
            </tr>       
            <tr>      
              <td><font>Address</font></td>
              <td><textarea name="msg" rows="3"  class="form-control"></textarea></td>
            </tr>       
          </table>
          
          <button class="btn btn-primary center-block mgn-btn">Submit</button>
          </form>
    </div>
    <div class="col-lg-1"></div>
    <div class="col-lg-6"><br>
        <h2 class="text-left text-primary"><font face="Time new Roman">Our Address</font></h2>
        <h1 class="text-left text-danger" ><font face="Time new Roman"><i>Bank of JODHANA</i></font></h1>
      <h4 class="text-left text-success"><font face="Time new Roman"><i class="glyphicon glyphicon-map-marker">A-99 Rameshwar Nagar,<br> 
        <span class="mgn-left3">Basni 1st Phase,(342005)</span><br>
        <span class="mgn-left3">Jodhpur, Rajasthan</span></i></font></h4>
        
                <h4 class="text-left  text-primary"><i class="glyphicon glyphicon-phone-alt"><span class="mgn-left2">Tel</span><span style="margin-left:16px; ">:</span><span class="mgn-left2">0291-222085</span></i></h4>
                <h4 class="text-left  text-primary"><i class="glyphicon glyphicon-phone"><span class="mgn-left2">Mob</span><span class="mgn-left2">:</span><span class="mgn-left2">09680701900 <br><span style="margin-left: 73px;">08290771900</span></span></i></h4>   
    </div>
   </div>
  </div>
 <div class="col-lg-1"></div>
</div>
<footer class="row text-center" style="background-color: #101010; height: 40px; padding-top: 10px; ">
  <div class="container-fluid">
   <font face="Lucida Sans Unicode, Lucida Grande, sans-serif"  color="#fff">Copyright©2017 JIET Students. All Rights Reserved | Designed & Developed by - Baberwal Brothers</font>
  </div>
</footer>

</body>
</html>	
<% 
}
else
{	
%>
	<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="bs/css/bootstrap.min.css">
   <link href="bs/css/pnc-com.fancyBox.min.css">
   <script src="bs/js/jquery.min.js"></script>
   <script src="bs/js/bootstrap.min.js"></script>
 
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    .mgn-btn
    {
    	margin-top:10px;
    }
    .mgn-left2
    {
     margin-left:5px;  
    }

    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 340px) {
    .carousel-caption {
	  font-size-adjust:inherit;	
      display: none;
    }
  }
  

.card {
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
    border-radius: 5px;
	margin:0 auto;
}
.mgn-left
{
margin-left: 60px;
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2)
}
.mgn-left3
{
margin-left:20px; 
}

img {
    border-radius: 5px 5px 0 0;
}

.container {
    padding: 2px 16px;
}

  </style>
</head>
<body style=" background-size: cover;">
<nav class="navbar navbar-inverse navbar-fixed-top" >
  <div class="container-fluid ">
    <div class="navbar-header" >
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
      </button>
      <i class="navbar-brand" style="padding: 0px; " ><img src="image/savboj.png"></img></i>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav " >
        <li><a href="index.html">Home</a></li>
        <li><a href="aboutus.html">About</a></li>
        <li class="active" ><a href="contactus.html">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right ">
        <li><a href="homeCust.html"><span class="glyphicon glyphicon-log-in "></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>


<div class="jumbotron card" style="background-color:#f58025;  padding-top:70px;">
  <div class="container text-left" style="color:#FFF">
    <h1>Online & Mobile Banking</h1>
    <p><font face="Comic Sans MS, cursive" color="#000000">Online Banking provides you with the tools to take control of your money and to simplify how you manage your finances. It's FREE,easy and secure!</font><br>
    <font face="Lucida Sans Unicode, Lucida Grande, sans-serif"><span style="margin-left: 350px;"> - Bank of JODHANA</span></font></p>
  </div>
</div>

<div id="myCarousel" class="carousel slide card" data-ride="carousel">
    <!-- Wrapper for slides -->
    <div class="carousel-inner " role="listbox">
      <div class="item active" style="width:100%; height:70%; background-color:#CCC;"> 
      <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14368.724289114702!2d73.2914628!3d25.7975997!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x2beffcb914b6406e!2sJIET!5e0!3m2!1sen!2sin!4v1491280784062" width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen></iframe>
      </div>
    </div>
<div class="container well" style="background-color:#ccc; margin:0 auto; padding:0px;">
  <h1 class="text-center" style="border-bottom:1px dotted #999;"><font face="Comic Sans MS, cursive" size="+3">Contact Us</font>
 <div class="col-lg-1"></div>
 <div class="col-lg-10">
   <div class="container">
    <div class="col-lg-5"><br>
		<form action="contactus1.jsp" method="get">
		<h4><font class="text-danger">[<%=text %>]</font></h4>
           <table class="table-condensed mgn-left">
            <tr>
             <td><font>First Name</font> </td>
             <td><input type="text" class="form-control" name="fnam"  value="<%=fnam%>"></td>
            </tr>       
            <tr>
             <td><font>Last Name</font> </td>
             <td><input type="text" class="form-control" name="lnam" value="<%=lnam%>"></td>
            </tr>       
            <tr>
             <td><font>Mobile NO</font></td>
             <td><input type="number" class="form-control" name="mno" value="<%=mno%>"></td>
            </tr>       
            <tr>
             <td><font>Email Id</font></td>
             <td><input type="email" class="form-control" name="mid" value="<%=mid%>"></td>
            </tr>
            <tr>
             <td><font>Subject</font></td>
             <td><input type="text" class="form-control" name="sub" value="<%=sub%>"></td>
            </tr>       
            <tr>      
              <td><font>Address</font></td>
              <td><textarea name="msg" rows="3"  class="form-control"><%=msg%></textarea></td>
            </tr>       
          </table>
          
          <button class="btn btn-primary mgn-btn">Submit</button>
          </form>
    </div>
    <div class="col-lg-1"></div>
    <div class="col-lg-6"><br>
        <h2 class="text-left text-primary"><font face="Time new Roman">Our Address</font></h2>
        <h1 class="text-left text-danger" ><font face="Time new Roman"><i>Bank of JODHANA</i></font></h1>
       <h4 class="text-left text-success"><font face="Time new Roman"><i class="glyphicon glyphicon-map-marker">A-99 Rameshwar Nagar,<br> 
        <span class="mgn-left3">Basni 1st Phase,(342005)</span><br>
        <span class="mgn-left3">Jodhpur, Rajasthan</span></i></font></h4>
          
       <h4 class="text-left  text-primary"><i class="glyphicon glyphicon-phone-alt"><span class="mgn-left2">Tel</span><span style="margin-left:16px; ">:</span><span class="mgn-left2">0291-222085</span></i></h4>
        
        <h4 class="text-left  text-primary"><i class="glyphicon glyphicon-phone"><span class="mgn-left2">Mob</span><span class="mgn-left2">:</span><span class="mgn-left2">09680701900 <br><span style="margin-left: 73px;">08290771900</span></span></i></h4>   
    </div>
   </div>
  </div>
 <div class="col-lg-1"></div>
</div>
<footer class="row text-center" style="background-color: #101010; height: 40px; padding-top: 10px; ">
  <div class="container-fluid">
   <font face="Lucida Sans Unicode, Lucida Grande, sans-serif"  color="#fff">Copyright©2017 JIET Students. All Rights Reserved | Designed & Developed by - Baberwal Brothers</font>
  </div>
</footer>

</body>
</html>	
<%
}
%>