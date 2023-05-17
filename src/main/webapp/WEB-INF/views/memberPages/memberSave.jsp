<%--
  Created by IntelliJ IDEA.
  User: 이예진
  Date: 2023-05-18
  Time: 오전 12:23
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
    <form action="/member/save" method="post" onsubmit="return check()">
        <input type="text" id="member-email" onblur="email_check()" name="memberEmail" placeholder="이메일">
        <h6 id="email-result"></h6> <br>
        <input type="text" id="member-password" onblur="password_check()" name="memberPassword" placeholder="비밀번호">
        <h6 id="password-result"></h6> <br>
        <input type="text" id="password-confirm" onblur="password_confirm()" placeholder="비밀번호 재확인">
        <h6 id="password-confirm-result"></h6> <br>
        <input type="text" id="member-name" onblur="name_check()" name="memberName" placeholder="이름">
        <h6 id="name-result"></h6> <br>
        <input type="text" id="member-mobile" onblur="mobile_check()" maxlength="11" name="memberMobile" placeholder="전화번호(숫자만입력)">
        <h6 id="mobile-result"></h6> <br>
        <input type="submit" value="가입하기">
    </form>
</div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const email_check = () => {
        const email = document.getElementById("member-email").value;
        const result = document.getElementById("email-result");
        const exp = /^[a-z\d]{6,20}$/;
        let rtn = false;

        $.ajax({
            type: "post",
            url: "/member/email-check",
            async : false,
            data: {
                "member-email": email
            },
            success: function () {
                if (email.length == 0) {
                    result.innerHTML = "필수정보입니다.";
                    result.style.color = "red";
                } else if (email.match(exp)) {
                    result.innerHTML = "사용가능한 이메일입니다.";
                    result.style.color = "green";
                    rtn = true;
                } else {
                    result.innerHTML = "6~20자의 영문 소문자만 사용 가능합니다.";
                    result.style.color = "red";
                }
            },
            error: function () {
                result.innerHTML = "사용중인 이메일입니다.";
                result.style.color = "red";
            }
        });
        return rtn;
    }

    const password_check = () => {
        const password = document.getElementById("member-password").value;
        const passwordResult = document.getElementById("password-result");
        const exp = /^[a-z\d][A-Z\d][0-9\d][!#$-_]{6,20}$/;
        if(password.length == 0) {
            passwordResult.innerHTML = "필수입력입니다.";
            passwordResult.style.color = "red";
            return false;
        } else if(password.match(exp)) {
            passwordResult.innerHTML = "사용가능한 비밀번호입니다.";
            passwordResult.style.color = "green";
            return true;
        } else {
            passwordResult.innerHTML = "6~20글자, 영문대/소문자 필수, 숫자 필수, 특수문자 필수(!#$-_)만 가능합니다.";
            passwordResult.style.color = "red";
            return false;
        }
    }

    const password_confirm = () => {
        const password = document.getElementById("member-password").value;
        const passwordCheck = document.getElementById("password-confirm").value;
        const passwordConfirm = document.getElementById("password-confirm-result");
        if(passwordCheck.length == 0) {
            passwordConfirm.innerHTML = "필수입력입니다.";
            passwordConfirm.style.color = "red";
            return false;
        } else if (password == passwordCheck) {
            passwordConfirm.innerHTML = "일치합니다.";
            passwordConfirm.style.color = "green";
            return true;
        } else {
            passwordConfirm.innerHTML = "비밀번호가 일치하지 않습니다.";
            passwordConfirm.style.color = "red";
            return false;
        }
    }

    const name_check = () => {
        const name = document.getElementById("member-name").value;
        const nameResult = document.getElementById("name-result");
        if(name.length == 0) {
            nameResult.innerHTML = "필수입력입니다."
            nameResult.style.color = "red";
            return false;
        } else {
            nameResult.style.display = "none";
            return true;
        }
    }

    const mobile_check = () => {
        const mobile = document.getElementById("member-mobile");
        const num = mobile.value.replace(/-/g, "");
        const mobileResult = document.getElementById("mobile-result");
        const regex = /(\d{3})(\d{4})(\d{4})/;
        if(mobile.value.length == 0) {
            mobileResult.innerHTML = "필수입력입니다.";
            mobileResult.style.color = "red";
            return false;
        } else if (num.length === 11) {
            mobile.value = num.replace(regex, "$1-$2-$3");
            return true;
        } else {
            mobileResult.innerHTML = "형식에 맞게 작성해주세요.";
            mobileResult.style.color = "red";
        }
    }

    const check = () => {
        const email = document.getElementById("member-email");
        const password = document.getElementById("member-password");
        const passwordConfirm = document.getElementById("password-confirm");
        const name = document.getElementById("member-name");
        const mobile = document.getElementById("member-mobile");

        if (!email_check()) {
            email.focus();
            return false;
        } else if (!password_check()) {
            password.focus();
            return false;
        } else if (!password_confirm()) {
            passwordConfirm.focus();
            return false;
        } else if (!name_check()) {
            name.focus();
            return false;
        } else if (!mobile_check()) {
            mobile.focus();
            return false;
        } else {
            return true;
        }
    }
</script>
</html>
