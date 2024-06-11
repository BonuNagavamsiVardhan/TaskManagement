<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>USER DASHBOARD</title>
    <style>
        /* Add CSS styles to create a sidebar */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .sidebar {
            width: 250px; /* Adjust the width as needed */
            height: 100%;
            background-color: #333; /* Background color of the sidebar */
            position: fixed;
            top: 0;
            left: 0;
            padding: 20px;
            color: #fff; /* Text color for links and headings */
            transition: width 0.3s; /* Add a smooth transition effect for width */
        }

        .sidebar.minimized {
            width: 50px; /* Define the minimized width */
        }

        .sidebar h1 {
            text-align: center;
            margin-bottom: 30px; /* Add more space below the heading */
            transition: font-size 0.3s; /* Add a smooth transition effect for font size */
        }

        .sidebar.minimized h1 {
            font-size: 12px; /* Define the minimized font size */
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar li {
            margin: 15px 0; /* Increase the top and bottom margin for list items */
            transition: font-size 0.3s; /* Add a smooth transition effect for font size */
        }

        .sidebar.minimized li {
            font-size: 12px; /* Define the minimized font size for list items */
        }

        .sidebar a {
            text-decoration: none;
            color: #fff;
            display: block; /* Make links full width for better clickability */
        }

        /* Style the links when hovered */
        .sidebar a:hover {
            color: #ff9900; /* Change the color as needed */
        }
    </style>
</head>
<body>
    <div class="sidebar" id="sidebar">
        <h1>Dashboard</h1>
        <ul>
            <li><a href="dashboard">Home</a></li>
            <li><a href="/viewTasks">View All tasks</a></li>
            <li><a href="/editUser">Update User</a></li>
            <li><a href="submitProject">Submit Project</a></li>
            <li><a href="viewSubmittedProjects">View Submit Project</a></li>
           <!-- <li><a href="/viewTeams">View Teams</a></li>  Add the View Teams option -->
            <li><a href=logout>Logout</a></li>
        </ul>
    </div>

    <script>
        var sidebar = document.getElementById("sidebar");

        sidebar.addEventListener("mouseenter", function() {
            sidebar.classList.remove("minimized");
        });

        sidebar.addEventListener("mouseleave", function() {
            sidebar.classList.add("minimized");
        });
    </script>
</body>
</html>
