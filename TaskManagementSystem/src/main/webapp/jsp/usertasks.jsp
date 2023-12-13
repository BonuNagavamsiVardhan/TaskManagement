<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Tasks</title>
    <style>
        table {
            width: 80%;
            margin-right: 20px;
            margin-left: auto;
            border-collapse: collapse;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px 15px;
            text-align: center;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:nth-child(odd) {
            background-color: #fff;
        }

        .completed {
            color: green;
            font-weight: bold;
        }

        .not-completed {
            color: red;
            font-weight: bold;
        }

        .complete-button, .uncomplete-button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            font-weight: bold;
        }

        .complete-button:hover, .uncomplete-button:hover {
            background-color: #0056b3;
        }
                 .centered-table {
    margin: 10 ; /* Center the table when the dashboard is maximized */
  }

  .left-aligned {
    margin: auto; /* Left-align the table when the dashboard is minimized */
  }
    </style>
</head>
<body>
    <%@ include file="empnavbar.jsp" %>
    <br>
    <h3 align="center">User Tasks</h3>
    <br>
    <table align="center" border="2" class="centered-table">
        <tr>
            <th>Task ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Completed</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${tasks}" var="task">
            <tr>
                <td>${task.id}</td>
                <td>${task.title}</td>
                <td>${task.description}</td>
                <td>
                    <c:choose>
                        <c:when test="${task.completed}">
                            <span class="completed">Yes</span>
                        </c:when>
                        <c:otherwise>
                            <span class="not-completed">No</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
    <form method="post" action="/updateTaskStatus/${task.id}">
        <input type="hidden" name="newStatus" value="true">
        <button class="complete-button" type="submit">Complete</button>
    </form>
    <form method="post" action="/updateTaskStatus/${task.id}">
        <input type="hidden" name="newStatus" value="false">
        <button class="uncomplete-button" type="submit">Uncomplete</button>
    </form>
</td>
                
                   
            </tr>
        </c:forEach>
    </table>
    <script>
  var sidebar = document.getElementById("sidebar");
  var table = document.querySelector(".centered-table");

  sidebar.addEventListener("mouseenter", function () {
    table.classList.remove("left-aligned");
    table.classList.add("centered-table");
  });

  sidebar.addEventListener("mouseleave", function () {
    table.classList.remove("centered-table");
    table.classList.add("left-aligned");
  });
</script>
</body>
</html>
