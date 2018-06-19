<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ include file="custps.jsp"%>




<html>
<head>
<title>Cust Menu</title>
</head>
<body>


	<%
		String uid = request.getParameter("cid");
		String cpas = request.getParameter("pas");

		HttpSession ssn = request.getSession(false);

		if (ssn == null) {
			System.out.println("Session is Created..; File:custmenu.java");
			ssn = request.getSession();
		} else {
			System.out.println("Session is Already Created..; File:custmenu.java");
		}

		try {

			getPas.setString(1, uid);
			ResultSet rs1 = getPas.executeQuery();

			boolean ok = true;

			if (rs1.next())
				ok = rs1.getString("passwd").equals(cpas);
			else
				ok = false;

			if (ok) {
	%>

<html>
<head>
<meta charset="utf-8">
<meta name=viewport content="device-width,initial-scale=1">
<link rel=stylesheet href="bs/css/bootstrap.min.css">
<link rel="stylesheet" href="bs/css/main.css"></link>
<link rel="stylesheet" href="bs/css/animate.css">
<style>
.mgn-btm {
	margin-bottom: 5px;
}
</style>

</head>
<body
	style="background: url(image/paisa.jpg) no-repeat center center fixed; background-size: cover;">
	<div class="row ">
		<div class="container">
			<div class="col-lg-12 text-Left text-danger animated fadeInLeft">
				<h1>
					<font face="Comic Sans MS, cursive">Customer Menu</font>
				</h1>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="container">
			<div class="col-lg-6 animated fadeInLeft">
				<div class="text-center"
					style="background-color: #665851; margin-top: 0; border-radius: 5px 5px 0 0;">
					<br> <font color="#FFFFFF" size="+2">Please select a
						transaction</font>
				</div>
				<div style="background-color: #999" class="well">

					<%-- <a href="cashwithdrawal.jsp?uid=<%=uid%>&cpas=<%=cpas%> ">	  			      	
  	          		  <div class="chip mgn-btm">
                       <img src="image/img_avatar2.png" alt="Person">CASH WITHDRAWAL
                      </div>
                    </a> --%>
					<a href="CustTxnStatus1.jsp?uid=<%=uid%>&cpas=<%=cpas%> ">
						<div class="chip mgn-btm">
							<img src="image/status.png" alt="Person">TRANSACTION STATUS
						</div>
					</a> <br> <a href="balancetrf.jsp?uid=<%=uid%>&cpas=<%=cpas%>">
						<div class="chip mgn-btm">
							<img src="image/Hand-over-cash.png" alt="Person">BALANCE
							TRANSFER
						</div>
					</a><br> <a href="balInquiry.jsp?uid=<%=uid%>&cpas=<%=cpas%>">
						<div class="chip mgn-btm">
							<img src="image/money.jpg" alt="Person">BALANCE ENQUIRY
						</div>
					</a><br> <a href="changepassword.jsp?uid=<%=uid%>&cpas=<%=cpas%>">
						<div class="chip mgn-btm">
							<img src="image/changepin.jpg" alt="Person">CHANGE PIN
						</div>
					</a><br> <a href="custlogin.html?">
						<div class="chip mgn-btm">
							<img src="image/logout.png" alt="Person">LOGOUT
						</div>
					</a>

				</div>
			</div>
			<div class="col-lg-3"></div>
			<div class="col-lg-3"></div>
		</div>
	</div>
</body>
</html>
<%
	} else {
%>
<html lang=en>
<head>
<meta charset=utf-8>
<meta name=viewport content=width=device-width, initial-scale=1>
<link rel=stylesheet href=bs/css/bootstrap.min.css>
<link rel=stylesheet href=bs/css/animate.css>
<style>
.mgn-top {
	margin-top: 200px;
}
</style>
</head>
<body
	style="background: url(image/photo_bg.jpg) no-repeat center center fixed; background-size: cover;">

	<div class=row>
		<div class="container mgn-top Text-center">
			<h1>
				<font class=Text-danger>[ Invalid Login-Id & Password ]</font>
			</h1>
		</div>
	</div>

	<div class=row>
		<div class=container>
			<div class=col-lg-4></div>
			<div class="col-lg-4 animated fadeInUp">
				<div class=text-center
					style="background-color: #665851; margin-top: 0; border-radius: 5px 5px 0 0;">
					<br> <font color=#FFFFFF size=+2>LOG IN</font>
				</div>
				<div style="background-color: #FFF;" class=well>
					<form action=cust.jsp method=get class=role>

						<div class=input-group>
							<span class=input-group-addon> <i
								class="glyphicon glyphicon-user"></i>
							</span> <input type=text class=form-control placeholder=Customer ID
								name=cid>
						</div>
						<br />
						<div class=input-group>
							<span class=input-group-addon> <i
								class="glyphicon glyphicon-lock"></i>
							</span> <input type=password class=form-control placeholder=Password
								name=pas>
						</div>
						<span class=pull-right> <a href=custForgotPass>Forgot
								Password ? </a>
						</span> <br>
						<button type=submit class="btn btn-primary btn-block">Login</button>
					</form>
					<a href=index.html>
						<button type=submit class="btn btn-danger btn-block">Back</button>
					</a>
				</div>
			</div>
			<div class=col-lg-4></div>
		</div>
	</div>
	<br>
</body>
</html>

<%
	}
	} catch (SQLException e) {
		System.out.println("\nSQL Alert[cust.jsp]...." + e.getMessage() + "\n");
	}
%>
