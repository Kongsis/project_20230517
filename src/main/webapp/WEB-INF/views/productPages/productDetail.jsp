<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-11
  Time: 오전 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>
<div id="section">
    <div class="login-name">
        <c:if test="${sessionScope.loginEmail == 'admin'}">
            <button onclick="board_update('${board.id}')">수정</button>
            <button onclick="board_delete('${board.id}')">삭제</button>
        </c:if>
    </div>
    <h2>상세조회</h2>
    <table>
        <tr>
            <th>상품번호</th>
            <td>${board.id}</td>
        </tr>
        <tr>
            <th>이미지</th>
            <td>
                <c:forEach items="${boardFileList}" var="boardFile">
                    <c:if test="${board.fileAttached ==1 }">
                        <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}"
                             alt="" width="150" height="150">
                    </c:if>
                </c:forEach>
            </td>
        </tr>
        <tr>
            <th>상품명</th>
            <td>${board.boardTitle}</td>
        </tr>
        <tr>
            <th>상품가격</th>
            <td>${board.boardPrice}</td>
        </tr>
        <tr>
            <th>남은갯수</th>
            <td>${board.boardAccount}</td>
        </tr>
        <tr>
            <th>상품소개</th>
            <td>${board.boardContents}</td>
        </tr>
        <tr>
            <th>작성시간</th>
            <td>
                <fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate>
            </td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${board.boardHits}</td>
        </tr>
    </table>

    <button onclick="board_list()">목록</button>
    <button class="btn btn-default btn-order">주문하기</button>
    <button class="btn btn-default btn-cart">장바구니</button>
    <button class="btn btn-default btn-wishlist">위시리스트</button>


    <br><br>
    <h2>──────────────────────────────────────────────────────────────────────────────────────────────</h2> <br><br>
<%@include file="../component/footer.jsp" %>
</body>
<script>
    <%--const comment_write = () => {--%>
    <%--    const commentWriter = document.getElementById("comment-writer").value;--%>
    <%--    const commentContents = document.getElementById("comment-contents").value;--%>
    <%--    const boardId = '${board.id}';--%>
    <%--    const result = document.getElementById("comment-list");--%>
    <%--    $.ajax({--%>
    <%--        type: "post",--%>
    <%--        url: "/comment/save",--%>
    <%--        data: {--%>
    <%--            "commentWriter": commentWriter,--%>
    <%--            "commentContents": commentContents,--%>
    <%--            "boardId": boardId--%>
    <%--        },--%>
    <%--        success: function (res) {--%>
    <%--            console.log(res);--%>
    <%--            let output = "<table>";--%>
    <%--            output += "<tr>";--%>
    <%--            output += "<th>id</th>";--%>
    <%--            output += "<th>작성자</th>";--%>
    <%--            output += "<th>내용</th>";--%>
    <%--            output += "<th>작성시간</th>";--%>
    <%--            output += "</tr>";--%>
    <%--            for(let i in res) {--%>
    <%--                output += "<tr>";--%>
    <%--                output += "<td>" + res[i].id + "</td>";--%>
    <%--                output += "<td>" + res[i].commentWriter + "</td>";--%>
    <%--                output += "<td>" + res[i].commentContents + "</td>";--%>
    <%--                output += "<td>" + moment(res[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss") + "</td>";--%>
    <%--                output += "</tr>";--%>
    <%--            }--%>
    <%--            output += "</table>";--%>
    <%--            result.innerHTML = output;--%>
    <%--            document.getElementById("comment-writer").value = "";--%>
    <%--            document.getElementById("comment-contents").value = "";--%>
    <%--        },--%>
    <%--        error: function () {--%>
    <%--            console.log("실패");--%>
    <%--        }--%>
    <%--    });--%>
    <%--}--%>
    <%--const board_list = () => {--%>
    <%--    const type = '${type}';--%>
    <%--    const q = '${q}';--%>
    <%--    const page = '${page}';--%>
    <%--    location.href = "/board/paging?page=" + page + "&type=" + type + "&q=" + q;--%>
    <%--}--%>
    <%--const board_update = () => {--%>
    <%--    const id = '${board.id}';--%>
    <%--    location.href = "/board/update?id=" + id;--%>
    <%--}--%>
    <%--const board_delete = () => {--%>
    <%--    const id = '${board.id}';--%>
    <%--    location.href = "/board/delete-check?id=" + id;--%>
    <%--}--%>
        const board_update = () => {
        const id = '${board.id}';
        location.href = "/board/update?id=" + id;
    }
        const board_delete = () => {
        const id = '${board.id}';
        location.href = "/board/DeletePass?id=" + id;
    }
        const board_list = () => {
        const type = '${type}';
        const q = '${q}';
        const page = '${page}'
        location.href = "/board/paging?page=" + page + "&type=" + type + "&q=" + q;
    }
        $(".btn-order").click(function () {
        location.assign("/order/cart");
    });
        $(".btn-cart").click(function() {
        $.ajax({
            type : "post",
            url : "/order/cart/" + boardId,
            data : {
                boardId : boardId
            },
            dataType : "text",
            success : function(result) {
                if (result.trim() == 'add_success') {
                    var check = confirm("카트에 등록되었습니다.");
                    if (check) {
                        location.assign("/order/mycart/" + userid);
                    }
                } else if (result.trim() == 'already_existed') {
                    alert("이미 카트에 등록된 상품입니다.");
                }
            }
        });
    });
        $(".btn-wishlist").click(function () {
        alert("상품을 위시리스트에 추가하였습니다.");
    });

</script>
</html>
