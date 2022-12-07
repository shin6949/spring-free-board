<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>로그인</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/sign-in/">
    <!-- Bootstrap core CSS -->
    <jsp:include page="/WEB-INF/jsp/include/bootstrap.jsp"/>

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>

    <link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
</head>
<body class="text-center">

<form class="form-signin" action="${pageContext.request.contextPath}/login_process" method="post">
    <img class="mb-4" src="https://overlay.cocoblue.me/images/cocoblue.jpg" alt="" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">로그인</h1>
    <label for="inputId" class="sr-only">아이디</label>
    <input type="text" id="inputId" class="form-control" placeholder="아이디" required autofocus>
    <label for="inputPassword" class="sr-only">비밀번호</label>
    <input type="password" id="inputPassword" class="form-control" placeholder="비밀번호" required>

    <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2022-2023</p>
</form>
</body>
</html>
