<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.test.model.DBManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login</title>
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
            color: white; /* Set header text color to white */
            padding: 20px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        nav {
            background-color: #004494; /* Slightly Darker Blue */
            color: white;
            padding: 10px 0;
            text-align: center;
        }

        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center; /* Center navigation items */
        }

        nav ul li {
            margin: 0 15px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 10px;
        }

        nav ul li a:hover {
            text-decoration: underline;
            background-color: #003d7a; /* Darker Blue on hover */
            border-radius: 4px;
        }

        .container {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        width: 100%;
        margin: auto; /* Center container horizontally */
        text-align: center;
        position: absolute; /* Absolute positioning */
        top: 50%; /* Center vertically */
        left: 50%; /* Center horizontally */
        transform: translate(-50%, -50%); /* Center the container */
    }

        .container h1 {
            color: #004494; /* Consistent header title color */
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            margin-bottom: 5px;
            font-weight: bold;
            text-align: left;
            display: block;
        }

        select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box; /* Ensures padding and border are included in the width */
            width: 100%;
        }

        input[type="submit"] {
            background-color: #0056b3; /* Dark Blue */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            box-sizing: border-box; /* Ensures padding and border are included in the width */
            transition: background-color 0.3s ease;
            width: 100%; /* Ensure the button spans the full width of the container */
        }

        input[type="submit"]:hover {
            background-color: #004494; /* Slightly Darker Blue */
        }

        .error {
            color: red;
            margin-top: 15px;
            font-size: 14px;
        }

        .back-button {
            display: inline-block;
            background-color: #e0e0e0; /* Light Grey */
            color: #333;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #d0d0d0; /* Slightly Darker Grey */
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
    </style>
</head>
<body>
    <header>
        <h1>Student Result Management System</h1>
    </header>
    <nav>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="adminLogin.jsp">Admin Login</a></li>
            <li><a href="studentLogin.jsp">Student Login</a></li>
            <li><a href="about.jsp">About</a></li>
        </ul>
    </nav>

    <div class="container">
        <h1>Student Login</h1>
        <form action="StudentLoginServlet" method="post">
            <label for="rollNo">Roll Number:</label>
            <select id="rollNo" name="rollNo" required>
                <option value="">Select Your Roll Number</option>
                <% 
                    DBManager dbManager = new DBManager();
                    Connection conn = null;
                    ResultSet rs = null;

                    try {
                        conn = dbManager.getConnection();
                        if (conn != null) {
                            out.println("<p>Database connection successful!</p>");
                        } else {
                            out.println("<p>Error: No database connection!</p>");
                        }

                        // Updated SQL query to fetch both rollNo and name
                        String sql = "SELECT rollNo, name FROM students"; 
                        Statement stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            String rollNo = rs.getString("rollNo"); // Updated column name
                            String name = rs.getString("name");
                            String displayValue = rollNo + " " + name;
                %>
                <option value="<%= rollNo %>"><%= displayValue %></option>
                <% 
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("<p>Error executing query: " + e.getMessage() + "</p>");
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                %>
            </select>
            <input type="submit" value="Login">
        </form>
        <% 
            String error = request.getParameter("error");
            if (error != null) {
        %>
        <p class="error"><%= error %></p>
        <% } %>
        <a href="index.jsp" class="back-button">Back to Home</a>
    </div>

    <footer>
        <p>&copy; 2024 Student Result Management System. All rights reserved.</p>
    </footer>
</body>
</html>
