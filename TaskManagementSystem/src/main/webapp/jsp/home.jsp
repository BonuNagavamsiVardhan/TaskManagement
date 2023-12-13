<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
<style>
    /* Your CSS code here */
    .intro {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 520px;
        background-image: url('jsp/bg.jpg'); 
        
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
    }

    .intro h1 {
        font-family: sans-serif;
        font-size: 60px;
        color: #000;
        font-weight: bold;
        text-transform: uppercase;
        margin: 0;
    }

    .intro p {
        font-size: 20px;
        color: #d1d1d1;
        text-transform: uppercase;
        margin: 20px 0;
    }

    .achievements {
        display: flex;
        justify-content: space-around;
        align-items: center;
        padding: 40px 80px;
    }

    .achievements .work {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 0 40px;
    }

    .achievements .work i {
        width: fit-content;
        font-size: 50px;
        color: #333333;
        border-radius: 50%;
        border: 2px solid #333333;
        padding: 12px;
    }

    .achievements .work .work-heading {
        font-size: 20px;
        color: #333333;
        text-transform: uppercase;
        margin: 10px 0;
    }

    .achievements .work .work-text {
        font-size: 15px;
        color: #585858;
        margin: 10px 0;
    }

        .navbar {
            background-color: #333;
            overflow: hidden;
        }

        /* Navigation bar links */
        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        /* On hover, the links will change color */
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        /* Style the first division with background image */
        .bg-image {
            background-image: url('jsp/hm.gif'); /* Replace 'background.jpg' with your image file */
            height: 100vh;
            width: 100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
        }

        /* Style the content in the first division */
        .content {
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        /* Style the buttons */
        .button {
            margin: 10px;
            padding: 15px 30px; /* Make the buttons larger */
            background-color: #333; /* Background color */
            color: white; /* Text color */
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Hover effect for buttons */
        .button:hover {
            background-color: #555; /* Darker background color on hover */
        }

        /* Style the features section */
        .features {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .feature {
            margin: 20px;
            padding: 10px;
            text-align: center;
        }

        /* Style for feature links */
        .feature-link {
            cursor: pointer;
            text-decoration: underline;
            color: blue;
        }
    </style>
</head>
<body>




<!-- First division with background image -->
<div class="bg-image">
    <!-- Content in the first division -->
    <div class="content">
        <h1>Welcome to Our Task Management System</h1>
        <h2>Efficiently Manage Your Tasks</h2> <!-- Updated caption -->
        <a href="/login"> <!-- Redirect to /login -->
            <button class="button">Login</button>
        </a>
        <a href="/register"> <!-- Redirect to the Register page -->
            <button class="button">Register</button>
        </a>
    </div>
</div>
<div class="achievements">
    <div class="work">
        <i class="fas fa-list"></i> <!-- You can choose a suitable icon for Task Lists -->
        <p class="work-heading">Task Lists</p>
        <p class="work-text">Organize your tasks into lists for better management.</p>
    </div>
    <div class="work">
        <i class="fas fa-clock"></i> <!-- You can choose a suitable icon for Due Dates -->
        <p class="work-heading">Due Dates</p>
        <p class="work-text">Set due dates for tasks to prioritize and stay on schedule.</p>
    </div>
    <div class="work">
        <i class="fas fa-users"></i> <!-- You can choose a suitable icon for Collaboration -->
        <p class="work-heading">Collaboration</p>
        <p class="work-text">Collaborate with team members on tasks and projects.</p>
    </div>
    <div class="work">
        <i class="fas fa-bell"></i> <!-- You can choose a suitable icon for Reminders -->
        <p class="work-heading">Reminders</p>
        <p class="work-text">Receive notifications and reminders for upcoming tasks.</p>
    </div>
</div>
<!-- Task Management Features -->
<<div class="intro">
    <h1>Task Management Features</h1>
</div>


</body>
</html>
