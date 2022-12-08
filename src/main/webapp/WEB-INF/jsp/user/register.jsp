<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>회원 가입</title>
    <jsp:include page="/WEB-INF/jsp/include/bootstrap.jsp"/>
    <link href="${pageContext.request.contextPath}/static/css/common/floating_labels.css" rel="stylesheet">
</head>

<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>
<div class="container">
    <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="https://overlay.cocoblue.me/images/cocoblue.jpg" alt="" width="72" height="72">
        <h2>회원 가입</h2>
    </div>

    <div>
        <form:form class="needs-validation">
            <div class="row">
                <div class="col-md-7 mb-3">
                    <div class="form-label-group position-relative">
                        <input type="text" class="form-control" name="name" id="name" placeholder="이름" required>
                        <label for="name">이름</label>
                        <small class="ml-1 form-text text-muted">이름은 공백 없이 한글 2~10자로 지정할 수 있습니다.</small>
                        <div class="invalid-tooltip">
                            이름 규칙을 지켜주세요.
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-7 mb-3">
                    <div class="form-label-group position-relative">
                        <input type="text" class="form-control" name="username" id="username" placeholder="아이디" required>
                        <label for="username">아이디</label>
                        <small class="ml-1 form-text text-muted">아이디는 공백 없이 영문 소문자, 숫자 조합 4~30자로 지정할 수 있습니다.</small>
                        <div class="invalid-tooltip" style="width: 100%;">
                            아이디 규칙을 지켜주세요.
                        </div>
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <div class="form-label-group position-relative">
                    <input type="email" class="form-control" name="email" id="email" placeholder="이메일">
                    <label for="email">이메일</label>
                    <small class="ml-1 form-text text-muted">이메일은 아이디/비밀번호 찾기에 사용됩니다. 사용하는 이메일로 적어주세요.</small>
                </div>
            </div>

            <div class="mb-3">
                <div class="form-label-group position-relative">
                    <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호">
                    <label for="password">비밀번호</label>
                    <small class="ml-1 form-text text-muted">비밀번호는 공백 제외 영문, 숫자, 특수문자 조합으로 8~30자로 지정할 수 있습니다.</small>
                    <div class="invalid-feedback">
                        입력한 비밀번호가 같지 않습니다.
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <div class="form-label-group position-relative">
                    <input type="password" class="form-control" name="password-re"
                           id="password-re" placeholder="비밀번호 확인">
                    <label for="password-re">비밀번호 확인</label>
                    <small class="ml-1 form-text text-muted">위에 기재한 비밀번호와 동일하게 입력하세요.</small>
                    <div class="invalid-feedback">
                        입력한 비밀번호가 같지 않습니다.
                    </div>
                </div>
            </div>

            <hr class="mb-4">
            <div>
                <button class="btn btn-primary btn-lg" type="submit">회원 가입</button>
                <button class="btn btn-secondary btn-lg" data-toggle="modal" data-target="#cancelModal">취소</button>
            </div>
        </form:form>
    </div>
</div>

<div class="container">
    <!-- Modal -->
    <div style="margin-top: 20%" class="modal fade" id="cancelModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">경고</h4>
                </div>
                <div class="modal-body">
                    취소하면 입력한 데이터를 모두 잃습니다. 계속 하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">계속 진행</button>
                    <a href="/main"><button type="button" class="btn btn-danger">취소하고 이동</button></a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>