<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
<body>
<%
 response.setHeader("Cache-Control", "no-cache, no-store, no-revalidate");
%>

	    <div class="row">
	     <div class="container">
	      <div class="col-lg-3  animated fadeInLeft text-right text-primary"></div>
	      <div class="col-lg-6  animated fadeInRight text-center form-group">
	      <h3 class="text-info">  Welcome  ${user.getFirstName()}  ${user.getLastName() } </h3><br>
	   
	       <table class="table">
	       <tr>
	         <td>SNo</td>
	         <td class="text-center">${user.getId()} </td>
	        </tr>
	       <tr>
	         <td>First Name</td>
	         <td class="text-center">${user.getFirstName()}</td>
	        </tr>
 	        <tr>
	         <td>Last  Name</td>
	         <td class="text-center">${user.getLastName()}</td>
	        </tr>
	        <tr>
	         <td>Email Id</td>
	         <td class="text-center">${user.getEmail()}</td>
	        </tr>
 	        <tr>
	         <td>Password </td>
	         <td class="text-center">${user.getPassword()}</td>
	        </tr>
	        </table>

	        <a href="logout" class="btn btn-block btn-primary">Log Out</a>
       	    
	        
	      </div>
	      <div class="col-lg-3"> </div>
	      </div>
 	     </div>
	    
	</body>
	</html>
