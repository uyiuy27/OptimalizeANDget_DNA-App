<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: ilona
  Date: 04.08.2021
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edytuj hasło | OptimalizeANDgetDNA</title>
</head>
<body>
<form:form method="post" modelAttribute="userPass">
    <form:errors path="*"/>
<%--    <form:hidden path="id" value="${id}"/>--%>
    <spring:message code="user.password.update"/>: <form:input type="password" path="password" value=""/><br>
    <form:errors path="password"/><br>
    <%--    <spring:message code="user.password.confirm"/>*: <form:input type="password" path="confirmPass"/><br>--%>
    <%--    <form:errors path="confirmPass"/><br>--%>
    <input type="submit">
</form:form>
</body>
</html>
