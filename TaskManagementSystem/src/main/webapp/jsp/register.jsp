<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <style>
    .bg-image {
            background-image: url('jsp/hm.gif'); /* Replace 'background.jpg' with your image file */
            height: 100vh;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        /* Use the same styles from style.css for your registration form */
        .container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        /* Add any additional styles for your form elements here */
        form {
            text-align: center;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            font-size: 18px;
            margin: 5px 0;
            border: 1px solid black; /* Set the border color to black */
            border-radius: 5px;
            background-color: #E8E8E8	; /* Set the background color to grey */
        }

        input[type="radio"] {
            margin: 0 10px;
        }

        .button {
            font-size: 18px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: blue;
            color: white;
        }
    </style>
    <script>
        var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

        function validateForm() {
            var name = document.forms["registrationForm"]["name"].value;
            var email = document.forms["registrationForm"]["email"].value;
            var password = document.forms["registrationForm"]["password"].value;
            var department = document.forms["registrationForm"]["department"].value;

            if (name.trim() === "") {
                alert("Please enter your name.");
                return false;
            }

            if (!emailPattern.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            if (password.trim().length < 8) {
                alert("Password must be at least 8 characters long.");
                return false;
            }

            // Add additional password validations here, such as requiring at least one capital letter, digit, and special character
            var passwordPattern = /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$/;
            if (!passwordPattern.test(password)) {
                alert("Password must contain at least one uppercase letter, one digit, and one special character.");
                return false;
            }

            if (department === "") {
                alert("Please select a department.");
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
        <h3 align="center"><u>User Registration</u></h3>
        <form name="registrationForm" method="post" action="register" onsubmit="return validateForm()">
            <table align="center">
                <tr>
                    <td><label>Name</label></td>
                    <td>
                        <input type="text" name="name" required="required" />
                    </td>
                </tr>
                <tr>
                    <td><label>Gender</label></td>
                    <td>
                        <input type="radio" name="gender" value="MALE" required />Male
                        <input type="radio" name="gender" value="FEMALE" required />Female
                    </td>
                </tr>
                <tr>
                    <td><label>Email</label></td>
                    <td>
                        <input type="email" name="email" required="required" />
                    </td>
                </tr>
                <tr>
                    <td><label>Password</label></td>
                    <td>
                        <input type="password" name="password" required="required" />
                    </td>
                </tr>
                <tr>
                    <td><label>Department</label></td>
                    <td>
                        <select name="department" required>
                            <option value="">---Select---</option>
                            <option value="CSE">CSE</option>
                            <option value="ECE">ECE</option>
                            <option value="CS-IT">CS-IT</option>
                            <option value="OTHERS">Others</option>
                        </select>
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2">
                        <input type="submit" value="Register" class="button">
                    </td>
                </tr>
            </table>
        </form>
        <h3 align="center">
            Login ? <a href="login">Click Here</a>
        </h3>
    </div>
</body>
</html>
