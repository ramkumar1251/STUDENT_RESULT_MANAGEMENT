package com.test.servlet;

import java.io.IOException;

import com.test.model.DBManager;
import com.test.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class StudentLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rollNo = request.getParameter("rollNo");

        if (rollNo == null || rollNo.trim().isEmpty()) {
            // Handle missing roll number
            request.setAttribute("errorMessage", "Roll number is required.");
            request.getRequestDispatcher("studentLogin.jsp").forward(request, response);
            return;
        }

        DBManager dbManager = new DBManager();
        Student student = null;
        try {
            student = dbManager.getStudent(rollNo);
            if (student != null) {
                // Successful login, forward to student dashboard
                request.setAttribute("student", student);
                request.getRequestDispatcher("studentDashboard.jsp").forward(request, response);
            } else {
                // Invalid roll number, redirect to login page with an error
                response.sendRedirect("studentLogin.jsp?error=Invalid roll number");
            }
        } catch (Exception e) {
            // Handle database errors
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request. Please try again.");
            request.getRequestDispatcher("studentLogin.jsp").forward(request, response);
        } finally {
            // Ensure that the DBManager resources are cleaned up
            dbManager.close();
        }
    }
}
