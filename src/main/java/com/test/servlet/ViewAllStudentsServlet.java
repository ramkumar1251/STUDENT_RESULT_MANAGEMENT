package com.test.servlet;

import java.io.IOException;
import java.util.List;

import com.test.model.DBManager;
import com.test.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ViewAllStudentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBManager dbManager = new DBManager();
        List<Student> students = null;
        try {
            students = dbManager.getAllStudents();
        } catch (Exception e) {
            // Log and handle any errors
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while retrieving the student list. Please try again.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        } finally {
            // Ensure that the DBManager resources are cleaned up
            dbManager.close();
        }

        // Forward the student list to the viewAllStudents.jsp page
        request.setAttribute("students", students);
        request.getRequestDispatcher("viewAllStudents.jsp").forward(request, response);
    }
}
