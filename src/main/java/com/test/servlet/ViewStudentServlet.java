package com.test.servlet;

import java.io.IOException;

import com.test.model.DBManager;
import com.test.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ViewStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rollNo = request.getParameter("rollNo");

        if (rollNo == null || rollNo.trim().isEmpty()) {
            // Handle the case where rollNo is missing or invalid
            request.setAttribute("errorMessage", "Roll number is required.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        DBManager dbManager = new DBManager();
        Student student = null;
        try {
            student = dbManager.getStudent(rollNo);
            if (student == null) {
                // Handle the case where no student is found
                request.setAttribute("errorMessage", "Student not found.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
        } catch (Exception e) {
            // Log and handle any errors
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while retrieving the student details. Please try again.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        } finally {
            // Ensure that the DBManager resources are cleaned up
            dbManager.close();
        }

        // Forward the student object to the viewStudent.jsp page
        request.setAttribute("student", student);
        request.getRequestDispatcher("viewStudent.jsp").forward(request, response);
    }
}
