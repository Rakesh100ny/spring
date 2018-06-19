<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
	    <meta name=viewport content="device-width,initial-scale=1">
		<link rel=stylesheet href="bs/css/bootstrap.min.css">
	    <link rel="stylesheet" href="bs/css/animate.css">
        <script src="bs/js/FrontEndVallidation.js" charset="utf-8"></script>
<title>Login Page</title>
</head>
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
	      <h3 class="text-info">  Login Page  </h3><br>
	      <form action="LoginController" method="post" class="role">

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
	        
       	       <button class="btn btn-block btn-primary" name="login" value="login" onclick="return loginValidation()">Login</button>
       
	        </form>
	        
	      </div>
	      <div class="col-lg-3"> </div>
	      </div>
 	     </div>
	    
	</body>
	</html>
