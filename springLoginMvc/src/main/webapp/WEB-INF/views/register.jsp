<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<link rel=stylesheet href="bs/css/animate.css">
        <link href='<c:url value="/resources/css/bootstrap.min.css"></c:url>' rel="stylesheet">
        <link href='<c:url value="/resources/css/animate.css"></c:url>' rel="stylesheet">
        <title>Register Page</title>

</head>
<% response.setHeader("Cache-Control", "no-cache, no-store, no-revalidate");
 %>
<body>
		<div class="row">
			<div class="container">
				<div class="col-lg-12 ">
				     <h1 class="text-info"><font>Sign Up...! </font></h1> 

				</div>
			</div>
		</div>
	    <div class="row">
	     <div class="container">
	      <div class="col-lg-3  animated fadeInLeft text-right text-primary"></div>
	      <div class="col-lg-6  animated fadeInRight text-center form-group">
	      <h4 class="text-danger">${error}</h4>
	      <h3 class="text-info">  Register Details  </h3><br>
	      <form action="registerProcess" modelAttribute="user" method="post" class="role">

	       <table  class="table">
	        <tr>
	         <td>First Name </td>
	         <td><input type="text" class="form-control" name="firstName"></td>
	        </tr>
	        <tr>
	         <td>Last Name </td>
	         <td><input type="text" class="form-control" name="lastName" ></td>
	        </tr>       
	        <tr>
	         <td>Email Id</td>
	         <td><input type="email" class="form-control" name="email" ></td>
	        </tr>
 	        <tr>
	         <td>Password </td>
	         <td><input type="password" class="form-control" name="password" ></td>
	        </tr>
	        </table>
	          <button class="btn btn-block btn-primary" name="register" value="register">Registration</button>
	        </form>
	        <a href="loginPage"><button class="btn btn-block btn-primary">Login</button></a>
	      </div>
	      <div class="col-lg-3"> </div>
	      </div>
 	     </div>
	    
	</body>
	</html>

