<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang=en>
<head>
<meta charset=utf-8>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='<c:url value="/resources/css/bootstrap.min.css"/>'
	rel="stylesheet">
<link href='<c:url value="/resources/css/animate.css"/>'
	rel="stylesheet">
<style>
.mgn-top {
	margin: 250px 0 0 100px;
}
</style>
</head>
<body background='<c:url value='/resources/css/photo_bg.jpg'/>'
	style="background-size:cover;">
	<div class=row>
		<div class="container mgn-top">
			<div class=col-lg-4></div>
			<div class="col-lg-4 animated fadeInUp">
				<div class=text-center
					style="background-color: #665851; margin-top: 0px; border-radius: 5px 5px 0 0;">
					<br> <font color=#FFFFFF size=+2>Forgot Password</font>
				</div>
				<div style="background-color: #FFF;" class=well>
					<form action=EmailSending method=get class=role>

						<div class=input-group>
							<span class=input-group-addon> <i
								class="glyphicon glyphicon-inbox"></i>
							</span> <input type=email class=form-control placeholder="Email-ID" 
								name=mid>
						</div>
						<br>
						<button type=submit class="btn btn-primary btn-block">Mail
							send</button>
					</form>
					<a href=loginPage>
						<button type=submit class="btn btn-danger btn-block">Back</button>
					</a>
				</div>
			</div>
			<div class=col-lg-4></div>
		</div>
	</div>
</body>
</html>

