<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create Team</title>
</head>
<body>
    <h2>Create Team</h2>
    <form action="/createTeam" method="post">
        <label for="teamName">Team Name:</label>
        <input type="text" id="teamName" name="teamName" required>
        <br>
        <input type="submit" value="Create Team">
    </form>
</body>
</html>
