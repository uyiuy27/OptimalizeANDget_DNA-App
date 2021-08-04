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
    <title>Utwórz konto | OptimalizeANDgetDNA</title>
</head>
<body>
<h2>Witaj</h2>
<h5>
    <p>Cieszymy się, że chcesz wraz z nami przeprowadzać swoje eksperymenty. Zarejestruj się, aby móc korzystać z naszej strony</p>
</h5>
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
    Hasło*: <form:input type="password" path="password"/><br>
    <form:errors path="password"/><br>
<%--    Powtórz hasło: <form:input type="password" path="confirmPass"/><br>--%>
<%--    <form:errors path="confirmPass"/><br>--%>
    Miejsce pracy/uczelnia: <form:input path="workplace"/><br>
    <form:errors path="workplace"/><br>
    Stanowisko pracy: <form:input path="position"/><br>
    <form:errors path="position"/><br>
    <input type="submit">
</form:form>
</body>
</html>
