<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: ilona
  Date: 25.07.2021
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodaj doświadczenie | OptimalizeANDgetDNA</title>
</head>
<body>
Pola oznaczone * są wymagane <br>
<form:form method="post" modelAttribute="experiment">
    <form:errors path="*"/>
<%--    <form:errors path="*"/>--%>
    <form:hidden path="id"/>
<%--    <form:hidden path="currentUserId"/>--%>
    Nazwa*: <form:input path="name"/><br>
    <form:errors path="name"/><br>
    Opis*: <form:input path="description"/><br>
    <form:errors path="description"/><br>
    Autor oryginalnej metody: <form:input path="author"/><br>
    <form:errors path="author"/><br>
    Żródło (artykuł/książka): <form:input path="resource"/><br>
    <form:errors path="resource"/><br>
    Trudność: <form:input path="difficulty"/><br>
    <form:errors path="difficulty"/><br>
    Planowany czas: <form:input path="plannedDuration"/><br>
    <form:errors path="plannedDuration"/><br>
    Widoczność*: <br>
    Publiczna: <form:radiobutton path="visibility" value="public"/> <br>
    Prywatna: <form:radiobutton path="visibility" value="private"/>
    <input type="submit">
</form:form>
</body>
</html>
