<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<html>
<head>
    <style>
        .bg-image {
                    background-image: url('jsp/hm.gif'); /* Replace 'background.jpg' with your image file */
        
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

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            border: none;
            border: 1px solid black;
            background: #f1f1f1;
        }

        input[type="email"]:focus,
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
        .error-message {
    animation: shake 0.5s linear infinite;
    color: red;
    font-weight: bold;
    text-transform: uppercase;
    text-align: center;
  
}

@keyframes shake {
    0% {
        transform: translateX(0);
    }
    25% {
        transform: translateX(-5px);
    }
    50% {
        transform: translateX(5px);
    }
    75% {
        transform: translateX(-5px);
    }
    100% {
        transform: translateX(5px);
    }
}
        /* Your CSS styles remain the same */
    </style>
    <script>
        function validateForm() {
            var email = document.forms["loginForm"]["email"].value;
            var password = document.forms["loginForm"]["pwd"].value;
            var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

            if (email.trim() === "" || !emailPattern.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            if (password.trim() === "") {
                alert("Please enter a password.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <%@ include file="navbar.jsp" %>
    <div class="bg-image"></div>
    <div class="container">
        <h3 align="center"><u>User Login</u></h3>
        <form name="loginForm" method="post" action="login" onsubmit="return validateForm()">
            <table align="center">
                <tr>
                    <td><label>Email ID</label></td>
                    <td><input type="email" name="email" required/></td>
                </tr>
                <tr><td></td></tr>
                <tr>
                    <td><label>Password</label></td>
                    <td><input type="password" name="pwd" required/></td>
                </tr>
                <tr><td></td></tr>
                <tr><td></td></tr>
                <tr align="center">
                    <td colspan="2"><input type="submit" value="Login" class="btn"></td>
                </tr>
            </table>
        </form>
        <h3 align="center">
            New Registration ? <a href="register">Click Here</a>
        </h3>
        <div class="error-message">
            ${message}
        </div>
    </div>
</body>
</html>