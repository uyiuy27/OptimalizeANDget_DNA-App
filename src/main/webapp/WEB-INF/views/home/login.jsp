<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ilona
  Date: 22.07.2021
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logowanie | OptimalizeANDgetDNA</title>
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">
    <link href="<c:url value="/theme/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet">
</head>
<body class="bg-gradient-primary">

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4"><spring:message code="user.login.message"/> </h1>
                                </div>
                                <form method="post" class="user">
                                    <div class="form-group"><label> <spring:message code="user.username"/> : <input type="text" name="username" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp"/> </label></div>
                                    <div class="form-group"><label> <spring:message code="user.password"/>: <input type="password" name="password" class="form-control form-control-user" id="exampleInputPassword"/> </label></div>
<%--                                    <div><input type="submit" value="Sign In"/></div>--%>
                                    <button type="submit" value="Sign In" class="btn btn-primary btn-user btn-block"> <spring:message code="user.login"/>  </button>
                                <%--    crf to elemenet ukryty, zawiera automatycznie wygenerowany klucz--%>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
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
<%--<body>--%>
<%--<form method="post">--%>
<%--    <div><label> <spring:message code="user.username"/> : <input type="text" name="username"/> </label></div>--%>
<%--    <div><label> <spring:message code="user.password"/>: <input type="password" name="password"/> </label></div>--%>
<%--    <div><input type="submit" value="Sign In"/></div>--%>
<%--&lt;%&ndash;    crf to elemenet ukryty, zawiera automatycznie wygenerowany klucz&ndash;%&gt;--%>
<%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
<%--</form>--%>
<%--<br>--%>
<%--<button><a href="/"><spring:message code="home.home"/></a></button>--%>
<%--<br>--%>
</body>
</html>
