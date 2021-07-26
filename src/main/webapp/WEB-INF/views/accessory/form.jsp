<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <title>Dodaj akcesoria | OptimalizeANDgetDNA</title>
</head>
<body>
Pola oznaczone * są wymagane <br>
<form:form method="post" modelAttribute="accessory">
    <form:errors path="*"/>
    <%--    <form:errors path="*"/>--%>
    <form:hidden path="id"/>
    Nazwa*: <form:input path="name"/><br>
    <form:errors path="name"/><br>
    Opis: <form:input path="quantity"/><br>
    <form:errors path="quantity"/><br>
    <input type="submit">
</form:form>
<%--TODO: jak się uda niech dodaje się po kilka na raz tych akcesorióœ JS? --%>
</body>
</html>
