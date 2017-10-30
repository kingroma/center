package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.Board;
import com.buyer.Buyer;
import com.common.ManagerStaticAttribute;
import com.common.SuperAdminClass;
import com.manager.Admin_BoardManager;
import com.manager.Admin_BuyerManager;
import com.manager.Admin_OrderManager;
import com.manager.Admin_ProductManager;
import com.manager.Admin_SellerManager;
import com.order.Order;
import com.product.Product;
import com.seller.Seller;

/**
 * Servlet implementation class info_detai
 */
@WebServlet("/info_detail_board")
public class info_detail_board extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public info_detail_board() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String board_num = (String)request.getParameter("board_num");
		if(board_num!=null){
			Admin_BoardManager abm = new Admin_BoardManager(null);
			//Admin_ProductManager apm = new Admin_ProductManager();
			Board b = abm.getBoard(board_num);
			//Product p = apm.getProduct(ManagerStaticAttribute.productDataPath, o.getProduct_num());
			
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/info_detail_board.jsp");
			request.setAttribute("board", b);
			//request.setAttribute("product", p);
			rd.forward(request,response);
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/info_detail_board.jsp");
			
			rd.forward(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	String buyer_id = "";
	String board_num = "";
	String status = "";
	String title = "";
	String categori = "";
	String textarea = "";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String buyer_id = request.getParameter("buyer_id");
		String board_num = request.getParameter("board_num");
		String status = request.getParameter("status");
		String title = request.getParameter("title");
		String categori = request.getParameter("categori");
		String textarea = request.getParameter("textarea");
	
		if(status==null)
			status="null";
		if(title==null)
			title="";
		if(categori==null)
			categori="¾øÀ½";
		if(textarea==null)
			textarea="";
		
		Admin_BoardManager abm = new Admin_BoardManager(null);
		Board b = abm.getBoard(board_num);
		b.setStatus(status);
		b.setTitle(title);
		b.setCategori(categori);
		b.setTextarea(textarea);
		
		abm.fixBoard(b);
		
		
		//Admin_ProductManager apm = new Admin_ProductManager();
		
		//Product p = apm.getProduct(ManagerStaticAttribute.productDataPath, o.getProduct_num());
		
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/info_detail_board.jsp");
		request.setAttribute("board", b);
		//request.setAttribute("product", p);
		rd.forward(request,response);
		
		
	}
	
}
