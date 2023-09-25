package com.db;


import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;

import jakarta.servlet.http.HttpServlet;

/**
 * Servlet implementation class Product_fetch
 */
public class Product_fetch extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public static ArrayList<ProductModal> getProductsList() {
        ArrayList<ProductModal> itemList = new ArrayList<>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/food","root","root");
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from product");

			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String productName = resultSet.getString(2);
				String prodDesc = resultSet.getString(3);
				String type = resultSet.getString(4);
				int price = resultSet.getInt(5);
				String image = resultSet.getString(6);


				ProductModal item = new ProductModal(id, productName, prodDesc, type, price, image);
				itemList.add(item);
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

			statement.close();
	        connection.close();

		}catch (Exception e) {
	        e.printStackTrace();
	       
	    }
		return itemList;

	}
}
