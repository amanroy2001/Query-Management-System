<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        /* Styles for the navigation bar */
        .navbar {
            background-color: #0073e6;
            color: #fff;
            padding: 10px;
            display: flex;
            align-items: center;
        }

        .logo {
            width: 60px;
            margin-right: 10px;
        }

        .welcome {
            font-size: 18px;
        }

        .emp-id {
            font-size: 16px;
            margin-left: 10px;
        }

       
        .options {
            margin-top: 20px;
            text-align: center;
            display: flex; /* Use flexbox to center the boxes horizontally */
            justify-content: center; /* Center the boxes horizontally */
            align-items: center; /* Center the boxes vertically */
        }

        .option-box {
            width: 200px;
            height: 200px;
            background-color: #3498db;
            margin: 10px;
            padding: 20px;
            border-radius: 10px;
            display: flex;
            flex-direction: column; /* Stack text on top of the description */
            align-items: center; /* Center text and description horizontally */
            justify-content: center; /* Center text and description vertically */
        }

        .option-text {
            font-size: 18px;
            color: #fff;
            text-decoration: none;
            margin-bottom: 10px; /* Add spacing between text and description */
        }

        .option-description {
            font-size: 14px;
            color: #fff;
            text-align: center;
        }
        
.logout-button {
    background-color: #e74c3c; 
    color: #fff; 
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 5px;
    margin-left: auto;
}

.logout-button:hover {
    background-color: #c0392b; 
}
        
    </style>
</head>
<body>
    <!-- Navigation bar -->
<div class="navbar">
    <img src="logo2.jpg" alt="Your Logo" class="logo">
    <span class="welcome">Welcome,</span>
    <span class="emp-id"><%= session.getAttribute("empId") %></span>
    <a href="home.jsp" class="logout-button">Log Out</a> 
</div>

<!-- Dashboard options -->
<div class="options">
    <div class="option-box">
        <a href="logcomplaint.jsp" class="option-text">Log a Complaint</a>
        <div class="option-description">Click here to log a new complaint</div>
    </div>
    <div class="option-box">
        <a href="viewComplaints" class="option-text">View Complaints</a>
        <div class="option-description">Click here to view complaints</div>
    </div>
</div>

    </div>
</body>
</html>
