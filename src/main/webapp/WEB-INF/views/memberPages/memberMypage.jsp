<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-18
  Time: 오후 4:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>
    <div id="section">
        ${sessionScope.loginEmail} 님의 회원정보
        <h2>회원 정보</h2>
        <table>
            <tr>
                <th>id</th>
                <th>${member.id}</th>
            </tr>
            <tr>
                <th>이름</th>
                <th>${member.memberName}</th>
            </tr>
            <tr>
                <th>이메일</th>
                <th>${member.memberEmail}</th>
            </tr>
            <tr>
                <th>비밀번호</th>
                <th>${member.memberPassword}</th>
            </tr>
            <tr>
                <th>전화번호</th>
                <th>${member.memberMobile}</th>
            </tr>
            <tr>
                <th>주소</th>
                <th>${member.memberAddress}</th>
            </tr>
        </table>
        <br><br>

        <button onclick="member_update('${member.id}')">수정</button>
        <button onclick="member_delete('${member.id}')">삭제</button>
        <button onclick="board_list()">목록</button>
        <br>
    </div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const member_update = () => {
        const id = ${member.id};
        location.href = "/member/updatePassword?id=" + id;
    }
    const member_delete = () => {
        const id = ${member.id};
        location.href = "/member/deleteCheck?id=" + id;
    }
    const board_list = () => {
        const type = '${type}';
        const q = '${q}';
        const page = '${page}'
        location.href = "/board/paging";
    }
</script>
</html>
