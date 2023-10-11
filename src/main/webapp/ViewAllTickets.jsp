<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Tickets</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
    back-button {
            margin-top: 20px;
            text-align: center;
            margin-left: auto;
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
        .back-button a {
            background-color: red;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
            margin-left: auto;
            
        }

        .back-button a:hover {
            background-color: red; 
        }
         h1{
        text-align: center;}
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

        .welcome {
            font-size: 18px;
        }
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        </style>
</head>
<body>
<div class="navbar">
    <img src="logo2.jpg" alt="Your Logo" class="logo">
    <span class="welcome">Welcome, Admin</span>   
    <a href="home.jsp" class="logout-button">Log Out</a> 
    
</div>

    <h1>View All Tickets</h1>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Employee ID</th> 
                <th>Description</th>
                <th>Software/Application</th>
                <th>Severity</th>
                <th>Submission Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <!-- Iterate through the list of tickets and display them in the table -->
            <c:forEach items="${tickets}" var="ticket">
                <tr>
                    <td>${ticket.id}</td>
                    <td>${ticket.empId}</td> <!-- Display Employee ID -->
                    <td>${ticket.description}</td>
                    <td>${ticket.software}</td>
                    <td>${ticket.severity}</td>
                    <td>${ticket.submissionDate}</td>
                    <!-- Add a button to delete the ticket -->
                    <td>
                        <form action="DeleteTicketServlet" method="post">
                            <input type="hidden" name="ticketId" value="${ticket.id}">
                            <input type="submit" value="Delete">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="back-button">
            <a href="admindashboard.jsp">Back to Admin Dashboard</a>
        </div>
        
    
</body>
</html>
