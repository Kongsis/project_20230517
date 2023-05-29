<%--
  Created by IntelliJ IDEA.
  User: 이예진
  Date: 2023-05-18
  Time: 오전 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>
    <div id="section">
        <form action="/member/login" method="post">
            <input type="text" id="email-check" onblur="loginEmail_check()" name="memberEmail" placeholder="이메일">
            <h6 id="email-reResult"></h6> <br>
            <input type="text" id="password-check" onblur="loginPassword_check()" name="memberPassword" placeholder="비밀번호">
            <h6 id="password-reResult"></h6> <br>
            <div class="checkbox mb-3">
                <label>
                    <input type="checkbox" value="remember-me"> 아이디/비밀번호 저장하기
                </label>
            </div>
            <input type="submit" onclick="login_check()" value="로그인">
        </form>
    </div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const loginEmail_check = () => {
        const email = document.getElementById("email-check").value;
        const result = document.getElementById("email-reResult");
        if(email.length == 0) {
            result.innerHTML = "필수입력입니다.";
            result.style.color = "red";
        } else {
            result.style.display = "none";
        }
    }

    const loginPassword_check = () => {
        const password = document.getElementById("password-check").value;
        const result = document.getElementById("password-reResult");
        if(password.length == 0) {
            result.innerHTML = "필수입력입니다.";
            result.style.color = "red";
        } else {
            result.style.display = "none";
        }
    }
</script>
</html>
