package com.test.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Admin credentials can be stored in a configuration file or environment variable in a real application
    private static final String ADMIN_USERNAME = "admin";
    private static final String ADMIN_PASSWORD = "admin123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            // Handle missing credentials
            request.setAttribute("errorMessage", "Username and password are required.");
            request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
            return;
        }

        // Validate credentials
        if (ADMIN_USERNAME.equals(username) && ADMIN_PASSWORD.equals(password)) {
            response.sendRedirect("adminDashboard.jsp");
        } else {
            // Invalid credentials, redirect to login page with an error
            response.sendRedirect("adminLogin.jsp?error=Invalid credentials");
        }
    }
}
