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
<%--        <style>--%>
<%--            .show {--%>
<%--                display: none;--%>
<%--            }--%>

<%--            .add {--%>
<%--                display: none;--%>
<%--            }--%>

<%--        </style>--%>
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

<br>
<section>
    <div class="show">
        <c:choose>
            <c:when test="${!empty accessories}">
                <ul><h3>Akcesoria</h3>
                    <c:forEach items="${accessories}" var="accessory">
                        <li>
                                ${accessory.name} Ilość: ${accessory.quantity}
                            <c:choose>
                                <c:when test="${!empty user}">
                                    <button><a href="/accessory/delete/${accessory.id}">Usuń</a></button>
                                </c:when>
                            </c:choose>
                        </li>
                    </c:forEach>
                </ul>
            </c:when>
        </c:choose>
        <%--    // TODO: chcemy żeby się dodawało tutaj pod spodem po kliknięciu na bieżąco--%>
        <%--    <button><a href="/accessory/add/${experiment.id}">Dodaj akcesoria</a></button>--%>
        <c:choose>
            <c:when test="${!empty user}">
                <section>
                    <div class="add">
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
                    <button class="btnAdd">Dodaj akcesoria</button>
                </section>
            </c:when>
        </c:choose>
    </div>
    <button class="btn">Pokaż/ukryj akcesoria</button>
    <br>
</section>
<br>
<section>
    <div class="show">
        <c:choose>
            <c:when test="${!empty ingredients}">
                <ul><h3>Składniki</h3>
                    <li>
                        <c:forEach items="${ingredients}" var="ingredient">
                            ${ingredient.name} Ilość: ${ingredient.quantity} Stężenie: ${ingredient.concentration} ${ingredient.quantity ? "Uwaga! Produkt niebezpieczny." : ""}
                            <c:choose>
                                <c:when test="${!empty user}">
                                    <button><a href="/ingredient/delete/${ingredient.id}">Usuń</a></button>
                                </c:when>
                            </c:choose>
                            <br>
                        </c:forEach>
                    </li>
                </ul>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${!empty user}">
                <section>
                    <div class="add">
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
                    <button class="btnAdd">Dodaj składniki</button>
                </section>
            </c:when>
        </c:choose>
    </div>
    <button class="btn">Pokaż/ukryj składniki</button>
</section>
<br>
<section>
    <div class="show">
        <c:choose>
            <c:when test="${!empty reactions}">
                <ol><h3>Przebieg reakcji</h3>
                    <c:forEach items="${reactions}" var="reaction">
                        <li>
                                ${reaction.description} ${empty reaction.time ? "" : " Czas: ".concat(reaction.time)}
                            <c:choose>
                                <c:when test="${!empty user}">
                                    <button><a href="/reaction/delete/${reaction.id}">Usuń</a></button>
                                </c:when>
                            </c:choose>
                            <br>
                        </li>
                    </c:forEach>
                </ol>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${!empty user}">
                <section>
                <div class="add">
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
                    <button class="btnAdd">Dodaj kolejny etap</button>
                </section>
            </c:when>
        </c:choose>
    </div>
    <button class="btn">Pokaż/ukryj przebieg doświadczenia</button>
</section>
<br>

<%--<script>--%>
<%--    document.addEventListener("DOMContentLoaded", function (event) {--%>
<%--        event.preventDefault();--%>
<%--        const buttons = document.querySelectorAll(".btn");--%>
<%--        const buttonsAdd = document.querySelectorAll(".btnAdd");--%>

<%--        buttons.forEach(function (button) {--%>
<%--            button.addEventListener("click", function () {--%>
<%--                const div = this.parentElement.firstElementChild;--%>
<%--                if (div.style.display === "block") {--%>
<%--                    div.style.display = "none";--%>
<%--                } else {--%>
<%--                    div.style.display = "block";--%>
<%--                }--%>
<%--            });--%>
<%--        });--%>

<%--        buttonsAdd.forEach(function (buttonAdd) {--%>
<%--            buttonAdd.addEventListener("click", function () {--%>
<%--                const div = this.parentElement.firstElementChild;--%>
<%--                if (div.style.display === "block") {--%>
<%--                    div.style.display = "none";--%>
<%--                } else {--%>
<%--                    div.style.display = "block";--%>
<%--                }--%>
<%--            });--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>

</body>
</html>
