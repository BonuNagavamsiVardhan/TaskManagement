<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Tasks</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Include jQuery library -->
    <style>
     body {
            background-color: grey; /* Specify the path to your background image */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center center;
        }
        table {
            width: 80%;
            margin-right: 20px; /* Add this line to create space on the right */
            margin-left: auto; /* Add this line to push the table to the left */
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

<br>

<h3 align="center"><u>User details</u></h3>

<table align="center" border="2" class="centered-table">
    <tr bgcolor="black" style="color:black">
        <th>ID</th>
        <th>NAME</th>
        <th>DEPARTMENT</th>
        <th>EMAIL ID</th>
        <th>ACTION</th>
    </tr>

    <c:forEach items="${userdata}" var="user">
        <tr>
            <td><c:out value="${user.id}" /></td>
            <td><c:out value="${user.name}" /></td>
            <td><c:out value="${user.department}" /></td>
            <td><c:out value="${user.email}" /></td>
            <td>
        <form method="post" action="deleteUser">
    <input type="hidden" name="userId" value="${user.id}" />
    <button type="submit" class="delete-button">Delete</button>
</form>
<form method="get" action="edituser">
    <input type="hidden" name="userId" value="${user.id}" />
    <button type="submit" class="update-button">Update</button>
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
