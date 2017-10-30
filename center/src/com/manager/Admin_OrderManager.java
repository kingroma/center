package com.manager;
import java.io.File;
import java.util.ArrayList;

import com.common.DataClassManager;
import com.common.ManagerStaticAttribute;
import com.order.Order;;
public class Admin_OrderManager {
	DataClassManager dcm;
	public Admin_OrderManager(){
		dcm = new DataClassManager();
	}
	
	public ArrayList<Order> getAllOrder(){
		
		String path = ManagerStaticAttribute.orderDataPath;
		File file = new File(path);
		ArrayList<Order> all_list = new ArrayList<Order>();
		String[] list = file.list();
		
		for(int i = 0 ; i < list.length ; i ++){
			all_list.add(this.getOrder(path,list[i]));
		}
		
		return all_list;
	}
	
	public ArrayList<Order> getBuyerOrderList(String buyer_id){
		ArrayList<Order> all_list = this.getAllOrder();
		ArrayList<Order> buyer_list = new ArrayList<Order>();
		
		for(int i = 0 ; i < all_list.size() ; i ++){
			if(all_list.get(i).getBuyer().equals(buyer_id)){
				buyer_list.add(all_list.get(i));
			}
		}
		
		return buyer_list;
	}
	
	public boolean createOrder(String path,Order order){
		String num = order.getOrder_num();
		String newPath = path+"/"+num;
		File file = new File(newPath);
		/*
		if(file.exists())
			return false;
		else
			file.mkdirs();
		 */
		dcm.save(order, newPath+"/order.data");
		return true;
	}
	
	public Order getOrder(String path , String num){
		Order output = null;
		output = (Order)dcm.load(path+"/"+num+"/order.data");
		return output;
	}
	
	public boolean fixOrder(String path , Order order){
		String num = order.getOrder_num();
		String newPath = path+"/"+num;
		File file = new File(newPath);
		dcm.save(order, newPath+"/order.data");
		return true;
	}
	
}
