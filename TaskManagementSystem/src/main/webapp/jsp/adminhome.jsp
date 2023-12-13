<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            background-color: grey;
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
        }

        .container {
            max-width: 800px;
            margin: 0 auto; /* Center the content horizontally */
            margin-top: 50px; /* Adjust the top margin as needed */
        }

        /* Add styles for the content based on your design */
        h2, .styled-table, .statistics-container {
            text-align: center;
        }

        .table-container {
            display: flex;
            justify-content: center;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            max-width: 800px;
            margin: 20px auto;
        }

        th, td {
            border: 1px solid #cad9db;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: black;
            color: #fff;
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
            margin: 0 auto;
        }

        .styled-table thead {
            background-color: black;
            color: #fff;
        }

        .styled-table th, .styled-table td {
            border: 1px solid #cad9db;
            padding: 8px;
            text-align: left;
            min-width: 100px;
        }

        .styled-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .styled-table tr:hover {
            background-color: #e7c798;
        }

        .box-completed {
            background-color: blue;
        }

        .box-uncompleted {
            background-color: red;
        }

        .box-total {
            background-color: yellow;
        }

        h1, h3 {
            text-align: center;
        }

        .statistics-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 50px;
        }

        .statistics-box:hover {
            transform: scale(1.05);
            background-color: #0099cc;
            box-shadow: 0 10px 20px rgba(0, 153, 204, 0.2);
        }

        .statistics-box p {
            font-size: 48px;
            margin: 0;
            color: #00cc99;
        }

        .statistics-box {
            flex: 1;
            max-width: 300px;
            background-color: #fff;
            padding: 20px;
            margin: 10px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            color: #333;
            border-radius: 10px;
            transition: transform 0.3s, background-color 0.3s, box-shadow 0.3s;
            cursor: pointer;
        }

        .statistics-box h3 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        .statistics-box p {
            font-size: 48px;
            margin: 0;
        }

        .statistics-box a {
            text-decoration: none;
            color: #333;
        }

        .statistics-box a:hover {
            color: #0099cc;
        }

        .box-completed {
            background-color: blue; /* Your desired color for Total Task */
            transform: none; /* Remove transformation on hover */
        }

        .box-total {
            background-color: yellow; /* Your desired color for Total User */
            transform: none; /* Remove transformation on hover */
        }
    </style>
</head>
<body>
    <%@ include file="adminnavbar.jsp" %>
    <h1 align="center">WELCOME TO ADMIN Page</h1>
    <h3 align="center">${uname}</h3>

   <!--   <div class="chart-container" style="text-align: center;">
    <canvas id="pieChart" style="width: 150px; height: 150px;"></canvas>
</div>
-->

    <h2 align="center">Completed Tasks</h2>
    <table class="styled-table">
        <thead>
            <tr>
                <th>Task ID</th>
                <th>Title</th>
                <th>Username</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <!-- Loop through the list of completed tasks and display them in the table -->
            <c:forEach items="${completedTasks}" var="task">
                <tr>
                    <td>${task.id}</td>
                    <td>${task.title}</td>
                    <td>${task.user.name}</td> <!-- Display the username -->
                    <td>${task.description}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h2 align="center">Uncompleted Tasks</h2>
    <table class="styled-table">
        <thead>
            <tr>
                <th>Task ID</th>
                <th>Title</th>
                <th>Username</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <!-- Loop through the list of uncompleted tasks and display them in the table -->
            <c:forEach items="${uncompletedTasks}" var="task">
                <tr>
                    <td>${task.id}</td>
                    <td>${task.title}</td>
                    <td>${task.user.name}</td> <!-- Display the username -->
                    <td>${task.description}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="statistics-container">
        <div class="statistics-box box-total">
            <h3>Total User</h3>
            <a href="viewuser">
                <p id="anotherStatCount">${ecount}</p>
            </a>
        </div>
        <div class="statistics-box box-completed">
            <h3>Total Task</h3>
            <a href="viewtask">
                <p id="anotherStatCount">${ccount}</p>
            </a>
        </div>
    </div>

    <c:if test="${not empty message}">
        <div id="messageDiv" align="center">
            <p>${message}</p>
        </div>
    </c:if>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
    <script>
        // Get the canvas element
        var pieChartCanvas = document.getElementById("pieChart");

        // Create a pie chart
        var pieChart = new Chart(pieChartCanvas, {
            type: 'pie',
            data: {
                labels: ['Completed Tasks', 'Uncompleted Tasks'],
                datasets: [{
                    data: [${completedTasks.size()}, ${uncompletedTasks.size()}],
                    backgroundColor: ['#0099cc', 'red']
                }]
            },
            options: {
                responsive: true,
                legend: {
                    position: 'bottom'
                }
            }
        });
    </script>
</body>
</html>
