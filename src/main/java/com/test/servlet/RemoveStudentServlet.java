package com.test.servlet;

import java.io.IOException;
import com.test.model.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RemoveStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rollNo = request.getParameter("rollNo");

        if (rollNo == null || rollNo.trim().isEmpty()) {
            // Handle the case where rollNo is missing or empty
            request.setAttribute("errorMessage", "Roll number is required.");
            request.getRequestDispatcher("viewAllStudents.jsp").forward(request, response);
            return;
        }

        DBManager dbManager = new DBManager();
        try {
            // Remove student with the provided roll number
            dbManager.removeStudent(rollNo);

            // Redirect to admin dashboard or a confirmation page
            response.sendRedirect("viewAllStudents.jsp");
        } catch (Exception e) {
            // Log and handle exceptions, such as database errors
            e.printStackTrace();  // Use proper logging in a real application
            request.setAttribute("errorMessage", "An error occurred while removing the student. Please try again.");
            request.getRequestDispatcher("viewAllStudents.jsp").forward(request, response);
        } finally {
            // Clean up resources if necessary (depends on how DBManager is implemented)
            dbManager.close();
        }
    }
}
