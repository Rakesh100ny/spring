 <%@page import="javax.servlet.http.HttpSession" %>

<%

if(session==null && session.getAttribute("user")==null)
{
	response.sendRedirect("register");
	out.print("Hello Ranu...!");
}
else
{
	response.sendRedirect("welcome");
	out.print("Hello Rakesh...!");
}
%>