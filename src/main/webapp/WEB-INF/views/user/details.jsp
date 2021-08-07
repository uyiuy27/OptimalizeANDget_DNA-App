<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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


<button><a href="/logout"><spring:message code="user.logout"/></a></button>
<br>
<button><a href="/"><spring:message code="home.home"/></a></button>
<br>

<button><a href="/user/update/${id}"><spring:message code="user.edit.data"/></a></button>
<button><a href="/user/updatepass/${id}"><spring:message code="user.edit.password"/></a></button>
<button><a href="/user/confirm/${id}"><spring:message code="user.delete"/></a></button>
<br> <br>

<button><a href="/experiment/add"><spring:message code="experiment.add"/></a></button>
<c:choose>
    <c:when test="${!empty userExperiments}">
        <table border="1">
            <thead>
            <tr>
                <td><spring:message code="experiment.name"/></td>
                <td><spring:message code="experiment.originalAuthor"/></td>
                <td><spring:message code="experiment.difficulty"/></td>
                <td><spring:message code="experiment.create"/></td>
                <td><spring:message code="experiment.time"/></td>
                <td><spring:message code="admin.action"/></td>
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
                        <button><a href="/experiment/details/${experiment.id}"><spring:message code="experiment.details"/></a></button>
                        <button><a href="/experiment/update/${experiment.id}"><spring:message code="experiment.edit"/></a></button>
                        <button><a href="/experiment/confirm/${experiment.id}"><spring:message code="experiment.delete"/></a></button>
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
