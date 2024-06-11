<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Task</title>
    <style>
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }
        .container {
            width: 50%;
            margin: 0 auto;
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        label {
            display: block;
            margin: 10px 0;
            color: #333;
        }
        input[type="text"],
        textarea,
        select {
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

      <div class="container">
    <h1>Update Task</h1>
    <form action="updateTask" method="post" class="container">
        <input type="hidden" name="taskId" value="${task.id}">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="${task.title}" required><br>
        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="4" required>${task.description}</textarea><br>
        <label for="user">Assign to User:</label>
        <select id="user" name="userId" required>
            <c:forEach items="${users}" var="user">
                <c:choose>
                    <c:when test="${user.name == name}">
                        <option value="${user.id}" selected>${user.name}</option>
                    </c:when>
                    <c:otherwise>
                        <option value="${user.id}">${user.name}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>
        <button type="submit">Update Task</button>
    </form>
<div style="text-align: center;">
    <a href="adminhome" style="text-decoration: none; display: inline-block; padding: 10px 20px; background-color: #007BFF; color: #fff; border: none; border-radius: 5px; cursor: pointer;">Back to Admin Home</a>
</div>
</body>
</html>
