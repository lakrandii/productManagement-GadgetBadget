package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/**
 * Servlet implementation class productAPI
 */
@WebServlet("/productAPI")
public class productAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	product productObj = new product();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String output = productObj.insertproduct(request.getParameter("product_ID"),
				 request.getParameter("product_Name"),
				request.getParameter("Category"),
				request.getParameter("Serial_No"),
				request.getParameter("Price"),
				request.getParameter("Description"));
		 
		        response.getWriter().write(output);	            
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
                Map paras = getParasMap(request); 
		        String output = productObj.updateproduct(paras.get("hidIDSave").toString(), 
		        paras.get("product_ID").toString(), 
		        paras.get("product_Name").toString(), 
		        paras.get("Category").toString(), 
		        paras.get("Serial_No").toString(), 
		        paras.get("Price").toString(),
		        paras.get("Description").toString()); 
		        
		        response.getWriter().write(output); 
	}

	private Map getParasMap(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>(); 
		try
		 { 
		 Scanner scanner = new Scanner(request.getInputStream(), "UTF-8"); 
		 String queryString = scanner.hasNext() ? 
		 scanner.useDelimiter("\\A").next() : ""; 
		 scanner.close(); 
		 String[] params = queryString.split("&"); 
		 for (String param : params) 
		 { 
		String[] p = param.split("=");
		 map.put(p[0], p[1]); 
		 } 
		 } 
		catch (Exception e) 
		 { 
		 } 
		return map; 
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map paras = getParasMap(request); 
		 
		String output =  productObj.deleteproduct(paras.get("id").toString());
		response.getWriter().write(output);
	}

}
