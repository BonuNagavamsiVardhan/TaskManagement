<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <style>
    .dashboard {
        display: flex;
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

    table {
        border-collapse: collapse;
        width: 100%;
        max-width: 800px;
        padding-right: 20px; /* Add padding to the right */
    }

    th, td {
        border: 1px solid #cad9db;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: black;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    h2 {
        font-size: 24px;
    }
    .styled-table {
    border-collapse: collapse;
    width: 100%;
    max-width: 800px;
    margin: 0 auto; /* Center the table horizontally */
}


.styled-table thead {
    background-color: black; /* Header background color */
    color: #fff; /* Header text color */
}

.styled-table th, .styled-table td {
    border: 1px solid #cad9db;
    padding: 8px;
    text-align: left;
}

.styled-table tr:nth-child(even) {
    background-color: #f2f2f2;
}

.styled-table tr:hover {
    background-color: #e7c798;
}

.styled-table th, .styled-table td {
    min-width: 100px;
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

    
</style>

</head>
<body>

<%@ include file="empnavbar.jsp" %>
<h1 align="center">WELCOME TO USER MODULE</h1>
<h3 align="center"> ${ename}</h3>

<!-- Create a dashboard container for alignment -->
<div class="dashboard">
    <!-- Display completed tasks -->
     <div class="task-container">
        <div class="statistics-box box-completed">
            <h3>Completed Task Count</h3>
            <p id="taskCount">${completedTasks.size()}</p>
        </div>
        <h2>Completed Tasks count:   ${completedTasks.size()}</h2>
        <table class="styled-table">
            <thead>
                <tr>
                    <th>Task ID</th>
                    <th>Title</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${completedTasks}" var="task">
                    <tr>
                        <td>${task.id}</td>
                        <td>${task.title}</td>
                        <td>${task.description}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div> <!-- Close the completed tasks container -->

    <!-- Add space between tables -->
    <div style="width: 60px;"></div>

    <!-- Display uncompleted tasks -->
     <div class="task-container">
        <div class="statistics-box box-uncompleted">
            <h3>Uncompleted Task Count</h3>
            <p id="taskCount">${uncompletedTasks.size()}</p>
        </div>
        <h2>Uncompleted Tasks count:   ${uncompletedTasks.size()}</h2>
        <table class="styled-table">
            <thead>
                <tr>
                    <th>Task ID</th>
                    <th>Title</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${uncompletedTasks}" var="task">
                    <tr>
                        <td>${task.id}</td>
                        <td>${task.title}</td>
                        <td>${task.description}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div> <!-- Close the uncompleted tasks container -->
</div> <!-- Close the dashboard container -->


    <div class="dashboard">
    <!-- Display task count -->
   <div class="statistics-box box-total">
        <h3>Total Task</h3>
        <p id="taskCount">${taskCount}</p>
        <a href="viewTasks"> <!-- Add the href attribute with the URL you want to redirect to -->
            view
        </a>
    </div>
</div> <!-- Close the dashboard container -->
<c:if test="${not empty message}">
    <div id="messageDiv" align="center">
        <p>${message}</p>
    </div>
</c:if>



</body>
</html>
