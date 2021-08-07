<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: ilona
  Date: 23.07.2021
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><spring:message code="user.create"/> | OptimalizeANDgetDNA</title>
</head>
<body>
<h2>Witaj</h2>
<h5>
<%--    TODO tu napisać coś mądrego--%>
    <p>Cieszymy się, że chcesz wraz z nami przeprowadzać swoje eksperymenty. Zarejestruj się, aby móc korzystać z naszej strony</p>
</h5>
<h6>
    <p><spring:message code="form.required"/></p>
</h6>
<form:form method="post" modelAttribute="user">
    <form:errors path="*"/>
    <form:hidden path="id"/>
    <spring:message code="user.username"/>*: <form:input path="username"/><br>
    <form:errors path="username"/><br>
    <spring:message code="admin.email"/>*: <form:input path="email"/><br>
    <form:errors path="email"/><br>
    <spring:message code="user.password"/>*: <form:input type="password" path="password"/><br>
    <form:errors path="password"/><br>
<%--    <spring:message code="user.password.confirm"/>*: <form:input type="password" path="confirmPass"/><br>--%>
<%--    <form:errors path="confirmPass"/><br>--%>
    <spring:message code="admin.work"/>: <form:input path="workplace"/><br>
    <form:errors path="workplace"/><br>
    <spring:message code="admin.position"/>: <form:input path="position"/><br>
    <form:errors path="position"/><br>
    <input type="submit">
</form:form>
</body>
</html>
