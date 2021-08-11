<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: ilona
  Date: 11.07.2021
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>OptimalizeANDgetDNA</title>
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">
    <link href="<c:url value="/theme/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet">
</head>
<body id="page-top">
<%--<%@ include file="/WEB-INF/views/header.jsp" %>--%>
<!-- Page Wrapper -->
<div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <c:choose>
            <c:when test="${!empty user}">
                <a class="sidebar-brand d-flex align-items-center justify-content-center"
                   href="/user/account/${user.id}">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">
                        <spring:message code="home.hello"/> ${user.username}!
                    </div>
                </a>
            </c:when>
            <c:otherwise>
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/login">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">
                        <spring:message code="home.hello"/>!
                    </div>
                </a>
            </c:otherwise>
        </c:choose>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="/experiment/add">
                <span><spring:message code="experiment.add"/></span>
            </a>
        </li>
        <c:choose>
            <c:when test="${!empty user}">
                <li class="nav-item active">
                    <a class="nav-link" href="/user/account/${user.id}">
                        <span><spring:message code="user.account"/></span>
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="http://localhost:8080/logout">
                        <span><spring:message code="user.logout"/></span>
                    </a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="nav-item active">
                    <a class="nav-link" href="http://localhost:8080/login">
                            <%--                        <i class="fas fa-fw fa-tachometer-alt"></i>--%>
                        <span><spring:message code="user.login"/></span>
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="http://localhost:8080/register">
                        <span><spring:message code="user.register"/></span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
        <%--TODO --%>
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
                    <h1 class="h3 mb-0 text-gray-800">OptimalizeANDgetDNA</h1>
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

                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"><spring:message code="home.info"/></h6>
                        </div>
                        <c:choose>
                            <c:when test="${!empty experiments}">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <spring:message code="home.info.login"/> <br> <br>
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                            <tr>
                                                <td><b><spring:message code="experiment.name"/></b></td>
                                                <td><b><spring:message code="experiment.originalAuthor"/></b></td>
                                                <td><b><spring:message code="experiment.difficulty"/></b></td>
                                                <td><b><spring:message code="experiment.more"/></b></td>

                                            </tr>
                                            </thead>
                                            <c:forEach items="${experiments}" var="experiment">
                                                <tbody>
                                                <tr>
                                                    <td>${experiment.name}</td>
                                                    <td>${experiment.author}</td>
                                                    <td>${experiment.difficulty}</td>
                                                    <td>
                                                        <a class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
                                                           href="/experiment/details/${experiment.id}"><spring:message
                                                                code="experiment.details"/></a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>
                            </c:when>
                        </c:choose>

                    </div>
                </div>
            </div>
        </div>

    </div>


        <%
    response.setHeader("Cache-Control", "no cache, no-store, must-revalidate");
%>
    <!-- /.container-fluid -->
    <!-- DataTales Example -->


    <%@ include file="/WEB-INF/views/footer.jsp" %>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>
</body>
<%--<body>--%>
<%--<c:choose>--%>
<%--    <c:when test="${!empty admin}">--%>
<%--        <button><a href="/admin/all"><spring:message code="admin.users"/></a></button>--%>
<%--    </c:when>--%>
<%--</c:choose>--%>


<%--<c:choose>--%>
<%--    <c:when test="${!empty user}">--%>
<%--        <spring:message code="home.hello"/> ${user.username}! <br>--%>
<%--        <button><a href="/user/account/${user.id}"><spring:message code="user.account"/></a></button>--%>
<%--        <button><a href="http://localhost:8080/logout"><spring:message code="user.logout"/></a></button>--%>
<%--    </c:when>--%>
<%--    <c:otherwise>--%>
<%--        <spring:message code="home.hello"/>!--%>
<%--        <button><a href="http://localhost:8080/login"><spring:message code="user.login"/></a></button>--%>
<%--        <button><a href="http://localhost:8080/register"><spring:message code="user.register"/></a></button>--%>
<%--    </c:otherwise>--%>
<%--</c:choose>--%>
<%--<button><a href="/experiment/add"><spring:message code="experiment.add"/></a></button>--%>


<%--<br> <br>--%>
<%--<spring:message code="home.info"/> <br>--%>

<%--<c:choose>--%>
<%--    <c:when test="${!empty experiments}">--%>
<%--        <spring:message code="home.info.login"/> <br>--%>
<%--        <table border="1">--%>
<%--            <thead>--%>
<%--            <tr>--%>
<%--                <td><spring:message code="experiment.name"/></td>--%>
<%--                <td><spring:message code="experiment.originalAuthor"/></td>--%>
<%--                <td><spring:message code="experiment.difficulty"/></td>--%>
<%--                <td><spring:message code="experiment.more"/></td>--%>
<%--            </tr>--%>
<%--            </thead>--%>
<%--            <c:forEach items="${experiments}" var="experiment">--%>
<%--                <tbody>--%>
<%--                <tr>--%>
<%--                    <td>${experiment.name}</td>--%>
<%--                    <td>${experiment.author}</td>--%>
<%--                    <td>${experiment.difficulty}</td>--%>
<%--                    <td>--%>
<%--                        <button><a href="/experiment/details/${experiment.id}"><spring:message code="experiment.details"/></a></button>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                </tbody>--%>
<%--            </c:forEach>--%>
<%--        </table>--%>
<%--    </c:when>--%>
<%--</c:choose>--%>
<%--<br> <br>--%>
<%--</body>--%>
</html>
