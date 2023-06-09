<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div id="nav">
        <ul>
            <li>
                <a href="/">
                    <i class="bi bi-house"></i>
                </a>
            </li>
            <li>
                <a href="/member/save">회원가입</a>
            </li>
            <li>
                <a href="/member/login">로그인</a>
            </li>
            <li>
                <a href="/product/paging" class="left1">상품목록</a>
            </li>
            <li class="login-name" id="login-area">
            <li class="login-name">
                <c:choose>
                    <c:when test="${sessionScope.loginEmail != null}">
                        <a href="/member/myPage?loginEmail=${sessionScope.loginEmail}" style="color: black;">${sessionScope.loginEmail} 님</a>
                        <a href="/member/logout">logout</a>
                    </c:when>
                    <c:otherwise>
                        <a href="/member/login">login</a>
                    </c:otherwise>
                </c:choose>
            </li>
            <li class="login-name">
                <c:if test="${sessionScope.loginEmail == 'admin'}">
                    <a href="/member/list">회원리스트</a>
                    <a href="/product/save">상품등록</a>
                    <a href="/product/paging" class="left1">상품목록</a>
                </c:if>
            </li>
            </li>
        </ul>
    </div>
<script>
</script>