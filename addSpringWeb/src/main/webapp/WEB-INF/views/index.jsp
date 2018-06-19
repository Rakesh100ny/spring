<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
<div class="row">
			<div class="container">
				<div class="col-lg-12 ">
				     <h1 class="text-info"><font>Hello World...! </font></h1> 

				</div>
			</div>
		</div>
  <div class="row">
	     <div class="container">
	      <div class="col-lg-3"></div>
	      <div class="col-lg-6">
	      <form action="display" method="post" class="role">

  <table  class="table">
	        <tr>
	         <td>Number 1</td>
	         <td><input type="text" class="form-control" name="t1"></td>
	        </tr>
 	        <tr>
	         <td>Number 2 </td>
	         <td><input type="text" class="form-control" name="t2" ></td>
	        </tr>
	        </table>
	        
       	       <button class="btn btn-block btn-primary">Submit</button>
      
      </form>
      
      </div>
      <div class="col-lg-3"></div>
      </div>
      </div>
</body>

<!-- <body>
<form action="display" method="post">
  <input type="text" name="t1"><br>
  <input type="text" name="t2"><br>
  <input type="submit">
 </form>
</body>
 --></html>