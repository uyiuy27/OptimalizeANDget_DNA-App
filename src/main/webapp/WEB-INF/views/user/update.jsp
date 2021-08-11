<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ilona
  Date: 23.07.2021
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><spring:message code="user.edit"/> | OptimalizeANDgetDNA</title>
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">
    <link href="<c:url value="/theme/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet">
</head>
<body id="page-top">

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
            <a class="nav-link" href="/user/updatepass/${id}">
                <span><spring:message code="user.edit.password"/></span>
            </a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="/user/confirm/${id}">
                <span><spring:message code="user.delete"/></span>
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
                            code="user.edit.data"/></h1>
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
                <%--                    <h1 class="h3 mb-0 text-gray-800">Users CRUD</h1>--%>
                <%--                    <a href="/user/logout" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">Wyloguj</a>--%>
                <%--                </div>--%>
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="card shadow mb-4">
                        <div class="card shadow">
                            <div class="card-header py-3">
                                <%--                    <h6 class="m-0 font-weight-bold text-primary font-change">Dodaj nowego użytkownika</h6>--%>
                                <h6>
                                    <spring:message code="form.required"/>
                                </h6>
                            </div>
                            <div class="card-body">
                                <h6>
                                    <p><spring:message code="form.required"/></p>
                                </h6>
                                <form:form method="post" modelAttribute="user">
                                    <form:hidden path="id" value="${id}"/>
                                    <div class="form-group">
                                        <spring:message code="user.username"/>*: <form:input path="username" type="text"
                                                                                             class="form-control form-control-user"
                                                                                             id="exampleFirstName"/>
                                        <form:errors path="username"/><br>
                                    </div>
                                    <div class="form-group">
                                        <spring:message code="admin.email"/>*: <form:input path="email" type="email"
                                                                                           class="form-control form-control-user"
                                                                                           id="exampleInputEmail"/><br>
                                        <form:errors path="email"/><br>
                                    </div>
                                    <div class="form-group">
                                        <spring:message code="admin.work"/>: <form:input path="workplace" type="text"
                                                                                         class="form-control form-control-user"/><br>
                                        <form:errors path="workplace"/><br>
                                    </div>
                                    <div class="form-group">
                                        <spring:message code="admin.position"/>: <form:input path="position" type="text"
                                                                                             class="form-control form-control-user"/><br>
                                        <form:errors path="position"/><br>
                                    </div>
                                    <button type="submit"
                                            class="btn btn-primary btn-user btn-block col-sm-6 mb-3 mb-sm-0">
                                        <spring:message code="user.save"/>
                                    </button>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
                <%--    <div class="d-sm-flex align-items-center justify-content-between mb-4">--%>
                <%--        <a href="http://localhost:8080/user/list" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">--%>
                <%--            Wstecz </a>--%>
                <%--    </div>--%>
            </div>
            <%--</div>--%>
            <%--</div>--%>

            <%--</div>--%>


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


<%--<h6>--%>
<%--    <p><spring:message code="form.required"/></p>--%>
<%--</h6>--%>
<%--<form:form method="post" modelAttribute="user">--%>
<%--    <form:errors path="*"/>--%>
<%--    <form:hidden path="id" value="${id}"/>--%>
<%--    <spring:message code="user.username"/>*: <form:input path="username"/><br>--%>
<%--    <form:errors path="username"/><br>--%>
<%--    <spring:message code="admin.email"/>*: <form:input path="email"/><br>--%>
<%--    <form:errors path="email"/><br>--%>
<%--    <spring:message code="admin.work"/>: <form:input path="workplace"/><br>--%>
<%--    <form:errors path="workplace"/><br>--%>
<%--    <spring:message code="admin.position"/>: <form:input path="position"/><br>--%>
<%--    <form:errors path="position"/><br>--%>
<%--    <input type="submit">--%>
<%--</form:form>--%>
<%--<br>--%>
<%--<button><a href="/user/account/${id}"><spring:message code="user.back"/></a></button>--%>
<%--<br>--%>
</body>
</html>
