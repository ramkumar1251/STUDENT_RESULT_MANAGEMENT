<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
</head>
<body>
    <h1>Add Student</h1>
    <form action="AddStudentServlet" method="post">
        <label for="rollNo">Roll Number:</label>
        <input type="text" id="rollNo" name="rollNo" required><br>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>
        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" required><br>
        <label for="maths">Maths:</label>
        <input type="number" id="maths" name="maths" required><br>
        <label for="physics">Physics:</label>
        <input type="number" id="physics" name="physics" required><br>
        <label for="chemistry">Chemistry:</label>
        <input type="number" id="chemistry" name="chemistry" required><br>
        <label for="computerScience">Computer Science:</label>
        <input type="number" id="computerScience" name="computerScience" required><br>
        <input type="submit" value="Add Student">
    </form>
</body>
</html>
