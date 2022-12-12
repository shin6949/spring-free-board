<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark" style="margin-bottom: 40px">
  <a class="navbar-brand" href="#">자유 게시판</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <c:set var="URL" value="${pageContext.request.servletPath}"/>

  <div class="collapse navbar-collapse" id="navbarsExample03">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item<c:if test="${URL eq '/WEB-INF/jsp/main.jsp'}"> active</c:if>">
        <a class="nav-link" href="#">홈
          <c:if test="${URL eq '/WEB-INF/jsp/main.jsp'}"><span class="sr-only">(current)</span></c:if></a>
      </li>
      <sec:authorize access="isAnonymous()">
        <li class="nav-item">
          <a class="nav-link disabled">마이페이지</a>
        </li>

        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/login" class="nav-link">로그인</a>
        </li>
      </sec:authorize>

      <sec:authorize access="isAuthenticated()">
        <li class="nav-item">
          <a class="nav-link">마이페이지</a>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-expanded="false">계정</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">로그아웃</a>
            <a class="dropdown-item" href="#">개인정보 수정</a>
          </div>
        </li>

        <li class="nav-item">
          <a class="text-white nav-link disabled">
            <sec:authentication property="principal.profileDTO.nickname"/>님 환영합니다.
          </a>
        </li>
      </sec:authorize>
    </ul>
    <form class="form-inline my-2 my-md-0">
      <input class="form-control" type="text" placeholder="검색">
    </form>
  </div>
</nav>