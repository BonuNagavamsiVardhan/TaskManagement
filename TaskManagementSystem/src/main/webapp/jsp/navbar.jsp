<!DOCTYPE html>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="css/styles.css">
    <style>
        /* Style the navigation bar */
        .navbar {
            background-color: #000; /* Grey background color */
            overflow: hidden;
            display: flex;
            align-items: center;
            padding: 2px 0; /* Added padding to the top and bottom */
        }

        /* Navigation bar links */
        .navbar a {
            color: white;
            text-align: center;
            padding: 20px 20px;
            text-decoration: none;
            font-size: 30px; /* Increased link size */
        }

        /* On hover, the links will change color */
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

    </style>
</head>
<body>
    <!-- Navigation bar -->
    <div class="navbar">
        <a href="/login">Login</a>
        <a href="/register">Register</a>
        <a href="/adminlogin">Admin</a>
    </div>
</body>
</html>
