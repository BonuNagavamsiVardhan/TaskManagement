<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create Project</title>
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

        .container {
            width: 50%;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .container h1 {
            text-align: center;
            color: black;
        }

        label {
            display: block;
            margin: 15px 0;
            font-weight: bold;
        }

        input[type="text"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        p {
            text-align: center;
            font-weight: bold;
            color: #007BFF;
        }
    </style>
</head>
<body>
    <jsp:include page="adminnavbar.jsp" />

    <div class="container">
        <h1>Create Project</h1>
        <form action="/createProject" method="post">
            <label for="title">Project Title:</label>
            <input type="text" id="title" name="title" required>

            <label for="description">Project Description:</label>
            <textarea id="description" name="description" rows="4" required></textarea>

            <label for="submissionDate">Submission Date:</label>
            <input type="date" id="submissionDate" name="submissionDate" required>

            <label for="userId">Select User:</label>
            <select id="userId" name="userId">
                <c:forEach items="${users}" var="user">
                    <option value="${user.id}">${user.name}</option>
                </c:forEach>
            </select>

            <button type="submit">Create Project</button>
        </form>
    </div>

    <p>${message}</p>
</body>
</html>
