<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    <style>
        #accessoryList {
            display: none;
        }

        #ingredientList {
            display: none;
        }

        #reactionList {
            display: none;
        }

        #formIngredients {
            display: none;
        }
        #formAccessory {
            display: none;
        }
        #formReaction {
            display: none;
        }
    </style>
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

<button id="accessory">Pokaż akcesoria</button>
<br>
<button id="ingredients">Pokaż składniki</button>
<br>
<button id="reactions">Pokaż przebieg doświadczenia</button>
<br>

<div id="accessoryList">
    <c:choose>
        <c:when test="${!empty accessories}">
            <ul><h3>Akcesoria</h3>
                <c:forEach items="${accessories}" var="accessory">
                    <li>
                            ${accessory.name} Ilość: ${accessory.quantity}
                        <button><a href="/accessory/delete/${accessory.id}">Usuń</a></button>
                    </li>
                </c:forEach>
            </ul>
        </c:when>
    </c:choose>
    <%--    // TODO: chcemy żeby się dodawało tutaj pod spodem po kliknięciu na bieżąco--%>
    <%--    <button><a href="/accessory/add/${experiment.id}">Dodaj akcesoria</a></button>--%>
    <c:choose>
        <c:when test="${!empty user}">
            <button id="addAccessory">Dodaj akcesoria</button>
            <div id="formAccessory">
                Pola oznaczone * są wymagane <br>
                <form:form action="/accessory/add/1" method="post" modelAttribute="accessory">
                    <form:errors path="*"/>
                    <%--    <form:errors path="*"/>--%>
                    <form:hidden path="id"/>
                    Nazwa*: <form:input path="name"/><br>
                    <form:errors path="name"/><br>
                    Ilość: <form:input path="quantity"/><br>
                    <form:errors path="quantity"/><br>
                    <input type="submit">
                </form:form>
            </div>
        </c:when>
    </c:choose>
</div>
<br>
<div id="ingredientList">
    <c:choose>
        <c:when test="${!empty ingredients}">
            <ul><h3>Składniki</h3>
                <li>
                    <c:forEach items="${ingredients}" var="ingredient">
                        ${ingredient.name} Ilość: ${ingredient.quantity} Stężenie: ${ingredient.concentration} ${ingredient.quantity ? "Uwaga! Produkt niebezpieczny." : ""}
                        <button><a href="/ingredient/delete/${ingredient.id}">Usuń</a></button>
                        <br>
                    </c:forEach>
                </li>
            </ul>
        </c:when>
    </c:choose>
    <button><a href="/ingredient/add/${experiment.id}">Dodaj składniki</a></button>
    <c:choose>
        <c:when test="${!empty user}">
            <button id="addIngredients">Dodaj składniki</button>
            <div id="formIngredients">
                Pola oznaczone * są wymagane <br>
                <form:form action="/ingredient/add/${experiment.id}" method="post" modelAttribute="ingredient">
                    <form:errors path="*"/>
                    <%--    <form:errors path="*"/>--%>
                    <form:hidden path="id"/>
                    Nazwa*: <form:input path="name"/><br>
                    <form:errors path="name"/><br>
                    Ilość: <form:input path="quantity"/><br>
                    <form:errors path="quantity"/><br>
                    Stężenie: <form:input path="concentration"/><br>
                    <form:errors path="concentration"/><br>
                    Bezpieczeństwo produktu: <br>
                    Bezpieczny: <form:radiobutton path="dangerous" value="false"/> <br>
                    Stwarzający zagrożenie: <form:radiobutton path="dangerous" value="true"/>
                    <input type="submit">
                </form:form>
            </div>
        </c:when>
    </c:choose>
</div>
<br>

<div id="reactionList">
    <c:choose>
        <c:when test="${!empty reactions}">
            <ol><h3>Przebieg reakcji</h3>
                <c:forEach items="${reactions}" var="reaction">
                    <li>
                            ${reaction.description} ${empty reaction.time ? "" : " Czas: ".concat(reaction.time)}
                        <button><a href="/reaction/delete/${reaction.id}">Usuń</a></button>
                        <br>
                    </li>
                </c:forEach>
            </ol>
        </c:when>
    </c:choose>
    <%--    <button><a href="/reaction/add/${experiment.id}">Dodaj kolejny etap</a></button>--%>
    <c:choose>
        <c:when test="${!empty user}">
            <button id="addReaction">Dodaj kolejny etap</button>
            <div id="formReaction">
                Pola oznaczone * są wymagane <br>
                <form:form action="/reaction/add/${experiment.id}" method="post" modelAttribute="reaction">
                    <form:errors path="*"/>
                    <%--    <form:errors path="*"/>--%>
                    <form:hidden path="id"/>
                    Opis*: <form:input path="description"/><br>
                    <form:errors path="description"/><br>
                    Czas <form:input path="time"/><br>
                    <form:errors path="time"/><br>
                    <input type="submit">
                </form:form>
            </div>
        </c:when>
    </c:choose>
</div>
<br>

<script>
    const accButton = document.querySelector("#accessory");
    const accButtonAdd = document.querySelector("#addAccessory");
    const accDiv = document.querySelector("#accessoryList")
    const accDivForm = document.querySelector("#formAccessory")

    const ingredientButton = document.querySelector("#ingredients");
    const ingredientButtonAdd = document.querySelector("#addIngredients");
    const ingredientDiv = document.querySelector("#ingredientList")
    const ingredientDivForm = document.querySelector("#formIngredients")

    const reactButton = document.querySelector("#reactions");
    const reactButtonAdd = document.querySelector("#addReaction");
    const reactDiv = document.querySelector("#reactionList")
    const reactDivForm = document.querySelector("#formReaction")

    accButton.addEventListener("click", function (event) {
        if (accDiv.style.display === "block") {
            accDiv.style.display = "none";
        } else {
            accDiv.style.display = "block";
        }
    });
    ingredientButton.addEventListener("click", function (event) {
        if (ingredientDiv.style.display === "block") {
            ingredientDiv.style.display = "none"
        } else {
            ingredientDiv.style.display = "block";
        }
    });
    reactButton.addEventListener("click", function (event) {
        if (ingredientDiv.style.display === "block") {
            ingredientDiv.style.display = "none"
        }
        reactDiv.style.display = "block";
    });
    accButtonAdd.addEventListener("click", function (event) {
    if(accDivForm.style.display === "block") {
    accDivForm.style.display = "none";
    } else {
    accDivForm.style.display = "block";
    }
    });
    ingredientButtonAdd.addEventListener("click", function (event) {
    if(ingredientDivForm.style.display === "block") {
    ingredientDivForm.style.display = "none"
    } else {
    ingredientDivForm.style.display = "block";
    }
    });
    reactButtonAdd.addEventListener("click", function (event) {
    if(ingredientDivForm.style.display === "block") {
    ingredientDivForm.style.display = "none"
    }
    reactDivForm.style.display = "block";
    });
</script>

</body>
</html>
