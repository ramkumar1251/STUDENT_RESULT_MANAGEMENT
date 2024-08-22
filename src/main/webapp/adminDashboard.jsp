<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
            color: #fff;
            margin: 0;
        }

        .container h2 {
            color: #fff;
            margin: 10px 0 20px; /* Margin adjusted for spacing */
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

        .button-group {
            display: flex;
            justify-content: center;
            gap: 10px; /* Space between buttons */
            margin-top: 20px; /* Space from form above */
        }

        .add-student-button, .view-all-button {
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
            max-width: 200px; /* Ensure buttons are of the same size */
            flex: 1; /* Make buttons take equal space */
        }

        .add-student-button:hover, .view-all-button:hover {
            background-color: #0056b3; /* Dark Blue */
            color: white;
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

        /* Success Modal Styles */
        .modal {
            display: none; /* Hidden by default */
            position: fixed;
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto; /* Enable scroll if needed */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
            text-align: center;
            border-radius: 4px;
        }

        .modal-content p {
            margin: 0;
            font-size: 16px;
        }

        .modal.show {
            display: flex; /* Show the modal */
        }

        /* Hide the modal after a set amount of time */
        .fade-out {
            animation: fadeOut 2s forwards; /* Fade out over 2 seconds */
        }

        @keyframes fadeOut {
            0% { opacity: 1; }
            100% { opacity: 0; }
        }

        /* Logout Button Styles */
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
        <h3>Add New Student</h3>
        <div class="form-container">
            <form id="studentForm" action="AddStudentServlet" method="post" onsubmit="handleFormSubmit(); return false;">
                <input type="text" name="rollNo" placeholder="Roll Number" required />
                <input type="text" name="name" placeholder="Name" required />
                <input type="email" name="email" placeholder="Email" required />
                <input type="date" name="dob" placeholder="Date of Birth" required />
                <input type="number" name="maths" placeholder="Maths" required />
                <input type="number" name="physics" placeholder="Physics" required />
                <input type="number" name="chemistry" placeholder="Chemistry" required />
                <input type="number" name="computerScience" placeholder="Computer Science" required />
                <button type="submit">Add Student</button>
            </form>
        </div>

        <div class="button-group">
            <a href="viewAllStudents.jsp" class="add-student-button">View All Students</a>
            <a href="index.jsp" class="logout-button">Logout</a>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 School Management System. All rights reserved.</p>
    </footer>

    <!-- Success Modal -->
    <div id="successModal" class="modal">
        <div class="modal-content">
            <p>Student added successfully!</p>
        </div>
    </div>

    <script>
        function handleFormSubmit() {
            // Show the success message
            const modal = document.getElementById('successModal');
            modal.classList.add('show');
            modal.classList.add('fade-out');

            // Delay hiding the modal
            setTimeout(() => {
                modal.classList.remove('show');
                modal.classList.remove('fade-out');
            }, 2000); // 2 seconds visibility

            // Simulate form submission
            setTimeout(() => {
                document.getElementById('studentForm').submit();
            }, 100); // Delay form submission to allow modal to show first
        }
    </script>
</body>
</html>
