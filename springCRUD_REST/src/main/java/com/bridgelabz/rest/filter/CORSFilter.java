package com.bridgelabz.rest.filter;

 import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

public class CORSFilter implements Filter {


	public void init(FilterConfig filterConfig) throws ServletException {
		

	}

	
/*	
 
    Adding CORS support to your REST API
	While accessing the REST API, you might face issues concerning Same Origin Policy.

	Errors like :
	” No ‘Access-Control-Allow-Origin’ header is present on the requested resource. Origin ‘http://127.0.0.1:8080′ is therefore not allowed access.” OR
	” XMLHttpRequest cannot load http://abc.com/bla. Origin http://localhost:12345 is not allowed by Access-Control-Allow-Origin.” are common in such case.

	Solution is Cross-Origin Resource Sharing. Basically, on server side, we can return additional CORS access control headers with response, which will eventually allow further inter-domain communication.

	With Spring, we can write a simple filter which adds those CORS specific headers in each response.
	
*/
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException 
	{
		 System.out.println("Filtering on...........................................................");
	        HttpServletResponse response = (HttpServletResponse) res;
	        response.setHeader("Access-Control-Allow-Origin", "*");
	        response.setHeader("Access-Control-Allow-Methods", "POST, GET, PUT, OPTIONS, DELETE");
	        response.setHeader("Access-Control-Max-Age", "3600");
	        response.setHeader("Access-Control-Allow-Headers", "x-requested-with");
	        chain.doFilter(req, res);

	}

	public void destroy() {
	
	}

}
