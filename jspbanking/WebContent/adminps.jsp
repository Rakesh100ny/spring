<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%!
Connection cn;
static PreparedStatement getPas,insTeller,insTrans,selTell,delTell,getCustuid,insCust,selCust,delCust,updateCust,getTrans,getTransact,getTranstel,getCust,getTran,getTranss,trnDets,delTran,updact,updtel,getadmin,updadmin,getEnq,delEnq;
static int telid,trnid,uid,actid;
public void jspInit()
{
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking","root","root");
		
		insCust=cn.prepareStatement("insert into cust value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		getCust=cn.prepareStatement("select * from cust where actid=?");
		getCustuid=cn.prepareStatement("select * from cust where uid=?");
		getPas=cn.prepareStatement("select * from admin where aid=?");
		insTeller=cn.prepareStatement("insert into teller value(?,?,?,?,?,?,?,?,?,?,?,?,?)");
		insTrans=cn.prepareStatement("insert into trans value(?,?,?,?,?,?,?)");
		selTell=cn.prepareStatement("select * from teller where tellerid=?");
		delTell=cn.prepareCall("delete from teller where tellerid=?");
		selCust=cn.prepareStatement("select * from cust where actid=?");
		delCust=cn.prepareCall("delete from cust where actid=?");
		updateCust=cn.prepareStatement("update cust set balance=? where actid=?");
		getTran=cn.prepareStatement("select * from trans where actid=? and dot between ? and ?");
		getTrans=cn.prepareStatement("select * from trans where tellerid=? and dot between ? and ?");
		getTranss=cn.prepareStatement("select * from trans where tellerid=? and actid=? and dot between ? and ?");
		getTransact=cn.prepareStatement("select * from trans where actid=? and dot between ? and ?");
		getTranstel=cn.prepareStatement("select * from trans where tellerid=? and dot between ? and ?");
		trnDets=cn.prepareStatement("select * from trans where trnid=?");
		delTran=cn.prepareStatement("delete from trans where trnid=?");
		updact=cn.prepareStatement("update cust set fname=?,lname=?,gender=?,passwd=?,mobileno=?,mailid=?,address=?,pincode=?,city=?,district=?,state=?,balance=? where actid=?");
		updtel=cn.prepareStatement("update teller set passwd=?,fname=?,lname=?,gender=?,mobileno=?,mailid=?,address=?,pincode=?,city=?,district=?,state=? where tellerid=?");
		getadmin=cn.prepareStatement("select * from admin where aid=?");
		updadmin=cn.prepareStatement("update admin set apas=?,fname=?,lname=?,gender=?,mobileno=?,mailid=?,address=?,pincode=?,city=?,district=?,state=? where aid=?");
		getEnq=cn.prepareStatement("select * from contactus");
		delEnq=cn.prepareStatement("delete from contactus where fname=?");
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
ResultSet rs1=st.executeQuery("select max(tellerid) as maxid from teller");
rs1.next();
telid=rs1.getInt("maxid");
if(telid==0)
	telid=1001;
else
	telid++;
System.out.printf("\ntelid : "+telid);

	rs1=st.executeQuery("select max(trnid) as maxid from trans");
	rs1.next();
	trnid=rs1.getInt("maxid");
	if(trnid==0)
		trnid=100001;
	else
 	trnid++;
	System.out.printf("\ntrnid : "+trnid);
	
	rs1=st.executeQuery("select max(actid) as maxid from cust");
	rs1.next();
	actid=rs1.getInt("maxid");
	if(actid==0)
		actid=101;
	else
 	actid++;
	System.out.printf("\nactid : "+actid);
%>
