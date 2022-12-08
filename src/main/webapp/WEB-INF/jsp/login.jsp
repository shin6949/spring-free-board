<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    <link href="${pageContext.request.contextPath}/static/css/login.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/common/floating_labels.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/AccountValidation.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>
<div class="container text-center">
    <form:form class="form-signin" action="${pageContext.request.contextPath}/login" method="post">
        <img class="mb-4" src="https://overlay.cocoblue.me/images/cocoblue.jpg" alt="" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal">로그인</h1>
        <c:if test="${fail eq true}">
            <div class="alert alert-danger" role="alert">
                계정 정보가 일치하지 않습니다. 다시 확인해주세요.<br>
                회원이 아니라면 <a href="/user/register" class="alert-link">회원 가입</a> 해주세요.
            </div>
        </c:if>

    <div class="text-left">
        <div class="form-label-group position-relative">
            <input type="text" name="inputId" id="inputId" onkeyup="checkUsername(this)"
                   class="form-control" placeholder="아이디" maxlength='30' required autofocus>
            <label for="inputId">아이디</label>
            <div class="invalid-tooltip">
                아이디는 공백 없이 4~30자 영문 소문자와 숫자만 입력 가능합니다.
            </div>
        </div>
        <div class="form-label-group position-relative">
            <input type="password" name="inputPassword" id="inputPassword" class="form-control"
                   placeholder="Password" maxlength='30' onkeyup="checkPassword(this)" autocomplete="on" required>
            <label for="inputPassword">비밀번호</label>
            <div class="invalid-tooltip">
                비밀번호는 공백 없이 8~30자 영문, 숫자, 특수문자만 입력 가능합니다.
            </div>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button><br>
        <a href="/user/register"><button type="button" class="btn btn-lg btn-secondary btn-block">회원 가입</button></a>
        <p class="mt-5 mb-3 text-muted">&copy; 2022-2023</p>
    </div>
    </form:form>
</div>
</body>
</html>
