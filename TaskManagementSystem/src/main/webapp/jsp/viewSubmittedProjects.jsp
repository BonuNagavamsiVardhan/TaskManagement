<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Submitted Projects</title>
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
    </style>
</head>
<body>
    <jsp:include page="empnavbar.jsp" />

    <div class="container">
        <h1 class="centered">Submitted Projects</h1>

        <table border="1" class="styled-table">
            <tr>
                <th>Project ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Submission Date</th>
                <th>PDF File</th>
            </tr>
            <c:forEach items="${submittedProjects}" var="project">
                <tr>
                    <td>${project.id}</td>
                    <td>${project.title}</td>
                    <td>${project.description}</td>
                    <td>${project.submissionDate}</td>
                    <td>
                        <c:if test="${not empty project.pdfFile}">
                            <a href="downloadPdf?projectId=${project.id}">Download PDF</a>
                        </c:if>
                        <c:if test="${empty project.pdfFile}">
                            No PDF
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </div>
</body>
</html>
