package com.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Message {
	
	public Message(String msg, String location,HttpServletRequest request , HttpServletResponse response){
		
		try{
			PrintWriter out = response.getWriter();
			out.print("<html><head>"
					+ "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>"
					+ "<script>"
					+ "alert('"+msg+"');location.replace('"+location+"');"
					+ "</script>"
					+ "</head><body>");
			out.print("</body></html>");
		}catch(Exception e){
			e.printStackTrace();
		}
	}	
}
