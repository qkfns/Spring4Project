<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/semiproject.css">

    <!-- http cache control 관련 코드 -->
    <%response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires",0);
    response.setHeader("Cache-Control", "no-cache");%>


    <title>세미프로젝트v1</title>
    <style>
        .fatdiv { padding: 15px; }
        .margin30 { margin: 30px 0; }
    </style>
</head>
<body>
<div class="container">
    <tiles:insertAttribute name="header"/>

    <tiles:insertAttribute name="main"/>

    <tiles:insertAttribute name="footer"/>
</div>

<!-- 로그인 모달 -->
<tiles:insertAttribute name="modal"/>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script src="/js/join.js"></script>
<script src="/js/login.js"></script>


</body>
</html>