<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Create Task</title>
    <style>
        body {
            background-color: grey;
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center center;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        h1 {
            text-align: center;
            color: while;
        }

        .container {
            width: 50%;
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
        }

        label {
            display: block;
            margin: 10px 0;
            color: #333;
        }

        input[type="text"], select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
            color: #333;
        }

        button[type="submit"] {
            display: block;
            margin: 0 auto;
            padding: 10px 20px;
            background-color: #007bff;
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
    <div class="container">
        <h1>Create Task</h1>
        <form method="POST" action="/createTask">
            <div>
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" required>
            </div>
            <div>
                <label for="description">Description:</label>
                <input type="text" id="description" name="description" required>
            </div>
            <div>
                <label for="user">User:</label>
                <select id="user" name="userId" required>
                    <c:forEach items="${users}" var="user">
                        <option value="${user.id}">${user.name}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit">Create Task</button>
        </form>
    </div>
</body>
</html>
