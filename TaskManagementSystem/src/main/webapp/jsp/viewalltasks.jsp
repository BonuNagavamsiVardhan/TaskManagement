<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Tasks</title>
    <style>
    .shared-table {
    width: 80%;
    margin-right: 20px;
    margin-left: auto;
    border-collapse: collapse;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    text-align: center;
  }
     body {
            background-color: grey;
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center center;
        }
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

        .complete-button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            font-weight: bold;
        }

        .complete-button:hover {
            background-color: #0056b3;
        }
        .delete-button {
    background-color: #FF5733; /* Your desired color for the delete button */
    color: white;
    border: none;
    padding: 8px 12px;
    cursor: pointer;
    font-weight: bold;
    border-radius: 5px; /* Add some border radius for rounded corners */
    margin-right: 5px; /* Add some right margin for spacing */
}

.delete-button:hover {
    background-color: #D62C00; /* Change the color on hover */
}

.update-button {
    background-color: #4CAF50; /* Your desired color for the update button */
    color: white;
    border: none;
    padding: 8px 12px;
    cursor: pointer;
    font-weight: bold;
    border-radius: 5px; /* Add some border radius for rounded corners */
}

.update-button:hover {
    background-color: #45A049; /* Change the color on hover */
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
    <%@ include file="adminnavbar.jsp" %>
    <div style="text-align: center;">
        <h3><u>All Tasks</u></h3>

<table align="center" border="2" class="centered-table">
            <tr bgcolor="black" style="color: white">
                <th>Task ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>User Name</th> <!-- Added User Name column -->
                <th>Completed</th>
                <th>Actions</th>
            </tr>
            
            <c:forEach items="${tasklist}" var="task">
                <tr>
                    <td><c:out value="${task.id}" /></td>
                    <td><c:out value="${task.title}" /></td>
                    <td><c:out value="${task.description}" /></td>
                    <td><c:out value="${task.user.name}" /></td> <!-- Display User Name -->
                    <td><c:out value="${task.completed ? 'Yes' : 'No'}" /></td>
                    <td>
                     <form method="post" action="deleteTask">
    <input type="hidden" name="taskId" value="${task.id}" />
    <button type="submit" class="delete-button">Delete</button>
</form>
<form method="get" action="updateTask">
    <input type="hidden" name="taskId" value="${task.id}" />
    <button type="submit" class="update-button">Update</button></td>
</form>

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
    </div>
    
</body>

</html>
