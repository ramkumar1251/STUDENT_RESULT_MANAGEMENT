<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.test.model.*" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        header {
            background-color: #0056b3; /* Dark Blue */
            color: white;
            padding: 20px;
            text-align: center;
            width: 100%;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        footer {
            background-color: #0056b3; /* Dark Blue */
            color: white;
            text-align: center;
            padding: 10px;
            width: 100%;
            box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
            margin-top: auto; /* Pushes the footer to the bottom of the page */
        }

        .container {
            background-color: #fff;
            padding: 20px;
            margin: 20px auto; /* Center container horizontally */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            max-width: 900px;
            width: 100%;
            text-align: center; /* Center text within the container */
        }

        .container h1 {
            color: #333;
            margin: 0;
        }

        .container h3 {
            color: #333;
            margin-bottom: 20px;
        }

        .form-container {
            margin-top: 20px;
        }

        .form-container form {
            margin-bottom: 20px; /* Space between form and buttons */
        }

        .form-container input, .form-container button {
            margin-top: 10px;
            padding: 10px;
            width: calc(100% - 22px); /* Adjust width to account for padding and border */
            box-sizing: border-box; /* Ensures padding and border are included in the width */
        }

        .form-container button {
            border: none;
            border-radius: 4px;
            color: white;
            background-color: #4CAF50; /* Green */
            cursor: pointer;
            font-size: 14px; /* Consistent font size */
        }

        .form-container button:hover {
            background-color: #45a049; /* Darker Green */
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 10px; /* Space between buttons */
            margin-top: 20px; /* Space from form above */
        }

        .view-all-button {
            border: 2px solid #add8e6; /* Light Blue */
            background-color: #add8e6; /* Light Blue */
            color: #333;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 4px;
            font-size: 14px; /* Consistent font size */
            transition: background-color 0.3s ease, color 0.3s ease;
            box-sizing: border-box; /* Ensures padding and border are included in the width */
            text-align: center; /* Center text within button */
            max-width: 200px; /* Ensure button has a maximum width */
        }

        .view-all-button:hover {
            background-color: #0056b3; /* Dark Blue */
            color: white;
        }

        .logout-button {
            border: 2px solid #ff4c4c; /* Red */
            background-color: #ff4c4c; /* Red */
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 4px;
            font-size: 14px; /* Consistent font size */
            transition: background-color 0.3s ease, color 0.3s ease;
            box-sizing: border-box; /* Ensures padding and border are included in the width */
            text-align: center; /* Center text within button */
            max-width: 200px; /* Ensure button has a maximum width */
        }

        .logout-button:hover {
            background-color: #cc0000; /* Darker Red */
        }
    </style>
</head>
<body>
    <header>
        <h1>Student Result Management System</h1>
    </header>

    <div class="container">
        <h3>Edit Student Details</h3>
        <div class="form-container">
            <%
                Student student = (Student) request.getAttribute("student");
                if (student != null) {
                    String rollNo = student.getRollNo();
                    String name = student.getName();
                    String email = student.getEmail();
                    LocalDate dob = student.getDob();
                    int maths = student.getMaths();
                    int physics = student.getPhysics();
                    int chemistry = student.getChemistry();
                    int computerScience = student.getComputerScience();
            %>
            <form id="updateStudentForm" action="UpdateStudentServlet" method="post" onsubmit="handleFormSubmit(); return false;">
                <input type="hidden" name="rollNo" value="<%= rollNo %>">
                <input type="text" id="name" name="name" value="<%= name %>" required><br>
                <input type="email" id="email" name="email" value="<%= email %>" required><br>
                <input type="date" id="dob" name="dob" value="<%= dob %>" required><br>
                <input type="number" id="maths" name="maths" value="<%= maths %>" required><br>
                <input type="number" id="physics" name="physics" value="<%= physics %>" required><br>
                <input type="number" id="chemistry" name="chemistry" value="<%= chemistry %>" required><br>
                <input type="number" id="computerScience" name="computerScience" value="<%= computerScience %>" required><br>
                <button type="submit">Update Student</button>
            </form>
            <%
                } else {
            %>
            <p>No student data available for editing.</p>
            <%
                }
            %>
        </div>

        <div class="button-group">
            <a href="viewAllStudents.jsp" class="view-all-button">View All Students</a>
            <a href="adminDashboard.jsp" class="view-all-button">Back to Dashboard</a>
            <a href="index.jsp" class="logout-button">Logout</a>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 School Management System. All rights reserved.</p>
    </footer>

    <script>
        function handleFormSubmit() {
            // Submit the form
            document.getElementById('updateStudentForm').submit();

            // Redirect to view all students after a short delay
            setTimeout(() => {
                window.location.href = 'viewAllStudents.jsp';
            }, 100); // Delay for form submission
        }
    </script>
</body>
</html>
