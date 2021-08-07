<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: ilona
  Date: 25.07.2021
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><spring:message code="experiment.add"/> | OptimalizeANDgetDNA</title>
</head>
<body>
<spring:message code="form.required"/> <br>
<form:form method="post" modelAttribute="experiment">
    <form:errors path="*"/>
<%--    <form:errors path="*"/>--%>
    <form:hidden path="id"/>
<%--    <form:hidden path="currentUserId"/>--%>
    <spring:message code="experiment.name"/>*: <form:input path="name"/><br>
    <form:errors path="name"/><br>
    <spring:message code="experiment.description"/>*: <form:input path="description"/><br>
    <form:errors path="description"/><br>
    <spring:message code="experiment.originalAuthor"/>: <form:input path="author"/><br>
    <form:errors path="author"/><br>
    <spring:message code="experiment.resource"/>: <form:input path="resource"/><br>
    <form:errors path="resource"/><br>
    <spring:message code="experiment.difficulty"/>: <form:input path="difficulty"/><br>
    <form:errors path="difficulty"/><br>
    <spring:message code="experiment.time"/>: <form:input path="plannedDuration"/><br>
    <form:errors path="plannedDuration"/><br>
    <spring:message code="experiment.visibility"/>*: <br>
    <spring:message code="experiment.visibility.public"/>: <form:radiobutton path="visibility" value="public"/> <br>
    <spring:message code="experiment.visibility.private"/>: <form:radiobutton path="visibility" value="private"/>
    <input type="submit">
</form:form>
</body>
</html>
