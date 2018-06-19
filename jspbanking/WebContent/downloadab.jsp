<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Download Reciept</title>
</head>
<body>
<%
response.setHeader("Content-Disposition","Attachment;filename=AvalBal.xls");   //EXCEL me download krne k liye

String actid=request.getParameter("actid");
String bal=request.getParameter("bal");
%>
<br>
Thank You For Banking With Us.
<table>
<tr>
	<td>Account Id :</td><td>&nbsp;</td><td> <%=actid %></td></tr>
	<tr><td>Available Balance :</td><td>&nbsp;</td><td> <%=bal %></td>
</tr>
</table>
</body>
</html>