package com.db;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

import org.json.*;
import com.razorpay.*;


@WebServlet("/Order_Creation")
public class OrderCreation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCreation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RazorpayClient client=null;
		String orderId = null;
		
		
		String totalAmount = request.getParameter("totalAmount");
		System.out.println(totalAmount);
		try {
			client = new RazorpayClient("rzp_test_BALMMAYJcVYrty","2CXWQMldw4qVziYm5HS1vkEC");
			  JSONObject orderRequest = new JSONObject();
			  orderRequest.put("amount", Integer.parseInt(totalAmount)*100); // amount in the smallest currency unit
			  orderRequest.put("currency", "INR");
			  orderRequest.put("receipt", "order_rcptid_11");
			  orderRequest.put("payment_capture", true);

			  Order order = client.orders.create(orderRequest);
			  orderId = order.get("id");
			  
			} catch (RazorpayException e) {
			  e.printStackTrace();
			  System.out.println(e.getMessage());
			}
		response.getWriter().append(orderId);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RazorpayClient client=null;
	
		try {
			client = new RazorpayClient("rzp_test_BALMMAYJcVYrty","2CXWQMldw4qVziYm5HS1vkEC");
		
		  JSONObject orderRequest = new JSONObject();
		  orderRequest.put("razorpay_payment_id", request.getParameter("razorpay_payment_id")); // amount in the smallest currency unit
		  orderRequest.put("razorpay_order_id", request.getParameter("razorpay_order_id"));
		  orderRequest.put("razorpay_signature", request.getParameter("razorpay_signature"));
		  orderRequest.put("payment_capture", true);
		  boolean SigRes = Utils.verifyPaymentSignature(orderRequest, "2CXWQMldw4qVziYm5HS1vkEC");
		  if(SigRes) {
			 response.sendRedirect("Succesfull_order.jsp");
		  }
			  
			  else {
				  response.getWriter().append("Payment Failed and Signature not verified");  
			  }
		} catch (RazorpayException e) {
			e.printStackTrace();
		}
	}

}
