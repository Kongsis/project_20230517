<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-26
  Time: 오후 4:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>
<div id="section" class="container">
    <form action="/order/cart" name="form1" id="form1" method="post">
        <h2>장바구니</h2>
        <c:choose>
            <c:when test="${cart.count == 0}">
                장바구니가 비어있습니다.
            </c:when>
            <c:otherwise>
                <table>
                    <tr>
                        <th>상품명</th>
                        <th>단가</th>
                        <th>수량</th>
                        <th>금액</th>
                        <th>취소</th>
                    </tr>
                    <c:forEach var="row" items="${map.list}" varStatus="i">
                        <tr>
                            <td style="width: 80px;text-align: right">${row.productTitle}</td>
                            <td style="width: 80px;text-align: right">
                                <fmt:formatNumber pattern="###,###,###"
                                                  value="${row.productPrice / 0.9}"/>원
                            </td>
                            <td>
                                <input type="number" style="width: 40px" name="productCnt" value="${row.productCnt}"
                                       min="1">
                                <input type="hidden" name="productId" value="${row.productId}">
                            </td>
                            <td style="width: 80px;text-align: right">
                                <fmt:formatNumber pattern="###,###,###"
                                                  value="${row.productPrice}"/>원
                            </td>
                            <td style="width: 100px; text-align: right">
                                <fmt:formatNumber pattern="###,###,###" value="${row.money}"/>원
                            </td>
                            <td><a href="/cart/delete?id=${row.id}">상품 삭제</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="5" style="text-align: right">
                            장바구니 금액: <fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"></fmt:formatNumber><br>
                            배송비: ${map.fee}<br>
                            합계: <fmt:formatNumber pattern="###,###,###" value="${map.allSum}"></fmt:formatNumber>
                        </td>
                    </tr>
                </table>
                <input type="hidden" name="count" value="${map.count}">
                <button type="submit" id="btnUpdate">수정</button>
            </c:otherwise>
        </c:choose>
    </form>
</div>
<button type="button" onclick="cart_list()">상품 목록</button>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const cart_list = () => {
        location.href = "/product/paging";
    }
</script>
</html>
