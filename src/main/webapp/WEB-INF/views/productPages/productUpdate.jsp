<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-03
  Time: 오전 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>
<div id="section">
    <form action="/product/update" method="post" name="updateForm">
        <table>
            <tr>
                <th>글번호</th>
                <th><input type="text" name="id" value="${product.id}" readonly></th>
            </tr>
            <tr>
                <th>제목</th>
                <th><input type="text" name="productTitle" value="${product.productTitle}" placeholder="수정할 제목"></th>
            </tr>
            <tr>
                <th>가격</th>
                <th><input type="text" name="productPrice" value="${product.productPrice}"></th>
            </tr>
            <tr>
                <th>수량</th>
                <th><input type="text" name="productQuantity" value="${product.productQuantity}"></th>
            </tr>
            <tr>
                <th>내용</th>
                <th><input type="text" name="productContents" value="${product.productContents}" placeholder="수정할 내용">
                </th>
            </tr>
            <th>
            <th>이미지</th>
            <td><input type="text" name="fileAttached" value="${product.fileAttached}" readonly></td>
            </th>
            <th>
                <input type="submit" value="수정">
            </th>
            </tr>
        </table>
    </form>
</div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    <%--const update_req = () => {--%>
    <%--    const passInput = document.getElementById("board-pass").value;--%>
    <%--    const passDB = '${board.boardPass}';--%>
    <%--    if(passInput == passDB) {--%>
    <%--        document.updateForm.submit();--%>
    <%--    } else {--%>
    <%--        alert("비밀번호가 일치하지 않습니다.");--%>
    <%--    }--%>
    <%--}--%>
</script>
</html>
