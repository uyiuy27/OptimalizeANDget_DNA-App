<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: ilona
  Date: 22.07.2021
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post">
    <div><label> <spring:message code="user.username"/> : <input type="text" name="username"/> </label></div>
    <div><label> <spring:message code="user.password"/>: <input type="password" name="password"/> </label></div>
    <div><input type="submit" value="Sign In"/></div>
<%--    crf to elemenet ukryty, zawiera automatycznie wygenerowany klucz--%>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<br>
<button><a href="/"><spring:message code="home.home"/></a></button>
<br>
</body>
</html>
