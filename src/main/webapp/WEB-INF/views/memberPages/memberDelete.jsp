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
<%--    <form action="/member/delete" method="post" name="deleteForm">--%>
        <input type="text" id="member-pass" placeholder="비밀번호를 입력하세요"> <br>
        <td><button onclick="pass_check()">확인</button></td>
<%--    </form>--%>
</div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const pass_check = () => {
        const passInput = document.getElementById("member-pass").value;
        const passDB = '${member.memberPassword}';
        const id = '${member.id}';
        if(passInput == passDB) {
            location.href = "/member/delete?id="+id;
            alert("회원탈퇴 되셨습니다.");
        } else {
            alert("비밀번호가 일치하지 않습니다.");
        }
    }
</script>
</html>
