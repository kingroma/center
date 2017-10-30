package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.Board;
import com.common.ManagerStaticAttribute;
import com.common.SortArrayList;
import com.manager.Admin_BoardManager;
import com.manager.Admin_BuyerManager;
import com.manager.Admin_OrderManager;
import com.manager.Admin_ProductManager;
import com.manager.Admin_SellerManager;
import com.order.Order;
import com.product.Product;

/**
 * Servlet implementation class info
 */
@WebServlet("/info")
public class info extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public info() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    Admin_ProductManager product_manager = new Admin_ProductManager();
    Admin_BuyerManager buyer_manager = new Admin_BuyerManager();
	Admin_OrderManager order_manager = new Admin_OrderManager();
	Admin_BoardManager board_manager = new Admin_BoardManager(null);
	Admin_SellerManager seller_manager = new Admin_SellerManager();
	String buyer_id = "";
	String seller_id = "";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		buyer_id = (String)request.getParameter("buyer_id");
		seller_id = (String)request.getParameter("buyer_id");
		
		
		
		if(buyer_id!=null){
			ArrayList<Board> board_list = board_manager.getMyBoard(buyer_id);
			ArrayList<Order> order_list = order_manager.getBuyerOrderList(buyer_id);
			ArrayList<Product> product_list = new ArrayList<Product>();
			for(int i = 0 ; i < order_list.size() ; i ++){
				product_list.add(product_manager.getProduct(ManagerStaticAttribute.productDataPath, order_list.get(i).getProduct_num()));
			}
			
			
			SortArrayList sal = new SortArrayList();
			order_list = sal.SortOrder(order_list);
			product_list = sal.SortProduct(product_list);
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/info_buyer.jsp");
			
			request.setAttribute("board_list", board_list);
			request.setAttribute("order_list", order_list);
			request.setAttribute("product_list", product_list);
			rd.forward(request,response);
			
		}else if(seller_id!=null){
			
		}else{
			//RequestDispatcher rd = request.getRequestDispatcher("/jsp/info_buyer.jsp");
			//rd.forward(request,response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}
	
	public void buyer_info(){
		
		
		
	}

}
