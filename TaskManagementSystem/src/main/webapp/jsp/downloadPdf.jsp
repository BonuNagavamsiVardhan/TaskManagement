<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Download PDF</title>
</head>
<body>
    <h1>Download PDF</h1>

    <c:choose>
        <c:when test="${empty pdfFile}">
            <p>No PDF file available for this project.</p>
        </c:when>
        <c:otherwise>
            <h2>${pdfFileName}</h2>
            <embed src="data:application/pdf;base64,${pdfFile}" width="800" height="600" type="application/pdf">
        </c:otherwise>
    </c:choose>
</body>
</html>
