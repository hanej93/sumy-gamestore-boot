<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<!-- Title -->
<title>sumy gamestore - finding password page</title>

<!--favicon  -->
<link rel="shortcut icon" type="image/x-icon" href="/resources/static/user/assets/img/logo/logo-yy (1).ico" />

<!-- Required Meta Tags Always Come First -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">

<!-- CSS Global Compulsory -->
<link rel="stylesheet"
	href="/resources/static/assets/vendor/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/icon-line/css/simple-line-icons.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet"
	href="/resources/static/assets/vendor/icon-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/icon-line-pro/style.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/icon-hs/style.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/animate.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/hamburgers/hamburgers.min.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/hs-megamenu/src/hs.megamenu.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.min.css">

<!-- CSS Unify Theme -->
<link rel="stylesheet"
	href="/resources/static/user/assets/css/styles.e-commerce.css">

<!-- CSS Customization -->
<link rel="stylesheet" href="/resources/static/assets/css/custom.css">
</head>

<body>
   
	<sec:authorize access="isAuthenticated()">
	    <sec:authentication property="principal" var="principal"/>
	</sec:authorize>
	<main class="g-pt-80">
		<input id="userId" type="text" value="${principal.user.userId}" style="display:none;">
		<input id="hideEmail" type="text" value="${principal.user.userEmail}" style="display:none;">
		<header id="js-header"
			class="u-header u-header--sticky-top u-header--toggle-section u-header--change-appearance"
			data-header-fix-moment="300">
			<!-- Top Bar -->
			<jsp:include page="layout/header.jsp" />
			<!-- End Top Bar -->
		</header>
		<!-- End Header -->


		<!-- Login -->
		<section class="container g-py-100">
			<div class="row justify-content-center">
				<div class="col-sm-9 col-md-7 col-lg-5">
					<div id="rePasswordFirst"
						class="g-brd-around g-brd-gray-light-v3 g-bg-white rounded g-px-30 g-py-50 mb-4">
						<header class="text-center mb-4">
							<h1 class="h4 g-color-black g-font-weight-400">비밀번호 찾기</h1>
							<p>
								비밀번호 찾기에 사용될<br>이메일 계정을 입력해주세요.
							</p>
						</header>

						
							<div class="form-group g-mb-20">
								<label class="g-mb-10">이메일</label>
								<div class="input-group g-mb-10">
									<input id="userEmail"
										class="form-control form-control-md rounded g-py-15 g-px-15"
										type="email" placeholder="이메일 주소 @포함">
									<div id="emailReBox" class="input-group-append p-0"
										style="display: none;">
										<!-- 이메일 인증 버튼 -->
										<button id="emailReBtn"
											class="rounded btn u-btn-white g-brd-primary g-color-primary g-font-size-12 text-uppercase g-py-17 g-px-15"
											type="button">메일주소 변경</button>
									</div>
									<div id="emailCertificationSendBox"
										class="input-group-append p-0">
										<!-- 이메일 인증 버튼 -->
										<button id="emailCertificationSendBtn"
											class="btn u-btn-primary g-font-size-12 text-uppercase g-py-17 g-px-15"
											type="button">인증</button>
									</div>
								</div>
								<small class="form-control-feedback" style="display: none;">이메일
									주소 입력은 필수 항목입니다.</small>
							</div>

							<div id="emailCertificationNumInput" class="form-group g-mb-20"
								style="display: none;">
								<div class="input-group g-mb-10">
									<input id="emailCertificationInput"
										class="form-control form-control-md rounded g-py-15 g-px-15"
										type="text" placeholder="이메일 인증번호 6자리 입력" maxlength="6"
										oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
									<div class="input-group-append p-0">
										<!-- 이메일 인증 버튼 -->
										<button id="emailCertificationSubmitBtn"
											class="rounded btn u-btn-primary g-font-size-12 text-uppercase g-py-17 g-px-15"
											type="button">인증번호 확인</button>
									</div>
								</div>
								<small class="form-control-feedback g-mt-10"
									style="display: none;">이메일 인증번호 입력은 필수 항목입니다.</small>
							</div>
					</div>
					<div id="rePasswordLast"
						class="g-brd-around g-brd-gray-light-v3 g-bg-white rounded g-px-30 g-py-50 mb-4"  style="display: none;">
						<header class="text-center mb-4">
							<h1 class="h4 g-color-black g-font-weight-400">비밀번호 변경</h1>
							<p>
								영문 대소문자 포함, 숫자 포함, 특수 문자 포함, 공백x, 비밀번호 8~20자
							</p>
						</header>

						<!-- Form -->
						<form class="g-py-15" name="pwdRecoveryForm" method="post">
							
							<div id="loginSecurityPwdUpdate">

								<div class="form-group g-mb-20">
								<input type="text" id="upuserId" name="userId"
                                 value="${principal.user.userId}" 
                                 style="display: none;">
                                 	<label class="g-mb-10">로그인 이메일</label> 
                                 	<input
											id="loginSecurityUpdateEmail"
											class="form-control form-control-md rounded g-py-15 g-px-15"
											type="text" readonly="readonly">
									<label class="g-mb-10 g-mt-20">새 비밀번호</label>
									<div class="input-group"> 
										<input
											id="loginSecurityUpdateNewPwd"
											name="userPassword"
											class="form-control form-control-md rounded g-py-15 g-px-15 rounded-right-none"
											type="password" placeholder="새 비밀번호 입력">
											<span class="input-group-append g-color-gray-dark-v5 rounded-left-none justify-content-center align-items-center g-bg-white g-rounded-right-3" style="border :1px solid #ced4da;cursor:pointer;"><i id="passwordEye" class="fa fa-eye fa-lg"></i>
										</span>
									</div>
									
									<label class="g-mb-10 g-mt-20">새 비밀번호 확인</label>  
									<div class="input-group">
										<input
											id="loginSecurityUpdateCheckNewPwd"
											class="form-control form-control-md rounded g-py-15 g-px-15 rounded-right-none"
											type="password" placeholder="새 비밀번호 재입력">
											<span class="input-group-append g-color-gray-dark-v5 rounded-left-none justify-content-center align-items-center g-bg-white g-rounded-right-3" style="border :1px solid #ced4da;cursor:pointer;"><i id="passwordEye2" class="fa fa-eye fa-lg"></i>
										</span>
									</div>

									<div class="row no-gutters g-mt-30">
										<div class="col-6">
										<button id="loginSecurityCancelPwdBtn"
											class="g-brd-primary btn btn-block u-btn-white g-color-primary g-font-size-12 text-uppercase g-py-15 g-px-25 g-mr-10"
											type="button" role="button">취소</button>
										</div>
										<div class="col-6">
										<button id="loginSecurityUpdatePwdBtn"
											class="ml-2 btn btn-block u-btn-primary g-font-size-12 text-uppercase g-py-15 g-px-25"
											type="button" role="button">수정 완료</button>
										</div>
									</div>

								</div>
							</div>
						</form>
						<!-- End Form -->
					</div>

					<div class="row justify-content-between mb-5">
						<div class="col align-self-center text-center">
							<p class="g-font-size-13">
								비밀번호를 찾으셨습니까? <a href="/sumy/login">로그인</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Login -->

		<!-- Footer -->
		<footer class="g-bg-main-light-v1">
			<jsp:include page="layout/footer.jsp" />
		</footer>
		<!-- End Footer -->

		<a class="js-go-to u-go-to-v2" href="#" data-type="fixed"
			data-position='{
           "bottom": 15,
           "right": 15
         }'
			data-offset-top="400" data-compensation="#js-header"
			data-show-effect="zoomIn"> <i class="hs-icon hs-icon-arrow-top"></i>
		</a>
	</main>

	<div class="u-outer-spaces-helper"></div>

	<!-- JS Global Compulsory -->
	<script src="/resources/static/assets/vendor/jquery/jquery.min.js"></script>
	<script
		src="/resources/static/assets/vendor/jquery-migrate/jquery-migrate.min.js"></script>
	<script src="/resources/static/assets/vendor/popper.js/popper.min.js"></script>
	<script
		src="/resources/static/assets/vendor/bootstrap/bootstrap.min.js"></script>

	<!-- JS Implementing Plugins -->
	<script
		src="/resources/static/assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>
	<script
		src="/resources/static/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

	<!-- JS Unify -->
	<script src="/resources/static/assets/js/hs.core.js"></script>
	<script src="/resources/static/assets/js/components/hs.header.js"></script>
	<script src="/resources/static/assets/js/helpers/hs.hamburgers.js"></script>
	<script src="/resources/static/assets/js/components/hs.dropdown.js"></script>
	<script src="/resources/static/assets/js/components/hs.scrollbar.js"></script>
	<script src="/resources/static/assets/js/components/hs.go-to.js"></script>

	<!-- JS Customization -->
	<script src="/resources/static/user/assets/js/page-password-recovery-1.js"></script>
	<script src="/resources/static/user/assets/js/footer.js"></script>

	<!-- JS Plugins Init. -->
	<script>
		$(document).on('ready', function() {
			// initialization of header
			$.HSCore.components.HSHeader.init($('#js-header'));
			$.HSCore.helpers.HSHamburgers.init('.hamburger');

			// initialization of HSMegaMenu component
			$('.js-mega-menu').HSMegaMenu({
				event : 'hover',
				pageContainer : $('.container'),
				breakpoint : 991
			});

			// initialization of HSDropdown component
			$.HSCore.components.HSDropdown.init($('[data-dropdown-target]'), {
				afterOpen : function() {
					$(this).find('input[type="search"]').focus();
				}
			});

			// initialization of HSScrollBar component
			$.HSCore.components.HSScrollBar.init($('.js-scrollbar'));

			// initialization of go to
			$.HSCore.components.HSGoTo.init('.js-go-to');
		});
	</script>
</body>
</html>