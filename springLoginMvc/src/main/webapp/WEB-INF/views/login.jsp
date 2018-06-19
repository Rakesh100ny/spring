<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
	    <meta name=viewport content="device-width,initial-scale=1">
		<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
		<link href='<c:url value="/resources/css/animate.css"/>' rel="stylesheet">
		<title>Login Page</title>
</head>
<% response.setHeader("Cache-Control", "no-cache, no-store, no-revalidate");
 %>
<body>
		<div class="row">
			<div class="container">
				<div class="col-lg-12 ">
				     <h1 class="text-info"><font>Sign-In...! </font></h1> 

				</div>
			</div>
		</div>
	    <div class="row">
	     <div class="container">
	      <div class="col-lg-3  animated fadeInLeft text-right text-primary"></div>
	      <div class="col-lg-6  animated fadeInRight text-center form-group">
	      <h4 class="text-danger">${error}</h4>
	      <h3 class="text-danger">${msg}</h3>
	      <h3 class="text-info">  Login Page  </h3><br>
	      <form action="loginProcess" modelAttribute="user" method="post" class="role">

	       <table class="table">
	        <tr>
	         <td>Email Id</td>
	         <td><input type="email" class="form-control" name="email" id="mid"></td>
	        </tr>
 	        <tr>
	         <td>Password </td>
	         <td><input type="password" class="form-control" name="password"  id="pass"></td>
	        </tr>
	        </table>
				     
       	       <button class="btn btn-block btn-primary" name="login" value="login">Login</button>
       
	        </form>
	        
	         <a href="forgot">
	          <button class="btn btn-block btn-danger">Forgot Password ?</button> 
	         </a>
			
	      </div>
	      <div class="col-lg-3"> </div>
	      </div>
 	     </div>
	    
	</body>
	</html>
