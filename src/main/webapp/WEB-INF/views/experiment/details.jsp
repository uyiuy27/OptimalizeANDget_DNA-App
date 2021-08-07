<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

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
    <title><spring:message code="experiment.details"/>  ${experiment.name}| OptimalizeANDgetDNA</title>
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

<h4><b><spring:message code="experiment.name"/> </b></h4>
<h5>${experiment.name}</h5>
<h4><b><spring:message code="experiment.description"/> </b></h4>
<h5>${experiment.description}</h5>
<h4><b><spring:message code="experiment.originalAuthor"/> </b></h4>
<h5>${experiment.author}</h5>
<h4><b><spring:message code="experiment.resource"/> </b></h4>
<h5>${experiment.resource}</h5>
<h4><b><spring:message code="experiment.time"/> </b></h4>
<h5>${experiment.plannedDuration}</h5>
<h4><b><spring:message code="experiment.difficulty"/> </b></h4>
<h5>${experiment.difficulty}</h5>
<h5><b><spring:message code="experiment.added"/> </b></h5>
<h6>${experiment.user.username}</h6>

<c:choose>
    <c:when test="${empty user}">
        <button><a href="/experiment/addtoexperiments/${experiment.id}"><spring:message code="experiment.add.toMine"/> </a></button>
    </c:when>
</c:choose>
<br>
<section>
    <div class="show">
        <c:choose>
            <c:when test="${!empty accessories}">
                <ul><h3><spring:message code="experiment.accessory"/> </h3>
                    <c:forEach items="${accessories}" var="accessory">
                        <li>
                                ${accessory.name} <spring:message code="experiment.quantity"/> : ${accessory.quantity}
                            <c:choose>
                                <c:when test="${!empty user}">
                                    <button><a href="/accessory/delete/${accessory.id}"><spring:message code="experiment.delete"/> </a></button>
                                </c:when>
                            </c:choose>
                        </li>
                    </c:forEach>
                </ul>
            </c:when>
        </c:choose>
        <%--    <button><a href="/accessory/add/${experiment.id}">Dodaj akcesoria</a></button>--%>
        <c:choose>
            <c:when test="${!empty user}">
                <section>
                    <button class="btnAdd"><spring:message code="experiment.add.accessory"/> </button>
                    <div class="add">
                        <spring:message code="form.required"/>  <br>
                        <form:form action="/accessory/add/${experiment.id}" method="post" modelAttribute="accessory">
                            <form:errors path="*"/>
                            <%--    <form:errors path="*"/>--%>
                            <form:hidden path="id"/>
                            <spring:message code="experiment.name"/> *: <form:input path="name"/><br>
                            <form:errors path="name"/><br>
                            <spring:message code="experiment.quantity"/> : <form:input path="quantity"/><br>
                            <form:errors path="quantity"/><br>
                            <input type="submit">
                        </form:form>
                    </div>
                </section>
            </c:when>
        </c:choose>
    </div>
<%--    <button class="btn">Pokaż/ukryj akcesoria</button>--%>
    <br>
</section>
<br>
<section>
    <div class="show">
        <c:choose>
            <c:when test="${!empty ingredients}">
                <ul><h3><spring:message code="experiment.ingredients"/> </h3>
                    <li>
                        <c:forEach items="${ingredients}" var="ingredient">
                            ${ingredient.name} <spring:message code="experiment.quantity"/> : ${ingredient.quantity} <spring:message code="experiment.concentration"/> : ${ingredient.concentration} ${ingredient.dangerous ? "Uwaga! Produkt niebezpieczny." : ""}
                            <c:choose>
                                <c:when test="${!empty user}">
                                    <button><a href="/ingredient/delete/${ingredient.id}"><spring:message code="experiment.delete"/> </a></button>
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
                    <button class="btnAdd"><spring:message code="experiment.add.ingredients"/> </button>
                    <div class="add">
                        <spring:message code="form.required"/>  <br>
                        <form:form action="/ingredient/add/${experiment.id}" method="post" modelAttribute="ingredient">
                            <form:errors path="*"/>
                            <%--    <form:errors path="*"/>--%>
                            <form:hidden path="id"/>
                            <spring:message code="experiment.name"/> *: <form:input path="name"/><br>
                            <form:errors path="name"/><br>
                            <spring:message code="experiment.quantity"/> : <form:input path="quantity"/><br>
                            <form:errors path="quantity"/><br>
                            <spring:message code="experiment.concentration"/> : <form:input path="concentration"/><br>
                            <form:errors path="concentration"/><br>
                            <spring:message code="experiment.security"/>  <br>
                            <spring:message code="experiment.security.safe"/>:  <form:radiobutton path="dangerous" value="false"/> <br>
                            <spring:message code="experiment.security.dangerous"/> : <form:radiobutton path="dangerous" value="true"/>
                            <input type="submit">
                        </form:form>
                    </div>
                </section>
            </c:when>
        </c:choose>
    </div>
<%--    <button class="btn">Pokaż/ukryj składniki</button>--%>
</section>
<br>
<section>
    <div class="show">
        <c:choose>
            <c:when test="${!empty reactions}">
                <ol><h3><spring:message code="experiment.reaction"/> </h3>
                    <c:forEach items="${reactions}" var="reaction">
                        <li>
<%--                            TODO jak wrzucić propertisa do wnętrza tej warunkowej--%>
                                ${reaction.description} ${empty reaction.time ? "" : " Czas: ".concat(reaction.time)}
                            <c:choose>
                                <c:when test="${!empty user}">
                                    <button><a href="/reaction/delete/${reaction.id}"><spring:message code="experiment.delete"/></a></button>
                                    <button><a href="/reaction/update/${reaction.id}"><spring:message code="experiment.edit"/></a></button>
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
                    <button class="btnAdd"><spring:message code="experiment.add.reaction"/></button>
                <div class="add">
                    <spring:message code="form.required"/><br>
                    <form:form action="/reaction/add/${experiment.id}" method="post" modelAttribute="reaction">
                        <form:errors path="*"/>
                        <%--    <form:errors path="*"/>--%>
                        <form:hidden path="id"/>
                        <spring:message code="experiment.description"/>*: <form:input path="description"/><br>
                        <form:errors path="description"/><br>
                        <spring:message code="experiment.reaction.time"/>: <form:input path="time"/><br>
                        <form:errors path="time"/><br>
                        <input type="submit">
                    </form:form>
                </div>

                </section>
            </c:when>
        </c:choose>
    </div>
<%--    <button class="btn">Pokaż/ukryj przebieg doświadczenia</button>--%>
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
