<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Confirmation</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    
    <style>
        body {
            background-color: #f5f5f5; /* Background color for the entire page */
        }

        h1 {
            background-color: #0073e6;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        .confirmation-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff; /* Solid white background */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .logo {
            display: block;
            margin: 0 auto;
            max-width: 100px;
        }

        .confirmation-message {
            font-size: 18px;
            margin-top: 20px;
        }

        .back-button {
            margin-top: 20px;
        }

        /* Style for the "Back to Dashboard" button */
        .back-button a {
            background-color: #0073e6;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }

        .back-button a:hover {
            background-color: #005bbf; /* Darker blue color on hover */
        }
    </style>
</head>
<body>
    <h1>Confirmation</h1>
    <div class="confirmation-container">
        <img src="logo2.jpg" alt="Your Logo" class="logo"> 
        <div class="confirmation-message">
            Your incident has been recorded.
            <br>
            <strong>Reference ticket number: <c:out value="${ticketNumber}" /></strong>
            <br>
            Please wait 2-3 days for further updates.
        </div>
        <!-- Back to Dashboard button -->
        <div class="back-button">
            <a href="dashboard.jsp">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
