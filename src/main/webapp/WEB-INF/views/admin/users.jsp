<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
    <title><spring:message code="admin.title.users"/> | OptimalizeANDgetDNA</title>
</head>
<body>
<button><a href="/logout"><spring:message code="user.logout"/></a></button>
<br>
<button><a href="/"><spring:message code="home.home"/></a></button>
<br>

<button><a href="/admin/all"><spring:message code="admin.button.all"/></a></button>
<button><a href="/admin/users/all"><spring:message code="admin.button.users"/></a></button>
<button><a href="/admin/admins/all"><spring:message code="admin.button.admins"/></a></button>
<table border="1">
    <thead>
    <tr>
        <td><spring:message code="admin.name"/></td>
        <td><spring:message code="admin.email"/></td>
        <td><spring:message code="admin.work"/></td>
        <td><spring:message code="admin.position"/></td>
        <td><spring:message code="admin.role"/></td>
        <td><spring:message code="admin.action"/></td>
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
                <button><a href="/admin/change/${admin.id}"><spring:message code="admin.change"/></a></button>
                <button><a href="/user/confirm/${admin.id}"><spring:message code="admin.delete"/></a></button>
            </td>
        </tr>
        </tbody>
    </c:forEach>
</table>
<br> <br>
</body>
</html>
