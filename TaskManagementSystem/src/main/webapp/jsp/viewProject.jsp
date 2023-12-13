<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>View Projects</title>
    <style>
        .container {
            width: 100%;
            display: flex;
            justify-content: flex-end; /* Move the container to the right */
            align-items: center;
        }

        .table-container {
            width: 40%; /* Reduced table width */
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            margin: 10px; /* Add margin for spacing */
        }

        .table-container h1 {
            text-align: center;
            color: black;
        }

        body {
            background-color: grey; /* Specify the path to your background image */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center center;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        h1 {
            text-align: center;
            margin: 0; /* Center the h1 element by removing top and bottom margins */
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        th, td {
            padding: 8px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        thead th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:nth-child(odd) {
            background-color: #fff;
        }

        td {
            display: block;
            margin: 10px 0;
        }

        a {
            text-decoration: none;
            color: #007BFF;
        }
    </style>
</head>
<body>
    <jsp:include page="adminnavbar.jsp" />
    <div class="container">
        <div class="table-container">
            <h1>Submitted Projects</h1>
            <table>
                <tbody>
                    <c:forEach items="${projectList}" var="project">
                        <c:if test="${project.submitted}">
                            <tr>
                                <td><strong>ID:</strong> ${project.id}</td>
                                <td><strong>Title:</strong> ${project.title}</td>
                                <td><strong>Description:</strong> ${project.description}</td>
                                <td><strong>Created Date:</strong> ${project.createdDate}</td>
                                <td><strong>Submission Date:</strong> ${project.submissionDate}</td>
                                <td><strong>Submitted:</strong> ${project.submitted ? 'Yes' : 'No'}</td>
                                <td>
                                    <c:if test="${not empty project.pdfFile}">
                                        <a href="downloadPdf?projectId=${project.id}">Download PDF</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="table-container">
            <h1>Not Submitted Projects</h1>
            <table>
                <tbody>
                    <c:forEach items="${projectList}" var="project">
                        <c:if test="${not project.submitted}">
                            <tr>
                                <td><strong>ID:</strong> ${project.id}</td>
                                <td><strong>Title:</strong> ${project.title}</td>
                                <td><strong>Description:</strong> ${project.description}</td>
                                <td><strong>Created Date:</strong> ${project.createdDate}</td>
                                <td><strong>Submission Date:</strong> ${project.submissionDate}</td>
                                <td><strong>Submitted:</strong> ${project.submitted ? 'Yes' : 'No'}</td>
                                <td>
                                    <c:if test="${not empty project.pdfFile}">
                                        <a href="downloadPdf?projectId=${project.id}">Download PDF</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
