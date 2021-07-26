<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: ilona
  Date: 25.07.2021
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Szczegóły doświadczenia ${experiment.name}| OptimalizeANDgetDNA</title>
</head>
<body>

    <h4><b>Nazwa:</b></h4>
    <h5>${experiment.name}</h5>
    <h4><b>Opis:</b></h4>
    <h5>${experiment.description}</h5>
    <h4><b>Autor oryginalnej metody:</b></h4>
    <h5>${experiment.author}</h5>
    <h4><b>Żródło:</b></h4>
    <h5>${experiment.resource}</h5>
    <h4><b>Planowany czas wykonania:</b></h4>
    <h5>${experiment.plannedDuration}</h5>
    <h4><b>Trudność:</b></h4>
    <h5>${experiment.difficulty}</h5>
    <h5><b>Dodano:</b></h5>
    <h6>${experiment.createdOn} ${experiment.user.username}</h6>

    <button><a href="/accessory/all/${experiment.id}">Pokaż akcesoria</a></button>
    <button><a href="/ingredient/all/${experiment.id}">Pokaż składniki</a></button>
    <button><a href="/reactions/all/${experiment.id}">Pokaż przebieg doświadczenia</a></button>




<%--TODO dodać te wszystkie akcesoria, składniki, i po kolei co ma się wydarzać --%>


</body>
</html>
