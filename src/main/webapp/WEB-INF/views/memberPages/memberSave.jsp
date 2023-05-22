<%--
  Created by IntelliJ IDEA.
  User: 이예진
  Date: 2023-05-18
  Time: 오전 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>
<div id="section">
    <form action="/member/save" method="post" onsubmit="return check()">
        <input type="text" id="member-email" onblur="email_check()" name="memberEmail" placeholder="이메일">
        <h6 id="email-result"></h6> <br>
        <input type="text" id="member-password" onblur="password_check()" name="memberPassword" placeholder="비밀번호">
        <h6 id="password-result"></h6> <br>
        <input type="text" id="password-confirm" onblur="password_confirm()" placeholder="비밀번호 재확인">
        <h6 id="password-confirm-result"></h6> <br>
        <input type="text" id="member-name" onblur="name_check()" name="memberName" placeholder="이름">
        <h6 id="name-result"></h6> <br>
        <input type="text" id="member-mobile" onblur="mobile_check()" maxlength="11" name="memberMobile" placeholder="전화번호(숫자만입력)">
        <h6 id="mobile-result"></h6> <br>
        <input type="hidden" name="memberAddress" id="memberAddress">
        <div style="display: inline-block">
            <input type="text" id="sample6_postcode" placeholder="우편번호"></div>
        <div style="display: inline-block">
            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></div>
        <br>
        <input type="text" id="sample6_address" placeholder="주소"><br>
        <div style="display: inline-block">
            <input type="text" id="sample6_detailAddress" placeholder="상세주소">
        </div>
        <div style="display: inline-block">
            <input type="text" id="sample6_extraAddress" placeholder="참고항목">
        </div>
        <br><br>
        <input type="submit" value="가입하기" onclick="member_address()">

<%--        <div class="form-check">--%>
<%--            <input type="checkbox" name="gender" value="male" class="form-check-input" id="check-box"> 개인정보 수집 및 이용에 동의합니다.(필수)--%>
<%--        </div><br>--%>
<%--        <input type="submit" value="가입하기">--%>
    </form>
</div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const email_check = () => {
        const email = document.getElementById("member-email").value;
        const result = document.getElementById("email-result");
        const exp = /^[a-z\d]{6,20}$/;
        let rtn = false;

        $.ajax({
            type: "post",
            url: "/member/email-check",
            async : false,
            data: {
                "member-email": email
            },
            success: function () {
                console.log(email);
                if (email.length == 0) {
                    result.innerHTML = "필수정보입니다.";
                    result.style.color = "red";
                } else if (email.match(exp)) {
                    result.innerHTML = "사용가능한 이메일입니다.";
                    result.style.color = "green";
                    rtn = true;
                } else {
                    result.innerHTML = "6~20자의 영문 소문자만 사용 가능합니다.";
                    result.style.color = "red";
                }
            },
            error: function () {
                console.log(email);
                result.innerHTML = "사용중인 이메일입니다.";
                result.style.color = "red";
            }
        });
        return rtn;
    }

    const password_check = () => {
        const password = document.getElementById("member-password").value;
        const passwordResult = document.getElementById("password-result");
        const exp = /^(?=.*[a-z])(?=.*\d)(?=.*[-_!#])[a-zA-Z\d-_!#]{6,20}$/;
        if(password.length == 0) {
            passwordResult.innerHTML = "필수입력입니다.";
            passwordResult.style.color = "red";
            return false;
        } else if(password.match(exp)) {
            passwordResult.innerHTML = "사용가능한 비밀번호입니다.";
            passwordResult.style.color = "green";
            return true;
        } else {
            passwordResult.innerHTML = "6~20글자, 영문 소문자 필수, 숫자 필수, 특수문자 필수(!#-_)만 가능합니다.";
            passwordResult.style.color = "red";
            return false;
        }
    }

    const password_confirm = () => {
        const password = document.getElementById("member-password").value;
        const passwordCheck = document.getElementById("password-confirm").value;
        const passwordConfirm = document.getElementById("password-confirm-result");
        if(passwordCheck.length == 0) {
            passwordConfirm.innerHTML = "필수입력입니다.";
            passwordConfirm.style.color = "red";
            return false;
        } else if (password == passwordCheck) {
            passwordConfirm.innerHTML = "일치합니다.";
            passwordConfirm.style.color = "green";
            return true;
        } else {
            passwordConfirm.innerHTML = "비밀번호가 일치하지 않습니다.";
            passwordConfirm.style.color = "red";
            return false;
        }
    }

    const name_check = () => {
        const name = document.getElementById("member-name").value;
        const nameResult = document.getElementById("name-result");
        if(name.length == 0) {
            nameResult.innerHTML = "필수입력입니다."
            nameResult.style.color = "red";
            return false;
        } else {
            nameResult.style.display = "none";
            return true;
        }
    }

    const mobile_check = () => {
        const mobile = document.getElementById("member-mobile");
        const num = mobile.value.replace(/-/g, "");
        const mobileResult = document.getElementById("mobile-result");
        const regex = /(\d{3})(\d{4})(\d{4})/;
        if(mobile.value.length == 0) {
            mobileResult.innerHTML = "필수입력입니다.";
            mobileResult.style.color = "red";
            return false;
        } else if (num.length === 11) {
            mobile.value = num.replace(regex, "$1-$2-$3");
            return true;
        }
    }

    const member_address = () => {
        const postcode = document.getElementById("sample6_postcode").value;
        const address = document.getElementById("sample6_address").value;
        const detailAddress = document.getElementById("sample6_detailAddress").value;
        const extraAddress = document.getElementById("sample6_extraAddress").value;
        const memberAddress = postcode + ", " + address + ", " + detailAddress + ", " + extraAddress;
        document.getElementById("memberAddress").value = memberAddress;
    }

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

    const check = () => {
        const email = document.getElementById("member-email");
        const password = document.getElementById("member-password");
        const passwordConfirm = document.getElementById("password-confirm");
        const name = document.getElementById("member-name");
        const mobile = document.getElementById("member-mobile");
        const postcode = document.getElementById("sample6_postcode").value;
        const address = document.getElementById("sample6_address").value;
        const detailAddress = document.getElementById("sample6_detailAddress").value;
        const extraAddress = document.getElementById("sample6_extraAddress").value;

        if (!email_check()) {
            email.focus();
            return false;
        } else if (!password_check()) {
            password.focus();
            return false;
        } else if (!password_confirm()) {
            passwordConfirm.focus();
            return false;
        } else if (!name_check()) {
            name.focus();
            return false;
        } else if (!mobile_check()) {
            mobile.focus();
            return false;
        } else if (postcode.length == 0) {
            document.getElementById("sample6_postcode").focus();
            return false;
        } else if (address.length == 0) {
            document.getElementById("sample6_address").focus();
            return false;
        } else if (detailAddress.length == 0) {
            document.getElementById("sample6_detailAddress").focus();
            return false;
        } else if (extraAddress.length == 0) {
            document.getElementById("sample6_extraAddress").focus();
            return false;
        }else {
            return true;
        }
    }
</script>
</html>
