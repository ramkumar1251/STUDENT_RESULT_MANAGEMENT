<%@ page import="com.test.model.Student" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            color: #333;
            margin-top: 20px;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            margin-top: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            max-width: 600px;
            width: 100%;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            color: #555;
        }

        .details-column {
            background-color: #eaf4ff; /* Light Blue */
            font-weight: bold;
            text-align: center;
        }

        .value-column {
            background-color: #ffffff; /* White */
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        a {
            margin-top: 20px;
            padding: 10px 20px;
            border-radius: 5px;
            color: white;
            text-decoration: none;
            border: none;
            transition: background-color 0.3s ease;
            cursor: pointer;
            display: inline-block;
        }

        .download-button {
            background-color: #0056b3; /* Dark Blue */
        }

        .download-button:hover {
            background-color: #004494; /* Slightly Darker Blue */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Student Information</h1>
        <%
            Student student = (Student) request.getAttribute("student");
            if (student != null) {
        %>
        <table>
            <tbody>
                <tr>
                    <td class="details-column">Roll Number</td>
                    <td class="value-column"><%= student.getRollNo() %></td>
                </tr>
                <tr>
                    <td class="details-column">Name</td>
                    <td class="value-column"><%= student.getName() %></td>
                </tr>
                <tr>
                    <td class="details-column">Email</td>
                    <td class="value-column"><%= student.getEmail() %></td>
                </tr>
                <tr>
                    <td class="details-column">Date of Birth</td>
                    <td class="value-column"><%= student.getDob() %></td>
                </tr>
                <tr>
                    <td class="details-column">Maths</td>
                    <td class="value-column"><%= student.getMaths() %></td>
                </tr>
                <tr>
                    <td class="details-column">Physics</td>
                    <td class="value-column"><%= student.getPhysics() %></td>
                </tr>
                <tr>
                    <td class="details-column">Chemistry</td>
                    <td class="value-column"><%= student.getChemistry() %></td>
                </tr>
                <tr>
                    <td class="details-column">Computer Science</td>
                    <td class="value-column"><%= student.getComputerScience() %></td>
                </tr>
                <tr>
                    <td class="details-column">Total</td>
                    <td class="value-column"><%= student.getTotal() %></td>
                </tr>
            </tbody>
        </table>
        <% } else { %>
        <p>Student not found.</p>
        <% } %>
        <a href="DownloadReportServlet" class="download-button">Download All Students Report</a>
    </div>
</body>
</html>
