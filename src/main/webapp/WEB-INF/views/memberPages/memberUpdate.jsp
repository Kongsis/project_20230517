<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-18
  Time: 오후 4:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>
    <div id="section">
        <form action="/member/update" method="post" name="updateForm">
            <input type="text" name="id" value="${member.id}" readonly placeholder="id"> <br>
            <input type="text" name="memberEmail" value="${member.memberEmail}" readonly placeholder="이메일"> <br>
            <input type="text" name="memberPassword" id="memberPassword" value="${member.memberPassword}" placeholder="비밀번호"> <br>
            <input type="text" name="memberName" value="${member.memberName}" placeholder="이름"> <br>
<%--            <input type="text" name="memberMobile" value="${member.memberMobile}" placeholder="전화번호(숫자만입력)"> <br>--%>
            <input type="text" id="member-mobile" onblur="mobile_check()" value="${member.memberMobile}" maxlength="11" name="memberMobile" placeholder="전화번호(숫자만입력)"> <br>
            <input type="submit" onclick="update_check()" value="수정">
        </form>
    </div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    <%--const update_check = () => {--%>
    <%--    const inputPass = document.getElementById("memberPassword").value;--%>
    <%--    const DBPass = '${member.memberPassword}';--%>
    <%--    if (inputPass == DBPass) {--%>
    <%--        alert("사용하던 비밀번호 입니다 다시 입력해주세요");--%>
    <%--    } else {--%>
    <%--        document.updateForm.submit();--%>
    <%--    }--%>
    <%--}--%>

    const mobile_check = () => {
        const mobile = document.getElementById("member-mobile");
        const num = mobile.value.replace(/-/g, "");
        const regex = /(\d{3})(\d{4})(\d{4})/;
        if (num.length === 11) {
            mobile.value = num.replace(regex, "$1-$2-$3");
            return true;
        }
    }
</script>
</html>
