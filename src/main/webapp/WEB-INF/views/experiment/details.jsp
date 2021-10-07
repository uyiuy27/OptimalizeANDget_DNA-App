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
    <title><spring:message code="experiment.details"/> ${experiment.name} | OptimalizeANDgetDNA</title>
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">
    <link href="<c:url value="/theme/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet">

</head>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center"
           href="/user/profile/${userCurrent.id}">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">
                <spring:message code="home.hello"/> ${userCurrent.username}!
            </div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="/experiment/add">
                <span><spring:message code="experiment.add"/></span>
            </a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="/user/account/${userId}">
                <span><spring:message code="user.account"/></span>
            </a>
        </li>

        <li class="nav-item active">
            <a class="nav-link" href="http://localhost:8080/">
                <span><spring:message code="home.home"/></span>
            </a>
        </li>

        <c:choose>
            <c:when test="${!empty admin}">
                <li class="nav-item active">
                    <a class="nav-link" href="/admin/all">
                        <span><spring:message code="admin.users"/></span>
                    </a>
                </li>
            </c:when>
        </c:choose>


        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">

            <!-- Sidebar Toggler (Sidebar) -->
            <%--            <div class="text-center d-none d-md-inline">--%>
            <%--                <button class="rounded-circle border-0" id="sidebarToggle"></button>--%>
            <%--            </div>--%>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                             aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small"
                                           placeholder="Search for..." aria-label="Search"
                                           aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>
                </ul>

            </nav>
            <div class="container-fluid">
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800"><spring:message
                            code="experiment.details"/> : ${experiment.name}</h1>
                    <c:choose>
                        <c:when test="${!empty user}">
                            <a href="http://localhost:8080/logout"
                               class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><spring:message
                                    code="user.logout"/></a>
                        </c:when>
                    </c:choose>

                </div>
            </div>
            <!-- End of Topbar -->


            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
<%--                <div class="d-sm-flex align-items-center justify-content-between mb-4">--%>
<%--                    <h1 class="h3 mb-0 text-gray-800"><spring:message--%>
<%--                            code="experiment.details"/>: ${experiment.name}</h1>--%>
<%--                </div>--%>

                <div class="row">

                    <div class="col-lg-6">

                        <!-- Basic Card Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary"><spring:message
                                        code="experiment.name"/></h6>
                            </div>
                            <div class="card-body">
                                ${experiment.name} <br>
                                    <c:choose>
                                        <c:when test="${empty cantAdd}">
                                            <a class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" href="/experiment/addtoexperiments/${experiment.id}"><spring:message code="experiment.add.toMine"/> </a>
                                        </c:when>
                                    </c:choose>
                                    <br>
                            </div>
                        </div>

                        <!-- Basic Card Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary"><spring:message
                                        code="experiment.description"/></h6>
                            </div>
                            <div class="card-body">
                                ${experiment.description}
                            </div>
                        </div>

                        <!-- Basic Card Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary"><spring:message
                                        code="experiment.originalAuthor"/></h6>
                            </div>
                            <div class="card-body">
                                ${experiment.author}
                            </div>
                        </div>

                        <!-- Basic Card Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary"><spring:message
                                        code="experiment.resource"/></h6>
                            </div>
                            <div class="card-body">
                                ${experiment.resource}
                            </div>
                        </div>

                        <!-- Basic Card Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary"><spring:message
                                        code="experiment.time"/></h6>
                            </div>
                            <div class="card-body">
                                ${experiment.plannedDuration}
                            </div>
                        </div>

                        <!-- Basic Card Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary"><spring:message
                                        code="experiment.difficulty"/></h6>
                            </div>
                            <div class="card-body">
                                ${experiment.difficulty}
                            </div>
                        </div>

                        <!-- Basic Card Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary"><spring:message
                                        code="experiment.added"/></h6>
                            </div>
                            <div class="card-body">
                                <c:choose>
                                    <c:when test="${!empty userLink}">
                                        <a href="/user/profile/${experiment.addedById}">${experiment.addedBy}</a>
                                    </c:when>
                                    <c:otherwise>
                                        ${experiment.addedBy}
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                    </div>

                    <div class="col-lg-6">

                        <!-- Basic Card Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary"><spring:message
                                        code="experiment.reaction"/></h6>
                            </div>
                            <div class="card-body">
                                <c:choose>
                                    <c:when test="${!empty reactions}">
                                        <ol>
                                            <c:forEach items="${reactions}" var="reaction">
                                                <li>
                                                        <%--                            TODO jak wrzucić propertisa do wnętrza tej warunkowej--%>
                                                        ${reaction.description} ${empty reaction.time ? "" : " Czas: ".concat(reaction.time)}
                                                    <c:choose>
                                                        <c:when test="${!empty user}">
                                                            <a class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
                                                               href="/reaction/delete/${reaction.id}"><spring:message
                                                                    code="experiment.delete"/></a>
                                                            <a class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
                                                               href="/reaction/update/${reaction.id}"><spring:message
                                                                    code="experiment.edit"/></a>
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
                                        <b><spring:message code="experiment.add.reaction"/></b> <br>
                                        <div class="card-body">
                                            <spring:message code="form.required"/> <br>
                                            <form:form action="/reaction/add/${experiment.id}" method="post"
                                                       modelAttribute="reaction">
                                                <form:hidden path="id"/>
                                                <div class="form-group">
                                                    <spring:message code="experiment.description"/> *: <form:input
                                                        path="description" type="text"
                                                        class="form-control form-control-user"/><br>
                                                    <form:errors path="description" class="alert alert-danger"/><br>
                                                </div>
                                                <div class="form-group">
                                                    <spring:message code="experiment.reaction.time"/> : <form:input
                                                        path="time"
                                                        type="text"
                                                        class="form-control form-control-user"/><br>
                                                    <form:errors path="time" class="alert alert-danger"/><br>
                                                </div>
                                                <button type="submit"
                                                        class="btn btn-primary btn-user btn-block col-sm-6 mb-3 mb-sm-0">
                                                    <spring:message code="form.add"/>
                                                </button>
                                            </form:form>
                                        </div>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>

                        <!-- Basic Card Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary"><spring:message
                                        code="experiment.accessory"/></h6>
                            </div>
                            <div class="card-body">
                                <c:choose>
                                    <c:when test="${!empty accessories}">
                                        <ul>
                                            <c:forEach items="${accessories}" var="accessory">
                                                <li>
                                                        ${accessory.name} <spring:message code="experiment.quantity"/>
                                                    : ${accessory.quantity}
                                                    <c:choose>
                                                        <c:when test="${!empty user}">
                                                            <a class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
                                                               href="/accessory/delete/${accessory.id}"><spring:message
                                                                    code="experiment.delete"/> </a>
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
                                        <b><spring:message code="experiment.add.accessory"/></b> <br>
                                        <div class="card-body">
                                            <spring:message code="form.required"/> <br>
                                            <form:form action="/accessory/add/${experiment.id}" method="post"
                                                       modelAttribute="accessory">
                                                <form:hidden path="id"/>
                                                <div class="form-group">
                                                    <spring:message code="experiment.name"/> *: <form:input path="name"
                                                                                                            type="text"
                                                                                                            class="form-control form-control-user"/><br>
                                                    <form:errors path="name" class="alert alert-danger"/><br>
                                                </div>
                                                <div class="form-group">
                                                    <spring:message code="experiment.quantity"/> : <form:input
                                                        path="quantity"
                                                        type="text"
                                                        class="form-control form-control-user"/><br>
                                                    <form:errors path="quantity" class="alert alert-danger"/><br>
                                                </div>
                                                <button type="submit"
                                                        class="btn btn-primary btn-user btn-block col-sm-6 mb-3 mb-sm-0">
                                                    <spring:message code="form.add"/>
                                                </button>
                                            </form:form>
                                        </div>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>

                        <!-- Basic Card Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary"><spring:message
                                        code="experiment.ingredients"/></h6>
                            </div>
                            <div class="card-body">
                                <c:choose>
                                    <c:when test="${!empty ingredients}">
                                        <ul>

                                                <c:forEach items="${ingredients}" var="ingredient">
                                                    <li>
                                                    ${ingredient.name} <spring:message
                                                        code="experiment.quantity"/> : ${ingredient.quantity}
                                                    <spring:message
                                                            code="experiment.concentration"/> : ${ingredient.concentration} ${ingredient.dangerous ? "Uwaga! Produkt niebezpieczny." : ""}
                                                    <c:choose>
                                                        <c:when test="${!empty user}">
                                                            <a class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
                                                               href="/ingredient/delete/${ingredient.id}"><spring:message
                                                                    code="experiment.delete"/> </a>
                                                        </c:when>
                                                    </c:choose>
                                                    <br>
                                                    </li>
                                                </c:forEach>

                                        </ul>
                                    </c:when>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${!empty user}">
                                        <b><spring:message code="experiment.add.ingredients"/></b> <br>
                                        <div class="card-body">
                                            <spring:message code="form.required"/> <br>
                                            <form:form action="/ingredient/add/${experiment.id}" method="post"
                                                       modelAttribute="ingredient">
                                                <form:hidden path="id"/>
                                                <div class="form-group">
                                                    <spring:message code="experiment.name"/> *: <form:input path="name"
                                                                                                            type="text"
                                                                                                            class="form-control form-control-user"/><br>
                                                    <form:errors path="name" class="alert alert-danger"/><br>
                                                </div>
                                                <div class="form-group">
                                                    <spring:message code="experiment.quantity"/> : <form:input
                                                        path="quantity"
                                                        type="text"
                                                        class="form-control form-control-user"/><br>
                                                    <form:errors path="quantity" class="alert alert-danger"/><br>
                                                </div>
                                                <div class="form-group">
                                                    <spring:message code="experiment.concentration"/> : <form:input
                                                        path="concentration"
                                                        type="text"
                                                        class="form-control form-control-user"/><br>
                                                    <form:errors path="concentration" class="alert alert-danger"/><br>
                                                </div>
                                                <div class="form-group form-check">
                                                    <spring:message code="experiment.security"/>
                                                    <div class="form-check">
                                                        <form:radiobutton
                                                                path="dangerous"
                                                                value="false" class="form-check-input"
                                                                name="flexRadioDefault"
                                                                id="flexRadioDefault1"/>
                                                        <label class="form-check-label" for="flexRadioDefault1">
                                                            <spring:message code="experiment.security.safe"/>
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <form:radiobutton path="dangerous"
                                                                          value="true" class="form-check-input"
                                                                          name="flexRadioDefault"
                                                                          id="flexRadioDefault2"/>
                                                        <label class="form-check-label" for="flexRadioDefault2">
                                                            <spring:message code="experiment.security.dangerous"/>
                                                        </label>
                                                    </div>
                                                </div>
                                                <button type="submit"
                                                        class="btn btn-primary btn-user btn-block col-sm-6 mb-3 mb-sm-0">
                                                    <spring:message code="form.add"/>
                                                </button>
                                            </form:form>
                                        </div>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>


                    </div>

                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Your Website 2019</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>


<%--<button><a href="/logout"><spring:message code="user.logout"/></a></button>--%>
<%--<br>--%>
<%--<button><a href="/"><spring:message code="home.home"/></a></button>--%>
<%--<br>--%>
<%--<c:choose>--%>
<%--    <c:when test="${!empty user}">--%>
<%--        <button><a href="/experiment/update/${experiment.id}"><spring:message code="experiment.edit"/></a></button>--%>
<%--        <button><a href="/experiment/confirm/${experiment.id}"><spring:message code="experiment.delete"/></a></button>--%>
<%--        <button><a href="/user/account/${user.id}"><spring:message code="user.back"/></a></button>--%>
<%--    </c:when>--%>
<%--</c:choose>--%>

<%--<h4><b><spring:message code="experiment.name"/> </b></h4>--%>
<%--<h5>${experiment.name}</h5>--%>
<%--<h4><b><spring:message code="experiment.description"/> </b></h4>--%>
<%--<h5>${experiment.description}</h5>--%>
<%--<h4><b><spring:message code="experiment.originalAuthor"/> </b></h4>--%>
<%--<h5>${experiment.author}</h5>--%>
<%--<h4><b><spring:message code="experiment.resource"/> </b></h4>--%>
<%--<h5>${experiment.resource}</h5>--%>
<%--<h4><b><spring:message code="experiment.time"/> </b></h4>--%>
<%--<h5>${experiment.plannedDuration}</h5>--%>
<%--<h4><b><spring:message code="experiment.difficulty"/> </b></h4>--%>
<%--<h5>${experiment.difficulty}</h5>--%>
<%--<h5><b><spring:message code="experiment.added"/> </b></h5>--%>
<%--<h6>${experiment.user.username}</h6>--%>

<%--<c:choose>--%>
<%--    <c:when test="${empty cantAdd}">--%>
<%--        <button><a href="/experiment/addtoexperiments/${experiment.id}"><spring:message code="experiment.add.toMine"/> </a></button>--%>
<%--    </c:when>--%>
<%--</c:choose>--%>
<%--<br>--%>
<%--<section>--%>
<%--    <div class="show">--%>
<%--        <c:choose>--%>
<%--            <c:when test="${!empty accessories}">--%>
<%--                <ul><h3><spring:message code="experiment.accessory"/> </h3>--%>
<%--                    <c:forEach items="${accessories}" var="accessory">--%>
<%--                        <li>--%>
<%--                                ${accessory.name} <spring:message code="experiment.quantity"/> : ${accessory.quantity}--%>
<%--                            <c:choose>--%>
<%--                                <c:when test="${!empty user}">--%>
<%--                                    <button><a href="/accessory/delete/${accessory.id}"><spring:message code="experiment.delete"/> </a></button>--%>
<%--                                </c:when>--%>
<%--                            </c:choose>--%>
<%--                        </li>--%>
<%--                    </c:forEach>--%>
<%--                </ul>--%>
<%--            </c:when>--%>
<%--        </c:choose>--%>
<%--        &lt;%&ndash;    <button><a href="/accessory/add/${experiment.id}">Dodaj akcesoria</a></button>&ndash;%&gt;--%>
<%--        <c:choose>--%>
<%--            <c:when test="${!empty user}">--%>
<%--                <section>--%>
<%--                    <spring:message code="experiment.add.accessory"/> <br>--%>
<%--                    <div class="add">--%>
<%--                        <spring:message code="form.required"/>  <br>--%>
<%--                        <form:form action="/accessory/add/${experiment.id}" method="post" modelAttribute="accessory">--%>
<%--                            <form:errors path="*"/>--%>
<%--                            &lt;%&ndash;    <form:errors path="*"/>&ndash;%&gt;--%>
<%--                            <form:hidden path="id"/>--%>
<%--                            <spring:message code="experiment.name"/> *: <form:input path="name"/><br>--%>
<%--                            <form:errors path="name"/><br>--%>
<%--                            <spring:message code="experiment.quantity"/> : <form:input path="quantity"/><br>--%>
<%--                            <form:errors path="quantity"/><br>--%>
<%--                            <input type="submit">--%>
<%--                        </form:form>--%>
<%--                    </div>--%>
<%--                </section>--%>
<%--            </c:when>--%>
<%--        </c:choose>--%>
<%--    </div>--%>
<%--&lt;%&ndash;    <button class="btn">Pokaż/ukryj akcesoria</button>&ndash;%&gt;--%>
<%--    <br>--%>
<%--</section>--%>
<%--<br>--%>
<%--<section>--%>
<%--    <div class="show">--%>
<%--        <c:choose>--%>
<%--            <c:when test="${!empty ingredients}">--%>
<%--                <ul><h3><spring:message code="experiment.ingredients"/> </h3>--%>
<%--                    <li>--%>
<%--                        <c:forEach items="${ingredients}" var="ingredient">--%>
<%--                            ${ingredient.name} <spring:message code="experiment.quantity"/> : ${ingredient.quantity} <spring:message code="experiment.concentration"/> : ${ingredient.concentration} ${ingredient.dangerous ? "Uwaga! Produkt niebezpieczny." : ""}--%>
<%--                            <c:choose>--%>
<%--                                <c:when test="${!empty user}">--%>
<%--                                    <button><a href="/ingredient/delete/${ingredient.id}"><spring:message code="experiment.delete"/> </a></button>--%>
<%--                                </c:when>--%>
<%--                            </c:choose>--%>
<%--                            <br>--%>
<%--                        </c:forEach>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </c:when>--%>
<%--        </c:choose>--%>
<%--        <c:choose>--%>
<%--            <c:when test="${!empty user}">--%>
<%--                <section>--%>
<%--                    <spring:message code="experiment.add.ingredients"/> <br>--%>
<%--                    <div class="add">--%>
<%--                        <spring:message code="form.required"/>  <br>--%>
<%--                        <form:form action="/ingredient/add/${experiment.id}" method="post" modelAttribute="ingredient">--%>
<%--                            <form:errors path="*"/>--%>
<%--                            &lt;%&ndash;    <form:errors path="*"/>&ndash;%&gt;--%>
<%--                            <form:hidden path="id"/>--%>
<%--                            <spring:message code="experiment.name"/> *: <form:input path="name"/><br>--%>
<%--                            <form:errors path="name"/><br>--%>
<%--                            <spring:message code="experiment.quantity"/> : <form:input path="quantity"/><br>--%>
<%--                            <form:errors path="quantity"/><br>--%>
<%--                            <spring:message code="experiment.concentration"/> : <form:input path="concentration"/><br>--%>
<%--                            <form:errors path="concentration"/><br>--%>
<%--                            <spring:message code="experiment.security"/>  <br>--%>
<%--                            <spring:message code="experiment.security.safe"/>:  <form:radiobutton path="dangerous" value="false"/> <br>--%>
<%--                            <spring:message code="experiment.security.dangerous"/> : <form:radiobutton path="dangerous" value="true"/>--%>
<%--                            <input type="submit">--%>
<%--                        </form:form>--%>
<%--                    </div>--%>
<%--                </section>--%>
<%--            </c:when>--%>
<%--        </c:choose>--%>
<%--    </div>--%>
<%--&lt;%&ndash;    <button class="btn">Pokaż/ukryj składniki</button>&ndash;%&gt;--%>
<%--</section>--%>
<%--<br>--%>
<%--<section>--%>
<%--    <div class="show">--%>
<%--        <c:choose>--%>
<%--            <c:when test="${!empty reactions}">--%>
<%--                <ol><h3><spring:message code="experiment.reaction"/> </h3>--%>
<%--                    <c:forEach items="${reactions}" var="reaction">--%>
<%--                        <li>--%>
<%--&lt;%&ndash;                            TODO jak wrzucić propertisa do wnętrza tej warunkowej&ndash;%&gt;--%>
<%--                                ${reaction.description} ${empty reaction.time ? "" : " Czas: ".concat(reaction.time)}--%>
<%--                            <c:choose>--%>
<%--                                <c:when test="${!empty user}">--%>
<%--                                    <button><a href="/reaction/delete/${reaction.id}"><spring:message code="experiment.delete"/></a></button>--%>
<%--                                    <button><a href="/reaction/update/${reaction.id}"><spring:message code="experiment.edit"/></a></button>--%>
<%--                                </c:when>--%>
<%--                            </c:choose>--%>
<%--                            <br>--%>
<%--                        </li>--%>
<%--                    </c:forEach>--%>
<%--                </ol>--%>
<%--            </c:when>--%>
<%--        </c:choose>--%>
<%--        <c:choose>--%>
<%--            <c:when test="${!empty user}">--%>
<%--                <section>--%>
<%--                    <spring:message code="experiment.add.reaction"/> <br>--%>
<%--                <div class="add">--%>
<%--                    <spring:message code="form.required"/><br>--%>
<%--                    <form:form action="/reaction/add/${experiment.id}" method="post" modelAttribute="reaction">--%>
<%--                        <form:errors path="*"/>--%>
<%--                        &lt;%&ndash;    <form:errors path="*"/>&ndash;%&gt;--%>
<%--                        <form:hidden path="id"/>--%>
<%--                        <spring:message code="experiment.description"/>*: <form:input path="description"/><br>--%>
<%--                        <form:errors path="description"/><br>--%>
<%--                        <spring:message code="experiment.reaction.time"/>: <form:input path="time"/><br>--%>
<%--                        <form:errors path="time"/><br>--%>
<%--                        <input type="submit">--%>
<%--                    </form:form>--%>
<%--                </div>--%>

<%--                </section>--%>
<%--            </c:when>--%>
<%--        </c:choose>--%>
<%--    </div>--%>
<%--&lt;%&ndash;    <button class="btn">Pokaż/ukryj przebieg doświadczenia</button>&ndash;%&gt;--%>
<%--</section>--%>
<%--<br>--%>

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
