<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Result Management</title>
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

        .main-content {
            flex: 1;
            padding: 20px;
            max-width: 800px;
            margin: 20px auto;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center; /* Center text inside the main-content */
        }

        footer {
            background-color: #0056b3; /* Dark Blue */
            color: white;
            text-align: center;
            padding: 10px;
            width: 100%;
            box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
            position: relative; /* Ensure footer stays at the bottom of the page */
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

    <!-- Main content -->
    <div class="main-content">
		<p>
		
		
		
				<STRONG>WELCOME TO STUDENT RESULT MANAGEMENT</STRONG>
		
		
		
		</p>    
        <p>This system allows administrators to manage student results and students to view their results. Select an option from the navigation menu to get started.</p>
        <!-- Add any additional content or elements here -->
    </div>

    <footer>
        <p>&copy; 2024 Student Result Management System. All rights reserved.</p>
    </footer>

</body>
</html>
