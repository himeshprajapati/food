package com.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.prefs.Preferences;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cart_Connection")
public class Addtocart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int current_cust_id;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("product_id"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		try {
			
	        Preferences userPreferences = Preferences.userRoot(); 
			current_cust_id = userPreferences.getInt("user", 0);
			System.out.println(current_cust_id);
			
//			Cookie ck[]=request.getCookies();  
//			for(int i=0;i<ck.length;i++){  
//			 System.out.println(ck[i].getName()+" "+ck[i].getValue());//printing name and value of cookie
//			 
//			 if(ck[i].getName().equals("user")) {
//				 customer_id = Integer.parseInt(ck[i].getValue());
//			 }
//			}  
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/food", "root", "root");

			// Insert into cart table
			String insertQuery = "INSERT INTO cart (customer_id, product_id, quantity) VALUES (?, ?, ?)";
			PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
			preparedStatement.setInt(1, current_cust_id );
			preparedStatement.setInt(2, productId);
			preparedStatement.setInt(3, quantity);
			preparedStatement.executeUpdate();

			preparedStatement.close();
			connection.close();

			response.sendRedirect("Home.jsp");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();

		}
	}
}
