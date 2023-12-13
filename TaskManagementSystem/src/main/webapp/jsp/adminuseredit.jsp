<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User Details</title>
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
            color: white;
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

<%@ include file="adminnavbar.jsp" %>
    <br>
    <div class="container">
            <h2>Edit User Details</h2>
            <c:if test="${not empty errorMessage}">
                <p style="color: red">${errorMessage}</p>
            </c:if>
            <c:if test="${not empty user}">
                <form action="admiUpdateUser" method="post" class="container">
                    <input type="hidden" name="userId" value="${user.id}" />
                    <label for="name">Name:</label>
                    <input type="text" name="name" value="${user.name}" /><br/>
                    <label for="gender">Gender:</label>
                    <input type="text" name="gender" value="${user.gender}" /><br/>
                    <label for="email">Email:</label>
                    <input type="text" name="email" value="${user.email}" /><br/>
                    <label for="password">Password:</label>
                    <input type="password" name="password" value="${user.password}" /><br/>
                    <label for="department">Department:</label>
                    <input type="text" name="department" value="${user.department}" /><br/>
                    <button type="submit">Update User</button>
                </form>
            </c:if>
            <c:if test="${empty user}">
                <p>User not found.</p>
            </c:if>
            <br>
            <br>
<div style="text-align: center;">
    <a href="adminhome" style="text-decoration: none; display: inline-block; padding: 10px 20px; background-color: #007BFF; color: #fff; border: none; border-radius: 5px; cursor: pointer;">Back to Admin Home</a>
</div>
        </div>
       
    </div>
</body>
</html>
