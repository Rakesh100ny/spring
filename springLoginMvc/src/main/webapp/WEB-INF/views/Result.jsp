<html>
<head>
	<meta charset="utf-8">
		    	       <meta name=viewport content="device-width,initial-scale=1">
		<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
		<link href='<c:url value="/resources/css/animate.css"/>' rel="stylesheet">
		    	 	<title>Result</title>
</head>
<body class="text-center">
    
        <h3 class="animated fadeInLeft"><%=request.getAttribute("Message")%></h3>
         <a href="login"><button class="animated fadeInRight btn btn-danger">Login</button></a>
    
</body>
</html>