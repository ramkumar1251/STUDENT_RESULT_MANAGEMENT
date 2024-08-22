package com.test.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;

import com.test.model.DBManager;
import com.test.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from request
        String rollNo = request.getParameter("rollNo");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String dobString = request.getParameter("dob");
        int maths, physics, chemistry, computerScience;
        
        // Initialize DBManager
        DBManager dbManager = new DBManager();

        try {
            // Parse the date and integers from request
            LocalDate dob = LocalDate.parse(dobString); // Ensure dobString is in the correct format (e.g., "yyyy-MM-dd")
            maths = Integer.parseInt(request.getParameter("maths"));
            physics = Integer.parseInt(request.getParameter("physics"));
            chemistry = Integer.parseInt(request.getParameter("chemistry"));
            computerScience = Integer.parseInt(request.getParameter("computerScience"));
            
            // Create and populate the Student object
            Student student = new Student();
            student.setRollNo(rollNo);
            student.setName(name);
            student.setEmail(email);
            student.setDob(dob); // LocalDate instead of String
            student.setMaths(maths);
            student.setPhysics(physics);
            student.setChemistry(chemistry);
            student.setComputerScience(computerScience);
            student.setTotal(maths + physics + chemistry + computerScience); // Calculate total

            // Add the student to the database
            dbManager.addStudent(student);

            // Redirect to admin dashboard or success page
            response.sendRedirect("adminDashboard.jsp");
        } catch (DateTimeParseException e) {
            // Handle invalid date format
            request.setAttribute("errorMessage", "Invalid date format. Please use yyyy-MM-dd.");
            request.getRequestDispatcher("addStudent.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            // Handle invalid integer format
            request.setAttribute("errorMessage", "Invalid number format. Please enter valid integers.");
            request.getRequestDispatcher("addStudent.jsp").forward(request, response);
        } finally {
            // Clean up
            dbManager.close(); // Ensure the DBManager resources are properly closed
        }
    }
}
