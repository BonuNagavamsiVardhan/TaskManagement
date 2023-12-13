<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false" %>
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

        input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 20px; /* Increase padding to 20px */
    margin: 10px 0 25px 0; /* Increase margin to 10px and 25px */
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
            color: red; /* Change this to the desired text color */
        }

        @keyframes blinker {
            50% {
                opacity: 0;
            }
        }
    </style>
</head>
<body>
    <%@ include file="adminlogbar.jsp" %>
    <div class="bg-image"></div>

    <div class="container">
        <h3 align="center"><u>Admin Login</u></h3>
        <form method="post" action="checkadminlogin">
            <table align="center">
                <tr>
                    <td><label>Username</label></td>
                    <td><input type="text" name="uname" required /></td>
                </tr>
                <tr>
                    <td><label>Password</label></td>
                    <td><input type="password" name="pwd" required /></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr align="center">
                    <td colspan="2"><input type="submit" value="Login" class="btn"></td>
                </tr>
            </table>
        <h3 align="center" class="blink">
            ${message}
        </h3>
        </form>
        
    </div>
</body>
</html>
