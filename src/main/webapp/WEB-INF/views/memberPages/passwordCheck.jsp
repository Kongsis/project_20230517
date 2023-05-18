<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-15
  Time: 오전 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>
    <div id="section">
        <h2>비밀번호 확인</h2>
        <form action="/member/updatePassword" method="post" name="updateForm">
            <input type="text" name="memberPassword" id="memberPassword" placeholder="현재 비밀번호"><br>
            <input type="button" onclick="pass_check()" value="확인">
        </form>
    </div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const pass_check = () => {
        const inputPass = document.getElementById("memberPassword").value;
        const DBPass = '${member.memberPassword}';
        if (inputPass == DBPass) {
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다");
        }
    }
</script>
</html>
