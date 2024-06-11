<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="css/styles.css">
    <meta charset="UTF-8">
    <style>
        .bg-image {
            background-image: url('jsp/hm.gif');
            height: 100vh;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        body, html {
            height: 100%;
            margin: 0;
        }

        .container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            max-width: 300px;
            padding: 16px;
            background-color: white;
            border-radius: 10px;
        }

        input[type="text"],
        input[type="password"] {
            width: 85%;
            padding: 20px;
            margin: 10px 0 25px 0;
            border: none;
            background: #f1f1f1;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            background-color: #ddd;
            outline: none;
        }

        .btn {
            background-color: blue;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            width: 100%;
            opacity: 0.9;
        }

        .btn:hover {
            opacity: 1;
        }

        .blink {
            animation: blinker 2s linear infinite;
            color: red;
        }

        @keyframes blinker {
            50% {
                opacity: 0;
            }
        }
    </style>
  <script>
        function validateForm() {
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var uniqueElementsRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$/;

            if (username.trim() === "") {
                alert("Please enter a username.");
                return false;
            }

            if (password.trim().length < 8) {
                alert("Password must be at least 8 characters long.");
                return false;
            }

            if (!uniqueElementsRegex.test(password)) {
                alert("Password must contain at least one lowercase letter, one uppercase letter, one digit, and one special character.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <%@ include file="adminlogbar.jsp" %>
    <div class="bg-image"></div>
    <div class="container">
        <h1>Admin Registration</h1>
        <form action="adminregister" method="post" onsubmit="return validateForm()">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <label for="active">Active:</label>
            <input type="checkbox" id="active" name="active">
            
            <input type="submit" value="Register" class="btn">
        </form>
    </div>
</body>
</html>
