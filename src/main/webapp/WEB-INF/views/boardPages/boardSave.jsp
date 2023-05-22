<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-11
  Time: 오후 1:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>
    <div id="section">
        <form action="/board/save" method="post" enctype="multipart/form-data">
            <input type="text" name="boardTitle" placeholder="제목을 입력하세요"> <br>
            <input type="text" name="boardWriter" placeholder="작성자를 입력하세요"> <br>
            <input type="number" name="boardPrice" placeholder="금액을 입력하세요"> <br>
            <input type="number" name="boardAccount" placeholder="수량을 입력하세요"> <br>
            <textarea name="boardContents" cols="30" rows="10"></textarea> <br>
            <input type="file" name="boardFile" multiple> <br>
            <input type="submit" value="작성">
        </form>
    </div>
<%@include file="../component/footer.jsp"%>
</body>
</html>
