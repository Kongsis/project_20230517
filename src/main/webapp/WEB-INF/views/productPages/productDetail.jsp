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
            <button onclick="product_update('${product.id}')">수정</button>
            <button onclick="product_delete('${product.id}')">삭제</button>
        </c:if>
    </div>
    <h2>상세조회</h2>
    <table>
        <tr>
            <th>상품번호</th>
            <td>${product.id}</td>
        </tr>
        <tr>
            <th>이미지</th>
            <td rowspan="6">
                <c:forEach items="${productFileList}" var="productFile">
                    <c:if test="${product.fileAttached ==1 }">
                        <img src="${pageContext.request.contextPath}/upload/${productFile.storedFileName}"
                             alt="" width="150" height="150">
                    </c:if>
                </c:forEach>
            </td>
        </tr>
        <tr>
            <th>상품명</th>
            <td>${product.productTitle}</td>
        </tr>
        <tr>
            <th>상품가격</th>
            <td>${product.productPrice}</td>
        </tr>
        <tr>
            <th>남은 갯수</th>
            <td>${product.productQuantity}</td>
        </tr>
        <tr>
            <th>상품소개</th>
            <td>${product.productContents}</td>
        </tr>
        <tr>
            <th>작성시간</th>
            <td>
                <fmt:formatDate value="${product.productCreatedDate}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate>
            </td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${product.productHits}</td>
        </tr>
    </table>

    <button onclick="product_list()">목록</button>
    <button class="btn btn-default btn-order">주문하기</button>
    <button class="btn btn-default btn-cart">장바구니</button>
    <button class="btn btn-default btn-wishlist">위시리스트</button>


    <br><br>
    <h2>──────────────────────────────────────────────────────────────────────────────────────────────</h2> <br><br>
<%@include file="../component/footer.jsp" %>
</body>
<script>
    const product_update = () => {
        const id = '${product.id}';
        location.href = "/product/update?id=" + id;
    }
    const product_delete = () => {
        const id = '${product.id}';
        location.href = "/product/DeletePass?id=" + id;
    }
    const product_list = () => {
        const type = '${type}';
        const q = '${q}';
        const page = '${page}'
        location.href = "/product/paging?page=" + page + "&type=" + type + "&q=" + q;
    }
    $(".btn-order").click(function () {
        location.assign("/order/cart");
    });
    $(".btn-cart").click(function() {
        $.ajax({
            type : "post",
            url : "/order/cart/" + productId,
            data : {
                productId : productId
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
