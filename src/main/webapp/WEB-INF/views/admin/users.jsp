<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: ilona
  Date: 24.07.2021
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><spring:message code="admin.title.users"/> | OptimalizeANDgetDNA</title>
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">
    <link href="<c:url value="/theme/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet">
</head>
<body>
<body id="page-top">
<%--<%@ include file="/WEB-INF/views/header.jsp" %>--%>
<!-- Page Wrapper -->
<div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center"
           href="/user/account/${user.id}">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">
                <spring:message code="home.hello"/> ${user.username}!
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
            <a class="nav-link" href="/user/account/${user.id}">
                <span><spring:message code="user.account"/></span>
            </a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="http://localhost:8080/">
                <span><spring:message code="home.home"/></span>
            </a>
        </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/admin/all">
                        <span><spring:message code="admin.button.all"/></span>
                    </a>
                </li>
<%--        <li class="nav-item active">--%>
<%--            <a class="nav-link" href="/admin/users/all">--%>
<%--                <span><spring:message code="admin.button.users"/></span>--%>
<%--            </a>--%>
<%--        </li>--%>
        <li class="nav-item active">
            <a class="nav-link" href="/admin/admins/all">
                <span><spring:message code="admin.button.admins"/></span>
            </a>
        </li>


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
                    <h1 class="h3 mb-0 text-gray-800"><spring:message code="admin.title.users"/></h1>
                    <a href="http://localhost:8080/logout"
                       class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><spring:message
                            code="user.logout"/></a>
                </div>
            </div>
            <!-- End of Topbar -->
            <!-- Begin Page Content -->
            <div class="container-fluid">

                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <td><b><spring:message code="admin.name"/></b></td>
                                        <td><b><spring:message code="admin.email"/></b></td>
                                        <td><b><spring:message code="admin.work"/></b></td>
                                        <td><b><spring:message code="admin.position"/></b></td>
                                        <td><b><spring:message code="admin.role"/></b></td>
                                        <td><b><spring:message code="admin.action"/></b></td>
                                    </tr>
                                    </thead>
                                    <c:forEach items="${users}" var="user">

                                        <tbody>
                                        <tr>
                                            <td>${user.username}</td>
                                            <td>${user.email}</td>
                                            <td>${user.workplace}</td>
                                            <td>${user.position}</td>
                                                <%--            <td>${admin.role}</td>--%>
                                            <td>
                                                <c:set var="string1" value="${user.role}"/>
                                                <c:set var="string2" value="${fn:substring(string1, 5, 11)}"/>
                                                    ${string2}
                                            </td>
                                            <td>
                                                <a class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
                                                   href="/admin/change/${user.id}"><spring:message
                                                        code="admin.change"/></a>
                                                <a class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
                                                   href="/user/confirm/${user.id}"><spring:message
                                                        code="admin.delete"/></a>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
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
<%--</head>--%>
<%--<body>--%>
<%--<button><a href="/logout"><spring:message code="user.logout"/></a></button>--%>
<%--<br>--%>
<%--<button><a href="/"><spring:message code="home.home"/></a></button>--%>
<%--<br>--%>

<%--<button><a href="/admin/all"><spring:message code="admin.button.all"/></a></button>--%>
<%--<button><a href="/admin/users/all"><spring:message code="admin.button.users"/></a></button>--%>
<%--<button><a href="/admin/admins/all"><spring:message code="admin.button.admins"/></a></button>--%>
<%--<table border="1">--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <td><spring:message code="admin.name"/></td>--%>
<%--        <td><spring:message code="admin.email"/></td>--%>
<%--        <td><spring:message code="admin.work"/></td>--%>
<%--        <td><spring:message code="admin.position"/></td>--%>
<%--        <td><spring:message code="admin.role"/></td>--%>
<%--        <td><spring:message code="admin.action"/></td>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <c:forEach items="${users}" var="user">--%>

<%--        <tbody>--%>
<%--        <tr>--%>
<%--            <td>${user.username}</td>--%>
<%--            <td>${user.email}</td>--%>
<%--            <td>${user.workplace}</td>--%>
<%--            <td>${user.position}</td>--%>
<%--                &lt;%&ndash;            <td>${admin.role}</td>&ndash;%&gt;--%>
<%--            <td>--%>
<%--                <c:set var="string1" value="${user.role}"/>--%>
<%--                <c:set var="string2" value="${fn:substring(string1, 5, 11)}"/>--%>
<%--                    ${string2}--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <button><a href="/admin/change/${admin.id}"><spring:message code="admin.change"/></a></button>--%>
<%--                <button><a href="/user/confirm/${admin.id}"><spring:message code="admin.delete"/></a></button>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        </tbody>--%>
<%--    </c:forEach>--%>
<%--</table>--%>
<%--<br> <br>--%>
</body>
</html>
