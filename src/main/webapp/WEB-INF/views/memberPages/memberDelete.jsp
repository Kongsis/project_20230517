<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-19
  Time: 오후 2:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <form action="/member/delete" method="post" name="deleteForm">
        <input type="text" name="memberPassword" id="memberPassword" placeholder="현재 비밀번호"><br>
        <input type="button" onclick="pass_check()" value="확인">
<%--        <button onclick="pass_check()">확인</button>--%>
    </form>
</div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const pass_check = () => {
        const inputPass = document.getElementById("memberPassword").value;
        const DBPass = '${member.memberPassword}';
        if (inputPass == DBPass) {
            document.deleteForm.submit();
            alert("회원탈퇴 되셨습니다");
            location.href="/member/logout";

        } else {
            alert("비밀번호가 일치하지 않습니다");
        }
    }
</script>
</html>
