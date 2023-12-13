<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!DOCTYPE html>
<html>
<head>
    <title>View Teams</title>
</head>
<body>
    <h2>Your Teams</h2>
    <c:forEach items="${userTeams}" var="team">
        <h3>Team: ${team.teamName}</h3>
        <table border="1">
            <tr>
                <th>Member Name</th>
                <th>Member Email</th>
                <th>Member Gender</th>
                <th>Member Department</th>
            </tr>
            <c:forEach items="${team.members}" var="member">
                <tr>
                    <td>${member.name}</td>
                    <td>${member.email}</td>
                    <td>${member.gender}</td>
                    <td>${member.department}</td>
                </tr>
            </c:forEach>
        </table>
        <br>
    </c:forEach>
</body>
</html>
