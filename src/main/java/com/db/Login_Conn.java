package com.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.prefs.Preferences;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Cookie;



@WebServlet("/LoginServlet")
public class Login_Conn extends HttpServlet {
    private static final long serialVersionUID = 1L;

    

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Retrieve form parameters
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Database connection objects
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Step 1: Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Step 2: Open a connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Food", "root", "root");

            // Step 3: Prepare a statement to check if user exists
            String query = "SELECT * FROM signup WHERE email = ? AND password = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            stmt.setString(2, password);

            // Step 4: Execute the query
            rs = stmt.executeQuery();

            // Step 5: Check if user exists and login accordingly
            PrintWriter out = response.getWriter();
            if (rs.next()) {
            	
            	String cust_id = Integer.toString(rs.getInt(1));
            	
//            	Cookie ck=new Cookie("user",cust_id);//creating cookie object  
//            	response.addCookie(ck);
            	
                Preferences userPreferences = Preferences.userRoot(); 
                userPreferences.put("user", cust_id); 
                
            	request.setAttribute("user", cust_id);
            	request.getRequestDispatcher("Home.jsp").forward(request, response);
            	
//                out.println("<script>");
//                out.println("alert('Login Successful!');");
//                out.println("window.location.href='Home.jsp';");
//                out.println("</script>");
            } else {
            	out.println("<script>");
                out.println("alert('Invalid User');");
                out.println("window.location.href='Login.jsp';");
                out.println("</script>");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle any exceptions appropriately
        } finally {
            // Step 6: Clean up resources
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

