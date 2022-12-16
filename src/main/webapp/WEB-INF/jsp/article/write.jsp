<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>글 쓰기</title>
    <jsp:include page="/WEB-INF/jsp/include/bootstrap.jsp"/>
    <script type="text/javascript" src="<c:url value='/static/smarteditor/js/HuskyEZCreator.js'/>" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/Write.js"></script>
</head>
<script>

</script>

<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>
<div class="container">
    <h2>글 작성</h2>
    <form action="#" onsubmit="return submitPost(this)" method="post">
        <sec:csrfInput/>
        <div class="mb-3">
            <label for="inputTitle" class="form-label">제목</label>
            <input type="text" name="title" class="form-control" id="inputTitle" required>
        </div>

        <div class="mb-2" id="smarteditor">
            <label for="editorTxt" class="form-label">내용</label>
            <textarea class="form-control" name="content" id="editorTxt" rows="20" cols="10" placeholder="내용을 입력해주세요">

            </textarea>
        </div>
        <div class="text-end">
            <button class="btn btn-primary mb-3" type="submit" >업로드</button>
        </div>

    </form>
</div>
</body>
</html>
