<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ilona
  Date: 23.07.2021
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${user.username} | OptimalizeANDgetDNA</title>
</head>
<body>


<button><a href="/logout">Wyloguj</a></button>
<br>

<button><a href="/user/update/${user.id}">Edytuj dane</a></button>
<button><a href="/user/updatepass/${user.id}">Edytuj hasło</a></button>
<button><a href="/user/delete/${user.id}">Usuń konto</a></button>
<br> <br>

<button><a href="/experiment/add">Dodaj doświadczenie</a></button>
<c:choose>
    <c:when test="${!empty userExperiments}">
        <table border="1">
            <thead>
            <tr>
                <td>Nazwa</td>
                <td>Autor oryginalnej metody:</td>
                <td>Trudność wykonania:</td>
                <td>Utworzono:</td>
                <td>Planowanmy czas wykonania:</td>
                <td>Więcej</td>
            </tr>
            </thead>
            <c:forEach items="${userExperiments}" var="experiment">
                <tbody>
                <tr>
                    <td>${experiment.name}</td>
                    <td>${experiment.author}</td>
                    <td>${experiment.difficulty}</td>
                    <td>${experiment.createdOn}</td>
                    <td>${experiment.plannedDuration}</td>
                    <td>
                        <button><a href="/experiment/details/${experiment.id}">Otwórz</a></button>
                        <button><a href="/experiment/update/${experiment.id}">Edytuj</a></button>
                        <button><a href="/experiment/delete/${experiment.id}">Usuń</a></button>
                    </td>
                </tr>
                </tbody>
            </c:forEach>
        </table>
    </c:when>
</c:choose>
<br> <br>


</body>
</html>
