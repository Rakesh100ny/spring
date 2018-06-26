<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<link rel=stylesheet href="bs/css/animate.css">
        <link href='<c:url value="/resources/css/bootstrap.min.css"></c:url>' rel="stylesheet">
        <link href='<c:url value="/resources/css/animate.css"></c:url>' rel="stylesheet">
<title>Result</title>
</head>
<body class="text-center">

	<h3 class="animated fadeInLeft">${msg}</h3>
	<a href="login"><button class="animated fadeInRight btn btn-danger">Login</button></a>

</body>
</html>