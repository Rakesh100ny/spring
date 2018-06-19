<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%!
Connection cn;
static PreparedStatement getContact,insContact;
static int telid,trnid,uid,actid;
public void jspInit()
{
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking","root","root");

		insContact=cn.prepareStatement("insert into contactus value(?,?,?,?,?,?)");
		getContact=cn.prepareStatement("select * from contactus");
		
		System.out.printf("\n\nVikas");
	}
	catch(ClassNotFoundException e)
	{
		System.err.println("\nDriver Not Found..."+e.getMessage()+"\n");
	}
	catch(SQLException e)
	{
		System.err.println("\nSQL Alert[InitContactus]..."+e.getMessage()+"\n");
	}
}
%>		