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
    <c:when test="${!empty admin}">
        <button><a href="/admin/all"><spring:message code="admin.users"/></a></button>
    </c:when>
</c:choose>


<c:choose>
    <c:when test="${!empty user}">
        <spring:message code="home.hello"/> ${user.username}! <br>
        <button><a href="/user/account/${user.id}"><spring:message code="user.account"/></a></button>
        <button><a href="http://localhost:8080/logout"><spring:message code="user.logout"/></a></button>
    </c:when>
    <c:otherwise>
        <spring:message code="home.hello"/>!
        <button><a href="http://localhost:8080/login"><spring:message code="user.login"/></a></button>
        <button><a href="http://localhost:8080/register"><spring:message code="user.register"/></a></button>
    </c:otherwise>
</c:choose>
<button><a href="/experiment/add"><spring:message code="experiment.add"/></a></button>


<br> <br>
<spring:message code="home.info"/> <br>

<c:choose>
    <c:when test="${!empty experiments}">
        <spring:message code="home.info.login"/> <br>
        <table border="1">
            <thead>
            <tr>
                <td><spring:message code="experiment.name"/></td>
                <td><spring:message code="experiment.originalAuthor"/></td>
                <td><spring:message code="experiment.difficulty"/></td>
                <td><spring:message code="experiment.more"/></td>
            </tr>
            </thead>
            <c:forEach items="${experiments}" var="experiment">
                <tbody>
                <tr>
                    <td>${experiment.name}</td>
                    <td>${experiment.author}</td>
                    <td>${experiment.difficulty}</td>
                    <td>
                        <button><a href="/experiment/details/${experiment.id}"><spring:message code="experiment.details"/></a></button>
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
