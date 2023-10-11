<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Registration</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <img src="logo2.jpg" alt="Your Logo" class="logo">
        <h2>Employee Registration</h2>
        <form action="auth?action=register" method="post">
            <label for="empId">Employee ID:</label>
            <input type="text" id="empId" name="empId" required><br>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            <label for="dept">Department:</label>
            <input type="text" id="dept" name="dept" required><br>
            <input type="submit" value="Register">
        </form>
        <p>Already registered? <a href="login.jsp">Login</a></p>
    </div>
</body>
</html>

