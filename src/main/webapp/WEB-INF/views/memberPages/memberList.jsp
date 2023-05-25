<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-25
  Time: 오후 5:49
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <table>
        <tr>
            <th>id</th>
            <th>memberEmail</th>
            <th>memberPassword</th>
            <th>memberName</th>
            <th>memberMobile</th>
            <th>memberAddress</th>
            <th>조회</th>
            <th>수정</th>
            <th>삭제</th>
        </tr>
        <c:forEach items="${memberList}" var="member">
            <tr>
                <td><a href="/detail?id=${member.id}">${member.id}</a></td>
                <td>${member.memberEmail}</td>
                <td>${member.memberPassword}</td>
                <td>${member.memberName}</td>
                <td>${member.memberMobile}</td>
                <td>${member.memberAddress}</td>
                <td>
                    <button onclick="detail_member('${member.id}')">조회</button>
                </td>
                <td>
                    <button onclick="update_member('${member.id}')">수정</button>
                </td>
                <td>
                    <button onclick="delete_member('${member.id}')">삭제</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const detail_member = (id) => {
        location.href = "/member/detail?id="+id;
    }
    const update_member = (id) => {
        // location.href = "/member/update?id="+id;
    }
    const delete_member = (id) => {
        // location.href = "/member/delete?id="+id;
    }
</script>
</body>
</html>
