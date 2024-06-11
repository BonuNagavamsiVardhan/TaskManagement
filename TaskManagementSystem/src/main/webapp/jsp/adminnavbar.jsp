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

        .dashboard {
            width: 250px; /* Initial width */
            height: 100%;
            background-color: #333; /* Background color of the sidebar */
            position: fixed;
            top: 0;
            left: 0;
            padding: 20px;
            color: #fff; /* Text color for links and headings */
            transition: width 0.3s; /* Add smooth transition for width change */
        }

        .dashboard.minimized {
            width: 50px; /* Minimized width */
        }

        .dashboard.minimized h1,
        .dashboard.minimized ul,
        .dashboard.minimized li,
        .dashboard.minimized a {
            font-size: 12px; /* Set a smaller font size when minimized */
        }

        .dashboard h1 {
            text-align: center;
            margin-bottom: 30px; /* Add more space below the heading */
        }

        .dashboard ul {
            list-style: none;
            padding: 0;
        }

        .dashboard li {
            margin: 15px 0; /* Increase the top and bottom margin for list items */
        }

        .dashboard a {
            text-decoration: none;
            color: #fff;
            display: block; /* Make links full width for better clickability */
        }

        .dashboard a:hover {
            color: #ff9900; /* Change the color as needed */
        }
    </style>
</head>

<body>
    <div class="dashboard" id="sidebar">
        <h1>Dashboard</h1>
        <ul>
            <li><a href="/adminhome">Home</a></li>
            <li><a href="/createTask">Add Task</a></li>
            <li><a href="createProject">Create project</a></li>
			<li><a href="viewProjects">view project</a></li>
            <li><a href="viewuser">View All Users</a></li>
            <li><a href="viewtask">View All tasks</a></li>
            <li><a href=adminEdit>Update Admin</a></li>
            <li><a href="adminlogout">Logout</a></li>
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
