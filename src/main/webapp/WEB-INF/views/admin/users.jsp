<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: ilona
  Date: 24.07.2021
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista użytkowników | OptimalizeANDgetDNA</title>
</head>
<body>
<button><a href="/admin/all">Wszyscy użytkownicy</a></button>
<button><a href="/admin/users/all">Użytkownicy</a></button>
<button><a href="/admin/admins/all">Admini</a></button>
<table border="1">
    <thead>
    <tr>
        <td>Nazwa użytkownika:</td>
        <td>Email</td>
        <td>Miejsce pracy</td>
        <td>Stanowisko</td>
        <td>Rola</td>
        <td>Akcja:</td>
    </tr>
    </thead>
    <c:forEach items="${users}" var="user">

        <tbody>
        <tr>
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>${user.workplace}</td>
            <td>${user.position}</td>
                <%--            <td>${admin.role}</td>--%>
            <td>
                <c:set var="string1" value="${user.role}"/>
                <c:set var="string2" value="${fn:substring(string1, 5, 11)}"/>
                    ${string2}
            </td>
            <td>
                <button><a href="#">Zmień role</a></button>
                <button><a href="/user/confirm/${user.id}">Usuń</a></button>
            </td>
        </tr>
        </tbody>
    </c:forEach>
</table>
<br> <br>
</body>
</html>
