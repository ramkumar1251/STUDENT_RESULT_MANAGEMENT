<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
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

    h2 {
        color: #004494; /* Ensure header title text color is white */
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

    input[type="text"],
    input[type="password"] {
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
        background-color: #4CAF50; /* Green on hover */
    }

    .button-group {
        display: flex;
        justify-content: center;
        gap: 10px; /* Space between buttons */
        margin-top: 20px;
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
        padding: 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        text-decoration: none;
        box-sizing: border-box; /* Ensures padding and border are included in the width */
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
        <h2>Admin Login</h2>
        <form id="loginForm" action="AdminLoginServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required placeholder="Enter Your Username">
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required placeholder="Password">
            
            <input type="submit" value="Login" id="loginButton">
        </form>
        <% 
            String error = request.getParameter("error");
            if (error != null) {
        %>
        <p class="error"><%= error %></p>
        <% } %>
        <div class="button-group">
            <a href="index.jsp" class="back-button">Back to Home</a>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Student Result Management System. All rights reserved.</p>
    </footer>
</body>
</html>
