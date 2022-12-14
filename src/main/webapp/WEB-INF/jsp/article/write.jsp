<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% response.setHeader("X-Frame-Options", "SAMEORIGIN"); %>

<html>
<head>
    <title>글 쓰기</title>
    <jsp:include page="/WEB-INF/jsp/include/bootstrap.jsp"/>
    <script type="text/javascript" src="<c:url value='/static/smarteditor/js/HuskyEZCreator.js'/>" charset="utf-8"></script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/include/header.jsp"/>
<div class="container">
    <h3>Naver Smart Editor 2.0</h3>
    <form action="#" method="post">
        <div id="smarteditor">
        <textarea name="editorTxt" id="editorTxt"
                  rows="20" cols="10"
                  placeholder="내용을 입력해주세요"
                  style="width: 500px"></textarea>
        </div>
        <input type="button" />
    </form>
</div>
</body>

<script>
    let oEditors = []

    smartEditor = function() {
        console.log("Naver SmartEditor")
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "editorTxt",
            sSkinURI: "/static/smarteditor/SmartEditor2Skin.html",
            fCreator: "createSEditor2"
        })
    }

    $(document).ready(function() {
        smartEditor()
    })
</script>
</html>
