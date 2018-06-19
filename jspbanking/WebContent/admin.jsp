<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ include file="adminps.jsp" %>

<%
	String aid=request.getParameter("aid");
	String apas=request.getParameter("apas");
	System.out.printf("\naid : "+aid);
	System.out.printf("\napas : "+apas);
	System.out.printf("\ntrnid : "+trnid);
	
	HttpSession ssn=request.getSession(false);
	String fname="",lname="";
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
			getPas.setString(1,aid);
			ResultSet rs=getPas.executeQuery();
			
			boolean ok=true;
			if(rs.next())
			{
				ok=rs.getString("apas").equals(apas);
				fname=rs.getString("fname");
				lname=rs.getString("lname");
				
			}
			else
				ok=false;
			if(ok)
			{
				%>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" >
  <link rel=stylesheet href="bs/css/bootstrap.min.css">
  <link rel="stylesheet" href="bs/css/animate.css">
  <style>
   .mgn-letf
   {
	 margin-left:60px;  
   }
   .chip 
   {
    display: inline-block;
    padding: 0 25px;
    height: 80px;
    font-size: 18px;
    line-height: 75px;
    border-radius: 40px;
	color:#000;
    background-color: #f1f1f1;
	margin-top:10px;
	margin-left:5px;
  }
  .chip img 
  {
    float: left;
    margin: 0 10px 0 -25px;
    height: 80px;
    width: 80px;
    border-radius: 50%;
  }
/* The side navigation menu */
.sidenav 
{
    height: 100%; /* 100% Full-height */
    width: 0; /* 0 width - change this with JavaScript */
    position: fixed; /* Stay in place */
    z-index: 1; /* Stay on top */
    top: 0;
    left: 0;
    background-color: #111; /* Black*/
    overflow-x: hidden; /* Disable horizontal scroll */
    padding-top: 60px; /* Place content 60px from the top */
    transition: 0.5s; /* 0.5 second transition effect to slide in the sidenav */

}

/* The navigation menu links */
.sidenav a 
{
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 16px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover, .offcanvas a:focus
{
    color: #f1f1f1;
}

/* Position and style the close button (top right corner) */
.closebtn 
{
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px !important;
    margin-left: 50px;
}
.mgn-left
{
 margin-left:5px;	
}

/* Style page content - use this if you want to push the page content to the right when you open the side navigation */
#main
{
    transition: margin-left .5s;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
    .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>
<script>
/* Set the width of the side navigation to 250px and the left margin of the page content to 250px and add a black background color to body */
function openNav() {
    document.getElementById("mySidenav").style.width = "270px";
    document.getElementById("main").style.marginLeft = "270px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0, and the background color of body to white */
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
    document.body.style.backgroundColor = "white";
}</script>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onClick="closeNav()">&times;</a>
    
    <a href="addteller.jsp?aid=<%=aid%>&apas=<%=apas%> "><i class="glyphicon glyphicon-plus"><span class="mgn-left">Add_Teller</span></i></a>
    <a href="updadmintel1.jsp?aid=<%=aid%>&apas=<%=apas%> "><i class="glyphicon glyphicon-edit"><span class="mgn-left">Edit_Teller</span></i></a>
    <a href="delteller.jsp?aid=<%=aid%>&apas=<%=apas%> "><i class="glyphicon glyphicon-remove"><span class="mgn-left">Resign_Teller</span></i></a>
    <a href="MakeTrans1.jsp?aid=<%=aid%>&apas=<%=apas%> "><i class="glyphicon glyphicon-credit-card"><span class="mgn-left">TRANSACTION</span></i></a>
    <a href="CancelTrans1.jsp?aid=<%=aid%>&apas=<%=apas%> "><i class="glyphicon glyphicon-remove"><span class="mgn-left">CANCEL_TRANSACTION</span></i></a>
    <a href="addAct1.jsp?aid=<%=aid%>&apas=<%=apas%> "><i class="glyphicon glyphicon-plus"><span class="mgn-left">Add_Customer</span></i></a>
    <a href="updadminact1.jsp?aid=<%=aid%>&apas=<%=apas%> "><i class="glyphicon glyphicon-edit"><span class="mgn-left">Edit_Customer</span></i></a>
    <a href="delCustAct1.jsp?aid=<%=aid%>&apas=<%=apas%> "><i class="glyphicon glyphicon-remove"><span class="mgn-left">Delete_Customer</span></i></a>
    <a href="ViewEnq1.jsp?aid=<%=aid%>&apas=<%=apas%> "><i class="glyphicon glyphicon-file"><span class="mgn-left">Customer_Enquiry</span></i></a>
    <a href="admin.html"><i class="glyphicon glyphicon-log-out"><span class="mgn-left">Logout</span></i></a>
</div>

<!-- Use any element to open the sidenav -->

<!-- Add all page content inside this div if you want the side nav to push page content to the right (not used if you only want the sidenav to sit on top of the page -->
<div id="main">
   <header class="media-heading row" style="background-color:#232a30;height:100px;">
    <div class="col-lg-12">
    <div class="chip animated fadeInLeft">
     <a href="updadmin1.jsp?aid=<%=aid%>&apas=<%=apas%> "><img src="image/admin_login.png" alt="Person"></a>
     <span onClick="openNav()"><font face="Georgia, Times New Roman, Times, serif" size="+2"><%=fname %> <%=lname %></font></span>
    </div>
     <span class="pull-right">
      <a href="admin.html" style="color:#FFF;"><i class="glyphicon glyphicon-log-out" style="margin-top:35px; margin-right: 30px;"><font class="mgn-left">Logout</font></i>
      </a>
     </span>
    </div>
   </header>
    
	<div class="row">
		<div class="container-fluid">
			 <div class="col-lg-12"> 
	    	 	    
                    <a href="addteller.jsp?aid=<%=aid%>&apas=<%=apas%> ">
	  			      <div class="demo animated fadeInDown" style="float:left">
                        <img src="image/add employee.png" alt="Person"><br>
                        <h5 class="text-center">ADD TELLER</h5>
                       </div>
                    </a>
                   <a href="updadmintel1.jsp?aid=<%=aid%>&apas=<%=apas%> ">
	  			      <div class="demo animated fadeInUp" style="float:left">
                        <img src="image/edit employee.png" alt="Person"><br>
                        <h5 class="text-center">EDIT TELLER</h5>
                       </div>
                    </a>
                  <a href="delteller.jsp?aid=<%=aid%>&apas=<%=apas%> ">
	  			      <div class="demo animated fadeInDown" style="float:left">
                        <img src="image/delete cust.png" alt="Person"><br>
                        <h5 class="text-center">DELETE TELLER</h5>
                       </div>
                    </a>
                    
                     <a href="MakeTrans1.jsp?aid=<%=aid%>&apas=<%=apas%> ">
	  			      <div class="demo animated fadeInUp" style="float:left">
                        <img src="image/mPay-icon.png" width="256" height="256" alt="Person"><br>
                        <h5 class="text-center">TRANSACTION</h5>
                       </div>
                    </a>
                                        <a href="CancelTrans1.jsp?aid=<%=aid%>&apas=<%=apas%> ">
	  			      <div class="demo animated fadeInDown" style="float:left">
                        <img src="image/38-512.png"  width="280" height="256" alt="Person"><br>
                        <h5 class="tex text-center">CANCEL TRANSACTION</h5>
                       </div>
                    </a>



                     <a href="addAct1.jsp?aid=<%=aid%>&apas=<%=apas%> ">
	  			      <div class="demo animated fadeInUp" style="float:left">
                        <img src="image/create user.png" alt="Person"><br>
                        <h5 class="text-center">ADD CUSTOMER</h5>
                       </div>
                    </a>
                    <a href="updadminact1.jsp?aid=<%=aid%>&apas=<%=apas%> ">
	  			      <div class="demo animated fadeInDown" style="float:left">
                        <img src="image/edit employee.png" alt="Person"><br>
                        <h5 class="text-center">EDIT CUSTOMER</h5>
                       </div>
                    </a>
                    <a href="delCustAct1.jsp?aid=<%=aid%>&apas=<%=apas%> ">
	  			      <div class="demo animated fadeInUp" style="float:left">
                        <img src="image/resign.png" alt="Person"><br>
                        <h5 class="text-center">DELETE CUSTOMER</h5>
                       </div>
                    </a>

                    <a href="ViewEnq1.jsp?aid=<%=aid%>&apas=<%=apas%> ">
	  			      <div class="demo animated fadeInDown" style="float:left">
                        <img src="image/pen_paper_icon.jpg" width="256" height="256" alt="Person"><br>
                        <h5 class="text-center">CUSTOMER ENQUIRY</h5>
                       </div>
                    </a>

    		 </div>
		</div>
	</div>
    <footer class="row panel-footer">
      <div class="col-lg-12  text-center"><font face="Lucida Sans Unicode, Lucida Grande, sans-serif" color="#000">Copyright©2017 JIET Students. All Rights Reserved | Designed & Developed by - R&V Baberwal </font></div>
    </footer>
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
  <link rel="stylesheet" href="bs/css/animate.css">
  <style>
      /* Add a gray background color and some padding to the footer */
   
    
   .mgn-top
   {
    margin-top:5px; 
   }
   .chip {
    display: inline-block;
    padding: 0 25px;
    height: 80px;
    font-size: 18px;
    line-height: 75px;
    border-radius: 40px;
	color:#000;
    background-color: #f1f1f1;
	margin-top:10px;
	margin-left:5px;
}

.chip img {
    float: left;
    margin: 0 10px 0 -25px;
    height: 80px;
    width: 80px;
    border-radius: 50%;
}

</style>

</head>
<body style="background-color:#CCCCCC">
   <header class="media-heading row" style="background-color:#232a30;height:100px;">
    <div class="col-lg-12">
    <div class="chip animated fadeInLeft">
     <img src="image/img_avatar2.png" alt="Person">
     <font face="Georgia, Times New Roman, Times, serif" size="+2">ADMIN PANEL</font>
    </div>
    </div>
   </header>
   
   <div class=row>
				<div class="container mgn-top Text-center">
						<h3><font class=Text-danger>[ Invalid Login-Id & Password ]</font></h3>
				</div>
			</div>
   
	<div class="row ">
		<div class="container">
			<div class="col-lg-3"></div>
			 <div class="col-lg-6 animated fadeInLeft mgn-top">
              <div class="text-center" style="background-color:#665851; margin: 0px auto; border-radius:5px 5px 0 0;"><br>
				  <font color="#FFFFFF" size="+2">Admin Login</font>
			  </div>
			  <div style="background-color:#FFF" class="well">
	   
	               <img src="image/admin_login.png" class="img-circle center-block" width="40%" height="30%"></img><br>
                   			 <form action="admin.jsp" method="get" class="role">
                   
				   <div class="input-group">
                        <span class="input-group-addon ">
                            <i class="glyphicon glyphicon-user"></i>
                        </span>
                        <input type="text" class="form-control" placeholder="Admin ID" name="aid">
                    </div>
                    <br/>
					<div class="input-group">
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-lock"></i>
                        </span>
                        <input type="password" class="form-control" placeholder="Password" name="apas">
                    </div><br>
					<button type="submit" class="btn btn-success btn-block" >Login</button><br>
					</form>
									<a href="index.html"> <button type="submit" class="btn btn-danger"> <i class="glyphicon glyphicon-home">&nbsp;Home</i></button></a>
                         <a href="adminForgotPass.html" class="pull-right">Forgot Password ? </a>
					
					</div>
                    </div>
			<div class="col-lg-3"></div>
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

</body>
</html>