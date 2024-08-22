<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Download Report</title>
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

    <!-- Main content -->
    <div class="main-content">
        <h1>Download Report</h1>
        <form action="DownloadReportServlet" method="get">
            <label for="rollNo">Roll Number:</label>
            <input type="text" id="rollNo" name="rollNo" required><br><br>
            <input type="submit" value="Download Report">
        </form>
    </div>

    <footer>
        <p>&copy; 2024 Student Result Management System. All rights reserved.</p>
    </footer>
</body>
</html>
