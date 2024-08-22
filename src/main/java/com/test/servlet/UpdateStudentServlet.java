package com.test.servlet;

import java.io.IOException;
import java.time.LocalDate;
import com.test.model.DBManager;
import com.test.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rollNo = request.getParameter("rollNo");

        if (rollNo != null) {
            DBManager dbManager = new DBManager();
            try {
                Student student = dbManager.getStudent(rollNo);  // Use the correct method
                if (student != null) {
                    request.setAttribute("student", student);
                    request.getRequestDispatcher("editStudent.jsp").forward(request, response);
                } else {
                    response.sendRedirect("viewAllStudent.jsp?error=StudentNotFound");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("viewAllStudent.jsp?error=DatabaseError");
            } finally {
                dbManager.close();
            }
        } else {
            response.sendRedirect("viewAllStudent.jsp?error=InvalidRollNo");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rollNo = request.getParameter("rollNo");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String dobStr = request.getParameter("dob");

        // Ensure dob is not null and parse it to LocalDate
        LocalDate dob = null;
        try {
            if (dobStr != null && !dobStr.trim().isEmpty()) {
                dob = LocalDate.parse(dobStr);
            }
        } catch (Exception e) {
            // Handle invalid date format
            request.setAttribute("errorMessage", "Invalid date format.");
            request.getRequestDispatcher("editStudent.jsp").forward(request, response);
            return;
        }

        // Parse subject marks
        int maths = parseIntOrDefault(request.getParameter("maths"), 0);
        int physics = parseIntOrDefault(request.getParameter("physics"), 0);
        int chemistry = parseIntOrDefault(request.getParameter("chemistry"), 0);
        int computerScience = parseIntOrDefault(request.getParameter("computerScience"), 0);

        // Calculate total
        int total = maths + physics + chemistry + computerScience;

        // Create Student object
        Student student = new Student();
        student.setRollNo(rollNo);
        student.setName(name);
        student.setEmail(email);
        student.setDob(dob);
        student.setMaths(maths);
        student.setPhysics(physics);
        student.setChemistry(chemistry);
        student.setComputerScience(computerScience);
        student.setTotal(total);

        // Update student in DB
        DBManager dbManager = new DBManager();
        try {
            dbManager.updateStudent(student);
            // Redirect to the dashboard or another relevant page
            response.sendRedirect("adminDashboard.jsp");
        } catch (Exception e) {
            // Log and handle exceptions
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while updating the student details. Please try again.");
            request.getRequestDispatcher("editStudent.jsp").forward(request, response);
        } finally {
            // Ensure that the DBManager resources are cleaned up
            dbManager.close();
        }
    }

    // Helper method to parse integer with default value
    private int parseIntOrDefault(String value, int defaultValue) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }
}
