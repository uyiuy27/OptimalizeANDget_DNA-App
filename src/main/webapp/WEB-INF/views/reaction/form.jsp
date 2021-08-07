<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
    <title><spring:message code="experiment.add.accessory"/> | OptimalizeANDgetDNA</title>
</head>
<body>
<spring:message code="form.required"/> <br>
<form:form method="post" modelAttribute="reaction">
    <%--    <form:errors path="*"/>--%>
    <form:hidden path="id"/>
    <spring:message code="experiment.description"/>*: <form:input path="description"/><br>
    <form:errors path="description"/><br>
    <spring:message code="experiment.reaction.time"/>: <form:input path="time"/><br>
    <form:errors path="time"/><br>
    <input type="submit">
</form:form>

<button><a href="/experiment/details/${experimentId}"><spring:message code="user.back"/></a></button>

</body>
</html>
