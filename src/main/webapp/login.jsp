<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Login</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <img src="logo2.jpg" alt="Your Logo" class="logo">
        <h2>Employee Login</h2>
        
        <form action="auth?action=login" method="post">
        
            <label for="loginId">Login ID:</label>
            <input type="text" id="empId" name="empId" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            <input type="submit" value="Login">
        </form>
        <p>Not registered yet? <a href="register.jsp">Register</a></p>
    </div>
</body>
</html>


