<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ilona
  Date: 26.07.2021
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Wszystkie akcesoria | OptimalizeANDgetDNA</title>
</head>
<body>
<table border="1">
    <c:forEach items="${ingredients}" var="ingredient">
        <thead>
        <tr>
            <td>Nazwa:</td>
            <td>Stężenie:</td>
            <td>Ilość:</td>
            <td>Czy jest bezpieczny?</td>
            <td>Koszt/kg:</td>
            <td>Akcja:</td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${ingredient.name}</td>
            <td>${ingredient.concentration}</td>
            <td>${ingredient.quantity}</td>
            <td>${ingredient.dangerous}</td>
            <td>${ingredient.koszt}</td>
            <td>
                <button><a href="/ingredient/update/${ingredient.id}">Edytuj</a></button>
                <button><a href="/ingredient/delete/${ingredient.id}">Usuń</a></button>
            </td>
        </tr>
        </tbody>
    </c:forEach>
</table> <br> <br>
</body>
</html>
