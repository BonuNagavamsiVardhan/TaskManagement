<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Admin</title>
    <style>
        body {
            background-color: grey; /* Specify the path to your background image */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center center;
            font-family: Arial, sans-serif;
        }
        .container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            display: block;
            margin: 10px 0;
            color: #333;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        label.checkbox {
            display: inline;
            margin-right: 10px;
        }
        button[type="submit"] {
            display: block;
            margin: 0 auto;
            padding: 10px 20px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <%@ include file="adminnavbar.jsp" %>
    <br>
    <div class="container">
        <h2>Edit Admin</h2>
        <form action="adminUpdate" method="post">
            <input type="hidden" name="adminId" value="${admin.id}" />
            <label for="username">Username:</label>
            <input type="text" name="username" value="${admin.username}" required /><br/>

            <label for="password">Password:</label>
            <input type="password" name="password" value="${admin.password}" required /><br/>

            <label for="active" class="checkbox">
                <input type="checkbox" name="active" ${admin.active ? 'checked' : ''} />
                Active
            </label><br/>

            <button type="submit">Update Admin</button>
        </form>
        <a href="adminhome">Back to Dashboard</a>
    </div>
</body>
</html>
