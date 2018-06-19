<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%!
Connection cn;
static PreparedStatement getPas,delCust,getCustuid,getCust,insCust,cngPas,updCust,insTrans,getTrans,delTran,trnDets,getTran,updact;
static int actid,trnid,uid;
public void jspInit()
{
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking","root","root");
		
		insCust=cn.prepareStatement("insert into cust value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		getPas=cn.prepareStatement("select passwd from teller where tellerid=?");
		delCust=cn.prepareStatement("delete from cust where actid=?");
		getCust=cn.prepareStatement("select * from cust where actid=?");
		getCustuid=cn.prepareStatement("select * from cust where uid=?");
		cngPas=cn.prepareStatement("update teller set passwd=? where tellerid=?");
		updCust=cn.prepareStatement("update cust set balance=? where actid=?");
		insTrans=cn.prepareStatement("insert into trans value(?,?,?,?,?,?,?)");
		getTrans=cn.prepareStatement("select * from trans where tellerid=? and dot between ? and ?");
		getTran=cn.prepareStatement("select * from trans where actid=? and dot between ? and ?");
		delTran=cn.prepareStatement("delete from trans where trnid=?");
		trnDets=cn.prepareStatement("select * from trans where trnid=?");
		updact=cn.prepareStatement("update cust set fname=?,lname=?,gender=?,passwd=?,mobileno=?,mailid=?,address=?,pincode=?,city=?,district=?,state=?,balance=? where actid=?");
	}
	catch(ClassNotFoundException e)
	{
		System.err.println("\nDriver Not Found..."+e.getMessage()+"\n");
	}
	catch(SQLException e)
	{
		System.err.println("\nSQL Alert[InitTeller]..."+e.getMessage()+"\n");
	}
}
%>
<%
Statement st=cn.createStatement();
ResultSet rs1=st.executeQuery("select max(actid) as maxid from cust");
rs1.next();
actid=rs1.getInt("maxid");
if(actid==0)
	actid=101;
else
	actid++;
System.out.printf("\nactid : "+actid);

	rs1=st.executeQuery("select max(trnid) as maxid from trans");
	rs1.next();
	trnid=rs1.getInt("maxid");
	if(trnid==0)
		trnid=100001;
	else
 	trnid++;
	System.out.printf("\ntrnid : "+trnid);
%>
