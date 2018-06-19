<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ include file="tellerps.jsp" %>

<%
	String tid=request.getParameter("tid");
	String tpas=request.getParameter("pas");
	System.out.printf("\ntid : "+tid);
	System.out.printf("\ntpas : "+tpas);
	System.out.printf("\nactid : "+actid);
	System.out.printf("\ntrnid : "+trnid);
	
	HttpSession ssn=request.getSession(false);
	
	if(ssn==null)
	{
		System.out.println("Session is Created..; File:custmenu.java");
		ssn=request.getSession();
	}
	else
	{
		System.out.println("Session is Already Created..; File:custmenu.java");
	}	
	try
	{
			getPas.setString(1,tid);
			ResultSet rs=getPas.executeQuery();
			
			boolean ok=true;
			if(rs.next())
			{
				ok=rs.getString("passwd").equals(tpas);
			}
			else
				ok=false;
			if(ok)
			{
				%>
<html>
	    	<head>
	    	 <meta charset="utf-8">
	         <meta name=viewport content="device-width,initial-scale=1">
	    	 <link rel=stylesheet href="bs/css/bootstrap.min.css">
	    	 <link rel="stylesheet" href="bs/css/animate.css">
	         <style>
	    	  .mgn-btm{margin-bottom:5px;}
	         
	    	 </style>
	    	</head>
	        <body style="background: url(image/paisa.jpg) no-repeat center center fixed;background-size: cover;">
	    	   	<div class="row ">
	    	   		<div class="container">
	    	   			<div class="col-lg-12 text-Left text-danger animated fadeInLeft">
	    	   				<h1><font face="Comic Sans MS, cursive">Teller Menu</font></h1>
	    	   			</div>
	    	   		</div>
	    	   	</div>

	    	    <div class="row">
	    	     <div class="container">
	    	      <div class="col-lg-6 animated fadeInLeft">
	    	       <div class="text-center" style="background-color:#665851; margin-top: 0; border-radius:5px 5px 0 0;"><br>
	                 <font color="#FFFFFF" size="+2">Please select a transaction</font>
	    	        </div>
	    	 	    <div style="background-color:#FFF" class="well">

   	         <a href="newAccount.jsp?tid=<%=tid%>&tpas=<%=tpas%> "><button class="btn btn-block btn-primary mgn-btm" name="nAcc">NEW ACCOUNT</button></a>
	         <a href="transaction.jsp?tid=<%=tid%>&tpas=<%=tpas%> "><button class="btn btn-block btn-primary mgn-btm" name="trn">TRANSACTION</button></a>
	          <a href="updact1.jsp?tid=<%=tid%>&tpas=<%=tpas%> "><button class="btn btn-block btn-primary mgn-btm" name="actinfo">ACCOUNTS DETAILS</button></a>
	         <a href="canceltransaction.jsp?tid=<%=tid%>&tpas=<%=tpas%> "><button class="btn btn-block btn-primary mgn-btm" name="cantrn">CANCEL TRANSACTION</button></a>
	         <a href="changepas.jsp?tid=<%=tid%>&tpas=<%=tpas%> "><button class="btn btn-block btn-primary mgn-btm" name="chnpss">CHANGE PASSWORD</button></a>
	         <a href="deleteact.jsp?tid=<%=tid%>&tpas=<%=tpas%> "><button class="btn btn-block btn-primary mgn-btm" name="delAcc">DELETE ACCOUNT</button></a>
	          <a href="tellogin.html"><button class="btn btn-block btn-primary">LOGOUT</button></a>
	        </div>
	        </div>
	       <div class="col-lg-3"></div>
	       <div class="col-lg-3"></div>
	      </div>
	     </div>
	
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
  <meta name="viewport">
  <link rel=stylesheet href="bs/css/bootstrap.min.css">
  
  <style>
  
    <style>
    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
  
    
   .mgn-top
   {
    margin-top:60px; 
   }
  </style>
</head>
<body style="background-color:#CCCCCC">

<nav class="navbar navbar-inverse navbar-fixed-top" >
  <div class="container-fluid ">
    <div class="navbar-header" >
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
      </button>
      <i class="navbar-brand" style="padding: 0px; " ><img src="image/savboj.png"></img></i>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav " >
        <li class="active" ><a href="index.html" >Home</a></li>
        <li><a href="aboutus.html" >About</a></li>
        <li><a href="contactus.html" >Contact</a></li>
      </ul>       
      <ul class="nav navbar-nav navbar-right ">
        <li><a href="homeCust.html"><span class="glyphicon glyphicon-log-in "></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="row">
			<div class="container  mgn-top Text-center">
					<h3><font class="Text-danger">[ Invalid Login-Id & Password ]</font></h3>
			</div>
		</div>

	<div class="row ">
		<div class="container">
			<div class="col-md-3"></div>
			 <div class="col-md-6 ">
              <div class="text-center" style="background-color:#665851; margin: 0px auto; border-radius:5px 5px 0 0;"><br>
				  <font color="#FFFFFF" size="+2">Login As </font>
			  </div>
			  <div style="background-color:#FFF" class="well">
	   
	               <img src="image/img_avatar2.png" class="img-circle center-block" width="45%" height="40%"></img><br>
  <form action="teller.jsp" method="get" class="role">
                   
				   <div class="input-group">
                        <span class="input-group-addon ">
                            <i class="glyphicon glyphicon-user"></i>
                        </span>
                        <input type="text" class="form-control" placeholder="Enter Teller ID" name="tid">
                    </div>
                    <br/>
					<div class="input-group">
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-lock"></i>
                        </span>
                        <input type="password" class="form-control" placeholder="Enter Password" name="pas">
                    </div><br>
					<button type="submit" class="btn btn-success btn-block" >Login</button><br>
					</form>
									<a href="index.html"> <button type="submit" class="btn btn-danger"> <i class="glyphicon glyphicon-home">&nbsp;Home</i></button></a>
                         <a href="ForgotPass" class="pull-right">Forgot Password ? </a>
					
					</div>
                    </div>
			<div class="col-md-3"></div>
		</div>
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
	}
	catch(SQLException e)
	{
		System.out.println("\nSQL Alert[teller.jsp]...."+e.getMessage()+"\n");		
	}
%>
