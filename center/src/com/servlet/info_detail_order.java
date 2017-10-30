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

import com.buyer.Buyer;
import com.common.ManagerStaticAttribute;
import com.common.SuperAdminClass;
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
@WebServlet("/info_detail_order")
public class info_detail_order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public info_detail_order() {
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
		String order_num = (String)request.getParameter("order_num");
		if(order_num!=null){
			Admin_OrderManager aom = new Admin_OrderManager();
			Admin_ProductManager apm = new Admin_ProductManager();
			Order o = aom.getOrder(ManagerStaticAttribute.orderDataPath, order_num);
			Product p = apm.getProduct(ManagerStaticAttribute.productDataPath, o.getProduct_num());
			
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/info_detail_order.jsp");
			request.setAttribute("order", o);
			request.setAttribute("product", p);
			rd.forward(request,response);
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("/jsp/info_detail_order.jsp");
			
			rd.forward(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	String buyer_id = "";
	String seller_id = "";
	String order_num = "";
	String product_num = "";
	String status = "";
	String price ="";
	String phone ="";
	String comment = "";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		order_num = request.getParameter("order_num");
		status = request.getParameter("status");
		price = request.getParameter("price");
		phone = request.getParameter("phone");
		comment = request.getParameter("comment");
		seller_id = request.getParameter("seller_id");
		buyer_id = request.getParameter("buyer_id");
		
		
		//fixOrder();
		SuperAdminClass admin = new SuperAdminClass(buyer_id,seller_id,null,order_num);
			
		admin.fixOrderInfoByBuyer(price, comment, phone,status);
			
		
		Admin_OrderManager aom = new Admin_OrderManager();
		
		
		Admin_ProductManager apm = new Admin_ProductManager();
		Order o = aom.getOrder(ManagerStaticAttribute.orderDataPath, order_num);
		Product p = apm.getProduct(ManagerStaticAttribute.productDataPath, o.getProduct_num());
		
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/info_detail_order.jsp");
		request.setAttribute("order", o);
		request.setAttribute("product", p);
		rd.forward(request,response);
		
	}
	
	public void fixOrder(){
		
		Admin_BuyerManager abm = new Admin_BuyerManager();
		Admin_OrderManager aom = new Admin_OrderManager();
		Admin_ProductManager apm = new Admin_ProductManager();
		Admin_SellerManager asm = new Admin_SellerManager();
		ManagerStaticAttribute path = new ManagerStaticAttribute();
		
		Buyer b = null;
		Order o = null;
		Seller s  = null;
		Product p  = null;
		
		String buyerPath = path.buyerDataPath;
		String orderPath = path.orderDataPath;
		String productPath = path.productDataPath;
		String sellerPath = path.sellerDataPath;
		
		if(buyer_id!=null)
			b = abm.getBuyer(buyerPath, buyer_id);
		if(order_num!=null)
			o = aom.getOrder(orderPath, order_num);
		if(seller_id!=null)
			s = asm.getSeller(sellerPath, seller_id);
		if(product_num!=null)
			p = apm.getProduct(productPath, product_num);
		
		o.setPrice(price);
		o.setOrder_comment(comment);
		o.setBuyer_phone(phone);
		o.setStatus(status);
		aom.fixOrder(orderPath, o);
		
		ArrayList<Order> order_list = b.getOrder();
		
		for(int i = 0 ; i < order_list.size() ; i ++){
			if(order_list.get(i).getOrder_num().equals(order_num)){
				order_list.set(i, o);
				b.setOrder(order_list);
				abm.fixBuyer(buyerPath, b);
				break;
			}
		}
		
		order_list = s.getOrder();
		
		for(int i = 0 ; i < order_list.size() ; i ++){
			if(order_list.get(i).getOrder_num().equals(order_num)){
				order_list.set(i, o);
				s.setOrder(order_list);
				asm.fixSeller(sellerPath, s);
				break;
			}
		}
		
		
	}
	
}
