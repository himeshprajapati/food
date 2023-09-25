package com.db;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet("/Signup_Connection")
public class Signup_Conn extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Retrieve form parameters
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Database connection objects
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Step 1: Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Step 2: Open a connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food", "root", "root");

            // Step 3: Create a statement
            stmt = conn.createStatement();

            // Step 4: Execute the query
            String query = "INSERT INTO signup (email, password) VALUES ('" + email + "','" + password + "')";
            stmt.executeUpdate(query);

            // Print success message
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('Registration Successful!');");
            out.println("window.location.href='Login.jsp';");
            out.println("</script>");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle any exceptions appropriately
        } finally {
            // Step 5: Clean up resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
