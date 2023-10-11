<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Complaints</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
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
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        h1{
        text-align: center;}

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #0073e6;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
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
back-button {
            margin-top: 20px;
            text-align: center;
        }

        
        .back-button a {
            background-color: #0073e6;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
            
        }

        .back-button a:hover {
            background-color: #005bbf; 
        }
    </style>
</head>
<body>
<div class="navbar">
    <img src="logo2.jpg" alt="Your Logo" class="logo">
    <span class="welcome">Welcome,</span>
    <span class="emp-id"><%= session.getAttribute("empId") %></span>
    <a href="home.jsp" class="logout-button">Log Out</a> <!-- Add the Log Out button -->
</div>
    <h1>Complaints</h1>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Description</th>
                <th>Software/Application</th>
                <th>Severity</th>
                <th>Submission Date</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${complaints}" var="complaint">
                <tr>
                    <td>${complaint.id}</td>
                    <td>${complaint.description}</td>
                    <td>${complaint.software}</td>
                    <td>${complaint.severity}</td>
                    <td>${complaint.submissionDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Back to Dashboard button -->
        <div class="back-button">
            <a href="dashboard.jsp">Back to Dashboard</a>
        </div>
</body>
</html>
