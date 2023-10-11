<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <img src="logo2.jpg" alt="Your Logo" class="logo">
        <h2>Admin Login</h2>
        
        <!-- Update the form action to point to AdminLoginServlet -->
        <form action="adminLogin" method="post">
        
            <label for="adminId">Admin ID:</label>
            <input type="text" id="adminId" name="adminId" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            <input type="submit" value="Login">
        </form>
        <p>Back to Home page- <a href="home.jsp">Home Page</a></p>
        
    </div>
</body>
</html>
