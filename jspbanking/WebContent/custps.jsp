<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession;"%>


<%!Connection cn;
	static int trnid;
	static PreparedStatement getPas, setBal, getCust, insTran, cngPas, getBal, getCustAct, getTrans;

	public void jspInit() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking", "root", "root");

			getPas = cn.prepareStatement("select passwd from cust where uid=?");
			getCust = cn.prepareStatement("select * from cust where uid=?");
			getCustAct = cn.prepareStatement("select * from cust where actid=?");
			setBal = cn.prepareStatement("update cust set balance=? where actid=?");
			insTran = cn.prepareStatement("insert into trans value(?,?,?,?,?,?,?)");
			cngPas = cn.prepareStatement("update cust set passwd=? where uid=?");
			getBal = cn.prepareStatement("select balance from cust where uid=? and passwd=?");
			getTrans = cn.prepareStatement("select * from trans where actid=? and dot between ? and ?");
		} catch (ClassNotFoundException e) {
			System.err.println("\nDriver Not Found..." + e.getMessage() + "\n");
		} catch (SQLException e) {
			System.err.println("\nSQL Alert[Init]..." + e.getMessage() + "\n");
		}
	}
	%>

<%
	Statement st = cn.createStatement();
	ResultSet rs = st.executeQuery("select max(trnid) as trnid from trans");
	rs.next();
	trnid = rs.getInt("trnid");
	if (trnid == 0)
		trnid = 100001;
	else
		trnid++;
	System.out.printf("\ntrnid : " + trnid);
%>
