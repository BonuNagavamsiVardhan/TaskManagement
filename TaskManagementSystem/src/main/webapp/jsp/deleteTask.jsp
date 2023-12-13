<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Delete Task</title>
</head>
<body>
    <h1>Delete Task</h1>
    <form:form modelAttribute="command"  method="GET" action="/viewtask">
    <!-- Form fields here -->
    <input type="hidden" name="taskId" value="${task.id}" />
        
        <p>deleted succesfully</p>
        <input type="submit" value="home" />
    </form:form>
</body>
</html>
