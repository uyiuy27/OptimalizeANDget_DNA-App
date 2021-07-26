<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: ilona
  Date: 11.07.2021
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>OptimalizeANDgetDNA</title>
</head>
<body>



<c:choose>
    <c:when test="${!empty user}">
        <spring:message code="home.hello"/> ${user.username}! <br>
        <button><a href="/user/account/${user.id}">Szczegóły konta</a></button>
        <button><a href="http://localhost:8080/logout">Wyloguj</a></button>
    </c:when>
    <c:otherwise>
        <spring:message code="home.hello"/>!
    </c:otherwise>
</c:choose>
<button><a href="/experiment/add">Dodaj doświadczenie</a></button>
<button><a href="http://localhost:8080/login">Zaloguj</a></button>

<br> <br>
Jeżeli oznaczysz widoczność swojego doświadczenia jako publiczne, ma szansę pojawić się na naszej głównej stronie! <br>

Zaloguj się, żeby zobaczyć szczegóły. <br>
<table border="1">
    <thead>
    <tr>
        <td>Autor oryginalnej metody:</td>
        <td>Trudność wykonania:</td>
        <td>Nazwa</td>
        <td>Więcej</td>
    </tr>
    </thead>
    <c:forEach items="${experiments}" var="experiment">
        <tbody>
        <tr>
            <td>${experiment.author}</td>
            <td>${experiment.difficulty}</td>
            <td>${experiment.name}</td>
            <td>
                <button><a href="/experiment/details/${experiment.id}">Szczegóły</a></button>
            </td>
        </tr>
        </tbody>
    </c:forEach>
</table>
<br> <br>


</body>
</html>
