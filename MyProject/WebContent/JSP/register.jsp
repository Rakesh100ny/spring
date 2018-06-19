
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<link rel=stylesheet href="bs/css/bootstrap.min.css">
		<link rel=stylesheet href="bs/css/animate.css">
        <script src="bs/js/FrontEndVallidation.js" charset="utf-8"></script>
        <title>Register Page</title>

</head>

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
	      <h3 class="text-info">  Register Details  </h3><br>
	      <form action="RegisterController" method="post" class="role">

	       <table  class="table">
	         <tr>
	         <td>First Name </td>
	         <td><input type="text" class="form-control" name="fname" id="fname"></td>
	        </tr>
	        <tr>
	         <td>Last Name </td>
	         <td><input type="text" class="form-control" name="lname"  id="lname"></td>
	        </tr>       
	        <tr>
	         <td>Email Id</td>
	         <td><input type="email" class="form-control" name="email" id="mid"></td>
	        </tr>
 	        <tr>
	         <td>Password </td>
	         <td><input type="text" class="form-control" name="password" id="pass"></td>
	        </tr>
	        </table>
	          <button class="btn btn-block btn-primary" name="register" value="register" onclick="registerValidation()">Registration</button>
	        </form>
	        <a href="login"><button class="btn btn-block btn-primary">Login</button></a>
	      </div>
	      <div class="col-lg-3"> </div>
	      </div>
 	     </div>
	    
	</body>
	</html>

