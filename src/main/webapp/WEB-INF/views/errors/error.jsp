<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: ilona
  Date: 13.08.2021
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">
    <link href="<c:url value="/theme/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet">
</head>
<body id="page-top">
<div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <c:choose>
            <c:when test="${!empty user}">
                <a class="sidebar-brand d-flex align-items-center justify-content-center"
                   href="/user/profile/${user.id}">
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
                <%--                <li class="nav-item active">--%>
                <%--                    <a class="nav-link" href="http://localhost:8080/logout">--%>
                <%--                        <span><spring:message code="user.logout"/></span>--%>
                <%--                    </a>--%>
                <%--                </li>--%>
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

            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- 404 Error Text -->
                <div class="text-center">
                    <div class="error mx-auto" data-text=<spring:message
                            code="error.error"/>></div>
                    <p class="lead text-gray-800 mb-5"><spring:message
                            code="error.error"/></p>
                    <p class="text-gray-500 mb-0"><spring:message
                            code="error.error.message"/></p>
                    <a href="http://localhost:8080/">&larr; <spring:message
                            code="error.back"/></a>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Ilona Ptak 2019</span>
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


</body>
</html>
