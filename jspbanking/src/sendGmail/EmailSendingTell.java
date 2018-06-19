package sendGmail;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
/**
 * A servlet that takes message details from user and send it as a new e-mail
 * through an SMTP server.
 *
 * @author rakesh
 *
 */
@WebServlet("/EmailSendingTell")
public class EmailSendingTell extends HttpServlet {
	static PreparedStatement getMail;
	Connection cn;
	private String host;
    private String port;
    private String user;
    private String pass;
    String recipient;
    String subject;
    String content;
    public void init()
    {
    	try
    	{
    	 Class.forName("com.mysql.jdbc.Driver");
		 cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebanking","root","root");
		 getMail=cn.prepareStatement("select * from teller where mailid=?");
    	}
    	catch(ClassNotFoundException e)
    	{
    		System.err.println("\nDriver Not Found..."+e.getMessage()+"\n");
    	}
    	catch(SQLException e)
    	{
    		System.err.println("\nSQL Alert[Init]..."+e.getMessage()+"\n");
    	}
    	
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
 
    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
    {
        // reads form fields
    	String password="";
    	String mid=request.getParameter("mid");
    	System.out.println("\nmid : "+mid+"\n");

        subject = "PASSWORD RECOVERY";
        
         
        String resultMessage = "";
 
        try
        {

        		getMail.setString(1,mid);
        		ResultSet rs1=getMail.executeQuery();
        		
        		boolean ok=true;
        		if(rs1.next())
        		{
        			ok=rs1.getString("mailid").equals(mid);
        			password=rs1.getString("passwd");
        	        recipient = request.getParameter("mid");
        		    content = "Your Password is" + password;
        		}
        		else
        			ok=false;
        		if(ok)
        		{
        			try 
        	        {
        	            EmailUtility.sendEmail(host, port, user, pass,recipient,subject,content);
        	        	System.out.println("\nhost : "+host+"\n");
        	        	System.out.println("\nport : "+port+"\n");
        	        	System.out.println("\nuser : "+user+"\n");
        	        	System.out.println("\npass : "+pass+"\n");

        	            resultMessage = "The e-mail was sent successfully";
        	        }
        	        catch (Exception ex) 
        	        {
        	            ex.printStackTrace();
        	            resultMessage = "There were an error: " + ex.getMessage();
        	        }
        	        finally 
        	        {
        	            request.setAttribute("Message", resultMessage);
        	            getServletContext().getRequestDispatcher("/ResultTell.jsp").forward(request, response);
        	        }
        		}
        		else
        		{
        			PrintWriter pw=response.getWriter();
        			String html="<html lang=\"en\">"+
        			"<head>"+
        			  "<meta charset=\"utf-8\">"+
        			  "<meta name=\"viewport\">"+
        			  "<link rel=\"stylesheet\" href=\"bs/css/bootstrap.min.css\">"+
        			   "<script src=\"bs/js/jquery.min.js\">"+"</script>"+
        			   "<script src=\"bs/js/bootstrap.min.js\">"+"</script>"+
        			   "<link rel=stylesheet href=bs/css/animate.css>"+
        			   "<style>"+
        			    /* Remove the navbar's default margin-bottom and rounded borders */
        			    ".navbar {margin-bottom: 0;border-radius: 0;}"+
        			    /* Add a gray background color and some padding to the footer */
        			   ".mgn-top {margin-top:85px;}"+
        			   ".mgn-tp  {margin-top:200px;}"+
        			  "</style>"+
        			"</head>"+
        			"<body style=\"background-color:#CCCCCC\">"+

        			"<nav class=\"navbar navbar-inverse navbar-fixed-top\">"+
        			  "<div class=\"container-fluid \">"+
        			    "<div class=\"navbar-header\">"+
        			      "<button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#myNavbar\">"+
        			      
        			        "<span class=\"icon-bar\">"+"</span>"+
        			        "<span class=\"icon-bar\">"+"</span>"+
        			        "<span class=\"icon-bar\">"+"</span>"+
        			      "</button>"+
        			      "<i class=\"navbar-brand\" style=\"padding:0px;\">"+"<img src=\"image/savboj.png\">"+"</img>"+"</i>"+
        			    "</div>"+
        			    "<div class=\"collapse navbar-collapse\" id=\"myNavbar\">"+
        			              
        			      "<ul class=\"nav navbar-nav\">"+
        			        "<li>"+"<a href=\"index.html\">Home</a>"+"</li>"+
        			        "<li>"+"<a href=\"aboutus.html\">About</a>"+"</li>"+
        			        "<li>"+"<a href=\"contactus.html\">Contact</a>"+"</li>"+
        			      "</ul>"+
        			      
        			      "<ul class=\"nav navbar-nav navbar-right\">"+
        			        "<li>"+"<a href=\"homeCust.html\">"+"<span class=\"glyphicon glyphicon-log-in\">"+"</span>Login</a>"+"</li>"+
        			      "</ul>"+
        			    "</div>"+
        			  "</div>"+
        			"</nav>"+
        			"<div class=row>"+
  					"<div class=\"container mgn-top Text-center\">"+
  							"<h1><font class=Text-danger> [ Invalid Mail-Id ]</font></h1>"+
  					"</div>"+
  				"</div>"+

        						    	 	"<div class=row>"+
        						    	 		"<div class=\"container \">"+
        						    	 			"<div class=col-lg-3>"+"</div>"+
        						    	 			"<div class=\"col-lg-6 animated fadeInUp\">"+
        						    	               "<div class=text-center style=\"background-color:#665851;margin-top:0px; border-radius:5px 5px 0 0;\">"+"<br>"+
        						    	                "<font color=#FFFFFF size=+2 >Forgot Password</font>"+
        						    	               "</div>"+
        						    	 			 	 "<div style=\"background-color:#FFF;\" class=well>"+
        						    	 			 	 "<form action=EmailSendingTell method=get class=role>"+
        						    	 			
        						    	 				   "<div class=input-group >"+
        						    	                         "<span class=input-group-addon>"+
        						    	                             "<i class=\"glyphicon glyphicon-inbox\">"+"</i>"+
        						    	                         "</span>"+
        						    	                         "<input type=email class=form-control placeholder=\"Email\" ID name=mid>"+
        						    	                     "</div>"+
        						    	                     "<br>"+
        						    	 					"<button type=submit class=\"btn btn-primary btn-block\">Mail send</button>"+
        						    	 					"</form>"+
        						    	 				"<a href=tellogin.html>"+ "<button type=submit class=\"btn btn-danger btn-block\">Back</button>"+"</a>"+
        						    	 				"</div>"+
        						    	 			"</div>"+
        						    	 			"<div class=col-lg-3>"+"</div>"+
        						    	 		"</div>"+
        						    	 	"</div>"+

        			"<footer class=\"row text-center mgn-tp\" style=\"background-color: #101010; height: 40px; padding-top: 10px; \">"+
        			  "<div class=\"container-fluid\">"+
        			   "<font face=\"Lucida Sans Unicode, Lucida Grande, sans-serif\"  color=\"#fff\">Copyright�2017 JIET Students. All Rights Reserved | Designed & Developed by - Baberwal Brothers</font>"+
        			  "</div>"+
        			"</footer>"+
        			 "</body>"+
        			"</html>";
        			pw.println(html);
        		}
        }
        catch(SQLException e)
        {
        	System.out.println("\nSQL Alert[forgapas2.jsp]...."+e.getMessage()+"\n");
        }
    }
}