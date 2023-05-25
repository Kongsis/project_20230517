<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-11
  Time: 오전 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <div class="container row-3" id="search-area">
        <form action="/product/paging" method="post" enctype="multipart/form-data">
            <div style="display: inline-block">
                <select name="type">
                    <option value="productTitle">제목</option>
                </select>
            </div>
            <div style="display: inline-block">
                <input type="text" name="q" placeholder="검색어를 입력하세요">
            </div>
            <div style="display: inline-block">
                <input type="submit" value="검색">
            </div>
        </form>
    </div>
    <div class="container" id="list">
        <table class="table table-striped table-hover text-center">
            <c:forEach items="${productList}" var="product">
                <div class="card" style="flex: 1; margin: 10px;">
                    <c:if test="${product.fileAttached == 1}">
                        <img src="${pageContext.request.contextPath}/upload/${product.storedFileName}" width="50"
                             height="50">
                    </c:if>
                    <h1><a href="/product/detail?id=+${product.id}&page=${paging.page}&q=${q}&type=${type}"> ${product.productTitle}</a></h1>
                    <p class="price">${String.format("%,d", product.productPrice)}원</p>
                    <p>${product.productContents}</p>

                </div>
            </c:forEach>
        </table>
    </div>
    <br>
    <div class="container">
        <ul class="pagination justify-content-center">
            <c:choose>
                <c:when test="${paging.page<=1}">
                    <li class="page-item disabled ">
                        <a class="page-link">[이전]</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" style="color: black"
                           href="/product/paging?page=${paging.page-1}&q=${q}&type=${type}">[이전]</a>
                    </li>
                </c:otherwise>
            </c:choose>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                <c:choose>
                    <c:when test="${i eq paging.page}">
                        <li class="page-item active">
                            <a class="page-link" style="background-color: #808080;border: none;color: #111111">${i}</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" style="color: #020202"
                               href="/product/paging?page=${i}&q=${q}&type=${type}"> ${i} </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${paging.page>=paging.maxPage}">
                    <li class="page-item disabled">
                        <a class="page-link">[다음]</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" style="color: black"
                           href="/product/paging?page=${paging.page+1}&q=${q}&type=${type}">[다음]</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
<%@include file="../component/footer.jsp"%>
</body>
</html>
