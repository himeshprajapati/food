package com.db;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class ServletUpdateCartItems
 */

@WebServlet("/update_cart_items")
public class ServletUpdateCartItems extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletUpdateCartItems() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String quantity = request.getParameter("quantity");
		String cartId = request.getParameter("cart_id");
		String remove_type = request.getParameter("remove_item");
		String add_type = request.getParameter("add_item");
		System.out.println(remove_type + ":" + add_type);
		System.out.println("Inside Update:" + cartId + ": " + quantity);

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/food", "root", "root");
			PreparedStatement preparedStatement;
			// Insert into cart table
			String query;
			int new_quantity = Integer.parseInt(quantity);

			if (add_type != null) {
				new_quantity++;
			}
			if (remove_type != null) {
				new_quantity--;
			}

			if (new_quantity == 0) {
				query = "DELETE from cart WHERE cart_id = ?";
				 preparedStatement = connection.prepareStatement(query);
					preparedStatement.setInt(1, Integer.parseInt(cartId));


			} else {
				query = "UPDATE cart SET quantity = ? WHERE cart_id = ?";
				 preparedStatement = connection.prepareStatement(query);

				preparedStatement.setInt(1, new_quantity);
				preparedStatement.setInt(2, Integer.parseInt(cartId));
			}

		

			preparedStatement.executeUpdate();

			preparedStatement.close();
			connection.close();

			response.sendRedirect("cart.jsp");
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
