<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User Details</title>
    
    <style>
        body {
            background-color: #fff; /* Set the background color to white */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center center;
        }

        h1 {
            text-align: center;
            color: whilte;
        }

        .container {
            width: 50%;
            margin: 0 auto;
            background-color: #eee; /* Set the background color of the form to grey */
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
            background-color: #fff; /* Set the input fields to have a white background */
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
    <%@ include file="empnavbar.jsp" %>
    <br>
    <h1>Edit User Details</h1>

    <c:if test="${not empty errorMessage}">
        <p style="color: red">${errorMessage}</p>
    </c:if>

    <c:if test="${not empty user}">
        <div class="container">
            <form action="updateUser" method="post">
                <input type="hidden" name="eid" value="${user.id}" />
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
        </div>
    </c:if>

    <c:if test="${empty user}">
        <p>User not found.</p>
    </c:if>

  <a href="dashboard" style="display: block; text-align: center; padding: 10px 20px; background-color: #007BFF; color: white; text-decoration: none; font-weight: bold; margin: 20px auto; width: 150px;">Back to Dashboard</a>
  

</body>
</html>
