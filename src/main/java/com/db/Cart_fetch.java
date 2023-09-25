package com.db;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.prefs.Preferences;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Product_fetch
 */
public class Cart_fetch extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int customer_id;

	
	public static ArrayList<CartModal> getProductsList() {
        ArrayList<CartModal> itemList = new ArrayList<>();
        
        // Database connection objects
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        Preferences userPreferences = Preferences.userRoot(); 
		int current_cust_id = userPreferences.getInt("user", 0);
		System.out.println(current_cust_id);
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			/* stmt = connection.prepareStatement(query); */

			 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Food", "root", "root");

	            // Step 3: Prepare a statement to check if user exists
	            String query = "Select * from cart where customer_id = ?";
	            stmt = conn.prepareStatement(query);
	            stmt.setInt(1, current_cust_id);

	            // Step 4: Execute the query
	            rs = stmt.executeQuery();
			
			
			List<ProductModal> productlist = Product_fetch.getProductsList();
			
			while (rs.next()) {

				int id = rs.getInt(1);
				int customerid = rs.getInt(2);
				int productid = rs.getInt(3);
				int quantity = rs.getInt(4);
				
				for(ProductModal prod: productlist) {
					if(prod.getId()==productid) {
						System.out.println(prod.getProductName());
						String prodName = prod.getProductName();
						String prodDesc = prod.getProdDesc();
						int prodPrice = prod.getPrice();
						String prodImage = prod.getImage();
						
						CartModal item = new CartModal(id, customerid, productid, quantity, prodName, prodDesc, prodPrice, prodImage);
						itemList.add(item);
					}
				}

				
//				if(resultSet.getString(3).equalsIgnoreCase(request.getParameter("email"))) {
//					a = 1; // user found
//					if(resultSet.getString(4).equals(request.getParameter("pass"))){
//						response.sendRedirect("home.jsp");
//
//					} else {
//						System.out.println("Incorrect password");
//	                  
//					}
//				} 
			}

			stmt.close();
	        conn.close();

		}catch (Exception e) {
	        e.printStackTrace();
	       
	    }
		return itemList;

	}
	
	void getProductDetails(List<ProductModal> productlist){
		
	}
}
