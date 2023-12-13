<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Submit Project</title>
    <style>
     .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .statistics-box:hover {
            transform: scale(1.1);
            background-color: #e7c798;
        }

        .statistics-box p {
            font-size: 48px;
            margin: 0;
            color: #008000;
        }

        .statistics-box {
            flex: 1;
            max-width: 300px;
            background-color: #cad9db;
            padding: 20px;
            margin: 10px;
            box-shadow: 0 5px 10px rgba(163, 157, 157, 0.2);
            text-align: center;
            color: #0a0808;
            border-radius: 10px;
            cursor: pointer;
        }

        .statistics-box h2 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        .statistics-box p {
            font-size: 48px;
            margin: 0;
        }

        .table-container {
            display: flex;
            justify-content: center;
        }

        table.styled-table {
            border-collapse: collapse;
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
            padding-right: 20px; /* Add padding to the right */
        }

        .styled-table th, .styled-table td {
            border: 1px solid #cad9db;
            padding: 8px;
            text-align: left;
        }

        .styled-table th {
            background-color: black;
            color: #fff;
        }

        .styled-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .box-completed {
            background-color: blue; /* Your desired color for completed tasks */
        }

        .box-uncompleted {
            background-color: red; /* Your desired color for uncompleted tasks */
        }

        .box-total {
            background-color: yellow; /* Your desired color for total tasks */
        }

        .centered {
            text-align: center;
            font-size: 24px;
            color: #007BFF;
        }
        
        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="file"] {
            width: 100%;
            padding: 5px;
            margin: 5px 0;
        }

        select {
            width: 100%;
            padding: 5px;
            margin: 5px 0;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
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
    <jsp:include page="empnavbar.jsp" />

  <!-- ... (your existing code above) ... -->

<div class="container">
    <h2>Submit Project</h2>

    <h2>List of Projects to be submitted</h2>
    <div class="table-container">
        <table class="styled-table">
            <tr>
                <th>Project ID</th>
                <th>Project Title</th>
                <th>Project Description</th>
                <th>Submission Date</th>
                <th>Submission Status</th>
            </tr>
            <c:forEach var="project" items="${projectList}">
                <tr>
                    <td>${project.id}</td>
                    <td>${project.title}</td>
                    <td>${project.description}</td>
                    <td>${project.submissionDate}</td>
                    <td>
                        <c:choose>
                            <c:when test="${project.submitted}">Submitted</c:when>
                            <c:otherwise>Not Submitted</c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>


        <h2>Submit a Project</h2>
        <form method="post" action="submitProject" enctype="multipart/form-data">
            <label for="projectId">Select a Project to Submit:</label>
            <select name="projectId" id="projectId">
                <c:forEach var="project" items="${projectList}">
                    <option value="${project.id}">${project.title}</option>
                </c:forEach>
            </select><br>

            <label for="submissionDate">Submission Date:</label>
            <input type="text" name="submissionDate" id="submissionDate" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()) %>" readonly><br>

            <label for="pdfFile">Upload PDF File:</label>
            <input type="file" name="pdfFile" id="pdfFile"><br>

            <input type="submit" value="Submit">
        </form>

        <p>${message}</p>
    </div>
</body>
</html>
