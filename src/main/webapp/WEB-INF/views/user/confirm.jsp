<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: ilona
  Date: 04.08.2021
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><spring:message code="user.delete"/> | OptimalizeANDgetDNA</title>
</head>
<body>
<spring:message code="user.delete.message"/>
<button><a href="/user/account/${id}"><spring:message code="user.back"/></a></button>
<button><a href="/user/delete/${id}"><spring:message code="user.delete"/></a></button>
</body>
</html>
