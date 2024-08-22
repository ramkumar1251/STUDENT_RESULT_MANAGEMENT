<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.test.model.Student, com.test.model.DBManager" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Students</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #eaeaea;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            background-color: #0056b3; /* Dark Blue */
            color: white;
            padding: 20px;
            text-align: center;
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
            flex: 1;
            padding: 20px;
            max-width: 1000px;
            margin: 20px auto;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center; /* Center align text within the container */
        }

        .container h1 {
            color: #333;
            margin-bottom: 20px; /* Space between title and content */
        }

        .container h4 {
            color: #333;
            margin: 20px 0; /* Space around the "All Students" header */
        }

        .container a {
            display: inline-block;
            background-color: #0056b3; /* Dark Blue */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
            margin: 10px;
            text-align: center;
        }

        .container a:hover {
            background-color: #004494; /* Slightly Darker Blue */
        }

        .students-list {
            margin-top: 20px;
        }

        .students-list table {
            width: 100%; /* Make table full width */
            border-collapse: collapse;
            margin: 0 auto; /* Center the table */
        }

        .students-list th, .students-list td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
            font-size: 14px;
        }

        .students-list th {
            background-color: #f2f2f2;
        }

        .students-list td a.edit {
            display: inline-block;
            background-color: #ffff00; /* Light Yellow */
            color: #333;
            padding: 5px 10px;
            border: 2px solid #ffff00; /* Light Yellow */
            text-decoration: none;
            border-radius: 4px;
            font-size: 12px;
            margin-right: 5px;
        }

        .students-list td a.edit:hover {
            background-color: #ffeb3b; /* Yellow */
            color: black;
        }

        .students-list td form {
            display: inline; /* Make form inline to keep buttons next to each other */
        }

        .students-list td button.delete {
            background-color: #f08080; /* Light Red */
            color: #333;
            padding: 5px 10px;
            border: 2px solid #f08080; /* Light Red */
            text-decoration: none;
            border-radius: 4px;
            font-size: 12px;
            cursor: pointer;
        }

        .students-list td button.delete:hover {
            background-color: #dc3545; /* Red */
            color: white;
        }

        .message {
            display: none;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 4px;
            color: #333;
        }

        .message.success {
            background-color: #d4edda; /* Light Green */
            border: 1px solid #c3e6cb; /* Green */
        }

        .message.error {
            background-color: #f8d7da; /* Light Red */
            border: 1px solid #f5c6cb; /* Red */
        }
    </style>
    <script>
        function showMessage(message, type) {
            var messageElement = document.getElementById('message');
            messageElement.className = 'message ' + type;
            messageElement.innerHTML = message;
            messageElement.style.display = 'block';

            setTimeout(function() {
                messageElement.style.opacity = '0';
                setTimeout(function() {
                    messageElement.style.display = 'none';
                    messageElement.style.opacity = '1'; // Reset opacity for next message
                }, 1000);
            }, 3000); // Hide message after 3 seconds
        }

        window.onload = function() {
            var successMessage = '<%= request.getAttribute("successMessage") %>';
            var errorMessage = '<%= request.getAttribute("errorMessage") %>';
            if (successMessage) {
                showMessage(successMessage, 'success');
            } else if (errorMessage) {
                showMessage(errorMessage, 'error');
            }
        }
    </script>
</head>
<body>
    <header>
        <h1>Student Result Management System</h1>
    </header>

    <div class="container">
        <h1>All Students</h1>
        
        <div id="message" class="message"></div>
        
        <%
            DBManager dbManager = new DBManager();
            List<Student> students = dbManager.getAllStudents();
            if (students != null && !students.isEmpty()) {
        %>
        <div class="students-list">
            <table>
                <thead>
                    <tr>
                        <th>Roll Number</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Date of Birth</th>
                        <th>Maths</th>
                        <th>Physics</th>
                        <th>Chemistry</th>
                        <th>Computer Science</th>
                        <th>Total</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Student student : students) {
                            String rollNo = student.getRollNo();
                    %>
                    <tr>
                        <td><%= rollNo %></td>
                        <td><%= student.getName() %></td>
                        <td><%= student.getEmail() %></td>
                        <td><%= student.getDob() %></td>
                        <td><%= student.getSubjects().get("maths") %></td>
                        <td><%= student.getSubjects().get("physics") %></td>
                        <td><%= student.getSubjects().get("chemistry") %></td>
                        <td><%= student.getSubjects().get("computerScience") %></td>
                        <td><%= student.getTotal() %></td>
                        <td>
                            <a href="UpdateStudentServlet?rollNo=<%= rollNo %>" class="edit">Edit</a>
                            <form action="RemoveStudentServlet" method="post" style="display:inline;">
                                <input type="hidden" name="rollNo" value="<%= rollNo %>">
                                <button type="submit" class="delete" onclick="return confirm('Are you sure you want to delete this student?');">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <%
            } else {
        %>
        <p>No students found.</p>
        <%
            }
        %>
		<a href="DownloadAllReportServlet" class="download-button">Download All Report</a>
        <a href="adminDashboard.jsp" class="back-button">Back to Dashboard</a>
    </div>

    <footer>
        <p>&copy; 2024 School Management System. All rights reserved.</p>
    </footer>
</body>
</html>
