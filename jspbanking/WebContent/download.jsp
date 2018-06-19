<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Download Reciept</title>
</head>
<body>
<%
response.setHeader("Content-Disposition","Attachment;filename=cahwithdraw.xls");   //EXCEL me download krne k liye

String actid=request.getParameter("actid");
String dot=request.getParameter("dot");
String amt=request.getParameter("amt");
String bal=request.getParameter("bal");
%>
<center>
<br>
Your Transaction is Successfull..!
<br>
Thank You For Banking With Us.
<br>
<table>
<tr>
	<td>Acc. Number</td><td><%=actid %></td><td>&nbsp;</td><td>Date</td><td><%=dot %></td>
</tr>
</table>
<br>Cash Withdrawal
<table>
<tr>
	<td>Amount</td><td><%=amt %>
</tr>
<tr>
	<td>Available Balance</td><td><%=bal %></td>
</tr>
</table>
</center>
</body>
</html>