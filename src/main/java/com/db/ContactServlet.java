package com.db;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Contact")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish the database connection
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/food", "root", "root");

            // Insert the user message into the database
            String insertQuery = "INSERT INTO user_messages (email, message) VALUES (?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, message);
            preparedStatement.executeUpdate();

            // Close resources
            preparedStatement.close();
            connection.close();

            // Respond to the user with an alert and redirect back to the contact page
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('Your response has been submitted.');"); // Alert message
            out.println("window.location.href = 'Home.jsp';"); // Redirect back to the contact page
            out.println("</script>");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle error appropriately
        }
    }
}
