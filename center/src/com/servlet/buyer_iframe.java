package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyer.Buyer;
import com.common.ManagerStaticAttribute;
import com.manager.Admin_BuyerManager;

import com.common.Message;

/**
 * Servlet implementation class buyer_iframe
 */
@WebServlet("/buyer_iframe")
public class buyer_iframe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public buyer_iframe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    Admin_BuyerManager abm = new Admin_BuyerManager();
    Buyer b = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String buyer_id = request.getParameter("buyer_id");
		if(buyer_id==null)
			buyer_id="";
		else{
			b = abm.getBuyer(ManagerStaticAttribute.buyerDataPath, buyer_id);
			if(b==null){
				b=null;
				
				
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/buyer_iframe.jsp");
				rd.forward(request,response);
			}
			
		}
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/buyer_iframe.jsp");
		request.setAttribute("buyer_id", buyer_id);
		request.setAttribute("b",b);
		rd.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String buyer_id = request.getParameter("buyer_id");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		String adress = request.getParameter("adress");
		String mail = request.getParameter("mail");
		String status = request.getParameter("status");
		//System.out.println(buyer_id);
		if(birth==null)
			birth="";
		if(phone==null)
			phone="";
		if(adress==null)
			adress="";
		
		System.out.println(birth);
		System.out.println(phone);
		System.out.println(adress);
		System.out.println(status);
		
		if(buyer_id==null)
			buyer_id="";
		else{
			b = abm.getBuyer(ManagerStaticAttribute.buyerDataPath, buyer_id);
			if(b==null){
				b=null;
				RequestDispatcher rd = request.getRequestDispatcher("/jsp/buyer_iframe.jsp");
				
				rd.forward(request,response);	
			}
			
			b.setBirth(birth);
			b.setPhone(phone);
			b.setAdress(adress);
			b.setStatus(status);
			abm.fixBuyer(ManagerStaticAttribute.buyerDataPath, b);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/buyer_iframe.jsp");
			request.setAttribute("buyer_id", buyer_id);
			request.setAttribute("b",b);
			rd.forward(request,response);
			
		}
		
		
		
	}

}
