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
Hello! <br>
<spring:message code="home.hello"/>

Jeżeli oznaczysz widoczność swojego doświadczenia jako publiczne, ma szansę pojawić się na naszej głównej stronie!

Zaloguj się, żeby zobaczyć szczegóły.

<%--<button><a href="/form/book/add">Dodaj książkę</a></button>--%>
<%--<button><a href="/publisher/add">Dodaj wydawnictwo</a></button>--%>
<%--<button><a href="/author/add">Dodaj autora</a></button>--%>
<br>  <br>

<table border="1">
    <c:forEach items="${experiments}" var="experiment">
        <thead>
        <tr>
            <td>Autor oryginalnej metody:</td>
            <td>Trudność wykonania:</td>
            <td>Nazwa</td>
            <td>Więcej</td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${experiment.author}</td>
            <td>${experiment.difficulty}</td>
            <td>${experiment.name}</td>
            <td><button><a href="/experiment/details/${experiment.id}">Szczegóły</a></button></td>
        </tr>
        </tbody>
    </c:forEach>
</table> <br> <br>



</body>
</html>
