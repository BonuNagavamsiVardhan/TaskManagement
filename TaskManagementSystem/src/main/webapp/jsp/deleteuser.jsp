<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Delete User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        p {
            font-size: 18px;
            color: #007bff;
        }

        form {
            display: inline-block;
            margin-top: 20px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Delete User</h1>
    <form:form modelAttribute="command" method="Get" action="/viewuser">
        <p>User deleted successfully</p>
        <input type="submit" value="Home" />
    </form:form>
</body>
</html>
