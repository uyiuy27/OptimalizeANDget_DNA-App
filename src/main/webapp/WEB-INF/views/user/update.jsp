<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <title>Edytuj konto | OptimalizeANDgetDNA</title>
</head>
<body>
<h6>
    <p>Pola oznaczone * są wymagane</p>
</h6>
<form:form method="post" modelAttribute="user">
    <form:errors path="*"/>
    <form:hidden path="id"/>
    Login*: <form:input path="username"/><br>
    <form:errors path="username"/><br>
    Email*: <form:input path="email"/><br>
    <form:errors path="email"/><br>
    Miejsce pracy/uczelnia: <form:input path="workplace"/><br>
    <form:errors path="workplace"/><br>
    Stanowisko pracy: <form:input path="position"/><br>
    <form:errors path="position"/><br>
    <input type="submit">
</form:form>
</body>
</html>
