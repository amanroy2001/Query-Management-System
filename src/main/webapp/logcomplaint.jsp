<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Log a Complaint</title>
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

       
        .complaint-form {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #0073e6;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #005bb8;
        }
    </style>
</head>
<body>
    
    <div class="navbar">
        <img src="logo2.jpg" alt="Your Logo" class="logo">
        <span class="welcome">Welcome,</span>
        <span class="emp-id"><%= session.getAttribute("empId") %></span>
    </div>

    <!-- Complaint form -->
    <form action="IncidentQueryServlet" method="post" class="complaint-form">
        <label for="type">Type:</label>
        <select name="type" id="type">
            <option value="incident">Incident</option>
            <option value="query">Query</option>
        </select>
        <br>
        <label for="description">Description:</label>
        <textarea name="description" id="description" rows="4" cols="50"></textarea>
        <br>
        <label for="software">Software/Application:</label>
        <input type="text" name="software" id="software">
        <br>
        <label for="severity">Severity:</label>
        <select name="severity" id="severity">
            <option value="critical">Critical</option>
            <option value="major">Major</option>
            <option value="minor">Minor</option>
        </select>
        <input type="hidden" name="empId" value="<%= session.getAttribute("empId") %>">
        <br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
