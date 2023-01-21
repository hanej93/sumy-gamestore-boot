<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>



<!DOCTYPE html>
<html>
<head>
<!-- Title -->
<title>sumy gamestore - Edit member information page</title>

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
		<sec:authentication property="principal" var="principal" />
	</sec:authorize>

	<main class="g-pt-80">
		<!-- Header -->
		<header id="js-header"
			class="u-header u-header--sticky-top u-header--toggle-section u-header--change-appearance"
			data-header-fix-moment="300">
			<!-- Top Bar -->
			<jsp:include page="layout/header.jsp" />
			<!-- End Top Bar -->
		</header>
		<!-- End Header -->

		<!-- Breadcrumbs -->
		<section class="g-brd-bottom g-brd-gray-light-v4 g-py-30">
			<div class="container">
				<div class="d-sm-flex text-center">
					<div class="align-self-center">
						<h1 class="h3 mb-0">회원정보 변경</h1>
					</div>

					<div class="align-self-center ml-auto">
						<ul class="u-list-inline">
							<li class="list-inline-item g-mr-5"><a
								class="u-link-v5 g-color-text" href="/user/login-security">마이페이지</a>
								<i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i></li>
							<li class="list-inline-item g-color-primary"><span>회원정보
									변경</span></li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<!-- End Breadcrumbs -->

		<div class="container g-pt-70 g-pb-30">
			<div class="row">
				<!-- mypageSideBar -->
				<jsp:include page="layout/mypageSideBar.jsp" />
				<!-- End mypageSideBar -->

				<!-- Login & Security -->
				<div class="col-lg-9 g-mb-50">
					<!-- 영선이 div -->
					<div id="psBefore" class="container g-pt-30 g-pb-30">
						<form name="addressForm">
							<input type="text" name="userId" value="26"
								style="display: none;">
							<h3 class="h5 mb-3">비밀번호 확인</h3>
							<div class="row no-gutters g-mb-10">
								<div class="input-group col-6">
									<input id="passwordMath" name="userPassword"
										class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 rounded g-py-15 g-px-15"
										type="password" placeholder="비밀번호 입력">
								</div>
								<div class="input-group-append p-0">
									<button id="passwordBtn"
										class="btn u-btn-primary g-font-size-12 text-uppercase g-py-12 g-px-25"
										type="button">확인</button>
									<!-- 주소 팝업 버튼 -->
								</div>
							</div>
						</form>
					</div>
					<!-- Info -->
					<div id="psAfetr" style="display: none">
						<div
							class="g-brd-around g-brd-gray-light-v4 rounded g-pa-30 g-mb-30">
							<div class="row">
								<div class="col-8">
									<span class="d-block g-color-text g-font-size-13 mb-1">이메일(ID)</span>
									<span class="d-block">${principal.user.userEmail}</span>
								</div>
							</div>

							<hr class="g-brd-gray-light-v4 g-my-20">

							<div class="row">
								<div class="col-8">
									<span class="d-block g-color-text g-font-size-13 mb-1">이름</span>
									<span class="d-block">${principal.user.userName}</span>
								</div>
							</div>
						</div>

						<div id="loginSecurityNowNickDiv"
							class="g-brd-around g-brd-gray-light-v4 rounded g-pa-30 g-mb-30">
							<div class="row">
								<div class="col-12">
									<span class="d-block g-color-text g-font-size-13 mb-1">별명</span>
									<span id="loginSecurityStarName">${principal.user.userNickname}</span>
									<div class="text-right">
										<a id="loginSecurityNameBtn"
											class="btn g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-13 rounded g-px-18 g-py-7">수정</a></a>
									</div>
									<form name="nickNameForm" style="display: none;">
										<div class="g-mb-30">
											<input type="text" name="userId"
												value="${principal.user.userId}" style="display: none;">
											<input type="hidden" name="userPassword"
												>
											<textarea id="loginSecurityNickNameTextArea"
												name="userNickname"
												class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 g-brd-primary--focus g-resize-none rounded-3 g-py-13 g-px-15"
												rows="5" placeholder="별명을 작성해주세요."></textarea>
										</div>
										<div class="row align-items-center">
											<div class="col-8">
												<button id="loginSecurityCancelBtn"
													class="btn u-btn-primary g-font-size-12 text-uppercase g-py-15 g-px-25 nickNameFormDelete g-mr-10"
													type="button" role="button">취소</button>
												<button id="loginSecurityUpdateBtn"
													class="btn u-btn-primary g-font-size-12 text-uppercase g-py-15 g-px-25 nickNameFormComplete"
													type="button" role="button">수정 완료</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>

						<div id="loginSecurityNowPwdDiv"
							class="g-brd-around g-brd-gray-light-v4 rounded g-pa-30 g-mb-30">
							<div class="row">
								<div class="col-8">
									<span class="d-block g-color-text g-font-size-13 mb-1">비밀번호
										변경</span> <span
										class="d-block g-font-weight-600 g-color-primary g-font-size-10 g-mt-20">비밀번호
										변경을 하기 위해선, 이메일 인증이 필요합니다.</span>
									<!-- <input type="password" id="loginSecurityNowPwd"
									value="asdf!@1234" readonly="readonly"
									class="form-control form-control-md rounded"> -->
								</div>
							</div>
							<div class="text-right">
								<a href="/sumy/password-recovery"
									class="btn g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-13 rounded g-px-18 g-py-7">변경</a>
							</div>
						</div>

						<div id="loginSecurityAddressDiv"
							class="g-brd-around g-brd-gray-light-v4 rounded g-pa-30 g-mb-30">
							<div class="row">
								<div class="col-8">
									<span class="d-block g-color-text g-font-size-13 mb-1">주소</span>
									<span class="d-block"> <!-- Addresses --> <!-- Address -->
										<address class="media">
											<div class="d-flex mr-3">
												<span class="u-icon-v1 g-color-gray-dark-v4"><i
													class="icon-real-estate-027 u-line-icon-pro"></i></span>
											</div>
											<div>
												<div id="loginSecurityAddressNow01"
													class="media-body g-color-text">${principal.user.userZipCode}</div>
												<div id="loginSecurityAddressNow02"
													class="media-body g-color-text">${principal.user.userAddress}</div>
												<div id="loginSecurityAddressNow03"
													class="media-body g-color-text">${principal.user.userDetailAddress}</div>
											</div>
										</address> <!-- End Address --> <!-- End Addresses -->

									</span>
								</div>
								<div class="col-4 text-right g-mt-80">
									<a id="loginSecurityAddressBtn"
										class="btn g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-13 rounded g-px-18 g-py-7">수정</a>
								</div>
							</div>
						</div>

						<div id="loginSecurityAddressBlock" style="display: none;"
							class="g-brd-around g-brd-gray-light-v4 rounded g-pa-30 g-mb-30">
							<div class="row">
								<div class="col-8">
									<form name="addressForm">
										<input type="text" name="userId"
											value="${principal.user.userId}" style="display: none;">
										<input type="hidden" name="userPassword"
												value="">
										<h3 class="h5 mb-3">주소 변경</h3>
										<div class="row no-gutters g-mb-10">
											<div class="input-group col-6">
												<input id="loginSecurityAddressUpdate01" name="userZipCode"
													class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 rounded g-py-15 g-px-15"
													type="text" placeholder="우편번호 입력" readonly="readonly">
											</div>
											<div class="input-group-append p-0">
												<button
													class="btn u-btn-primary g-font-size-12 text-uppercase g-py-12 g-px-25"
													onclick="goPopup()" type="button">우편번호 찾기</button>
												<!-- 주소 팝업 버튼 -->
											</div>
										</div>

										<div class="g-mb-10">
											<input id="loginSecurityAddressUpdate02" name="userAddress"
												class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 rounded g-py-15 g-px-15"
												type="text" placeholder="주소 입력">
										</div>

										<div class="g-mb-10">
											<input id="loginSecurityAddressUpdate03"
												name="userDetailAddress"
												class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 rounded g-py-15 g-px-15"
												type="text" placeholder="상세주소 입력">
										</div>
										<div class="col-8">
											<button id="loginSecurityCancelAddressBtn"
												class="btn u-btn-primary g-font-size-12 text-uppercase g-py-15 g-px-25 g-mr-10"
												type="button" role="button">취소</button>
											<button id="loginSecurityUpdateAddressBtn"
												class="btn u-btn-primary g-font-size-12 text-uppercase g-py-15 g-px-25"
												type="button" role="button">수정 완료</button>
										</div>
									</form>
								</div>


							</div>
						</div>

						<div
							class="g-brd-around g-brd-gray-light-v4 rounded g-pa-30 g-mb-30">
							<div class="row">
								<div id="loginSecurityNumberDiv" class="col-8">
									<span class="d-block g-color-text g-font-size-13 mb-1">연락처</span>
									<span id="loginSecurityNumber">${principal.user.userPhoneNumber}</span>
								</div>

								<div class="col-4 text-right g-mt-35">
									<a id="loginSecurityNumberBtn"
										class="btn g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-13 rounded g-px-18 g-py-7">수정</a>
								</div>
								<div class="col-8">
									<form id="loginSecurityNumberForm" name="phoneForm"
										style="display: none;">
										<input type="text" name="userId"
											value="${principal.user.userId}" style="display: none;">
										<input type="hidden" name="userPassword"
												value="">
										<div class="g-mb-30">
											<input id="loginSecurityNumberUpdate" name="userPhoneNumber" value="${principal.user.userPhoneNumber}"
												class="form-control g-brd-gray-light-v4 g-brd-primary--focus g-color-text rounded g-py-13 g-px-15"
												type="text" placeholder="연락처 - 빼고 입력"
												oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
										</div>
										<div class="row align-items-center">
											<div class="col-8">
												<button id="loginSecurityCancelNumberBtn"
													class="btn u-btn-primary g-font-size-12 text-uppercase g-py-15 g-px-25 g-mr-10"
													type="button" role="button">취소</button>
												<button id="loginSecurityUpdateNumberBtn"
													class="btn u-btn-primary g-font-size-12 text-uppercase g-py-15 g-px-25"
													type="button" role="button">수정 완료</button>
											</div>

										</div>
									</form>
								</div>
							</div>
						</div>

					<button id="WithdrawalBtn" userId="${principal.user.userId }"
						class="btn u-btn-white g-color-primary g-brd-primary g-font-size-12 text-uppercase g-py-15 g-px-25"
						type="button">회원 탈퇴</button>
					</div>

				</div>


			</div>
		</div>

		<!-- 프로필 사진 변경 모달 내용 시작 -->
		<div class="modal fade" id="profileUpdateModal" tabindex="-1"
			aria-labelledby="declarationModalLabel" style="display: none;"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title ml-auto" id="declarationModalLabel">프로필
							사진 업데이트</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<form id="fileForm" name="fileForm">
							<label class="g-mb-10">이미지 찾기</label>
							<div class="input-group g-mb-10">
								<div class="custom-file">
									<!-- Plain File Input -->
									<div class="form-group mb-0">
										<label class="u-file-attach-v2 g-color-gray-dark-v5 mb-0">
											<input id="imgInp" class="questionFileInput"
											name="fileAttachment" type="file"> <i
											class="icon-cloud-upload g-font-size-16 g-pos-rel g-top-2 g-mr-5"></i>
											<span class="js-value">이미지 첨부</span>
										</label>
									</div>
									<!-- End Plain File Input -->
								</div>
							</div>
							<div
								class="g-brd-around g-brd-gray-light-v3 g-bg-white rounded g-mb-20 text-center"
								style="height: 360px">
								<img id="blah" class="img-fluid"
									src="/resources/static/user/assets/img-temp/500x320/img1.png"
									style="height: 100%;" alt="이미지 찾기를 실행해주세요.">
							</div>
						</form>
					</div>
					<div class="modal-footer justify-content-center">
						<div class="row g-mx-minus-5 g-mb-20">
							<button id="profileUpdateBtn"
								class="btn btn-lg u-btn-primary g-mr-10 g-font-size-14"
								type="button" data-dismiss="modal" aria-label="Close">
								업데이트</button>
							<button
								class="btn btn-lg u-btn-outline-primary u-btn-hover-v1-1 g-mr-10 g-font-size-14"
								data-dismiss="modal" aria-label="Close" type="button">
								닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 프로필 사진 변경 모달 내용 끝 -->


		<!-- Footer -->
		<footer class="g-bg-main-light-v1">
			<jsp:include page="layout/footer.jsp" />
		</footer>
		<!-- End Footer -->

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
	<script src="/resources/static/assets/js/helpers/hs.focus-state.js"></script>
	<script
		src="/resources/static/assets/js/components/hs.file-attachement.js"></script>
	<script
		src="/resources/static/assets/js/helpers/hs.file-attachments.js"></script>

	<!-- JS Customization -->
	<script src="/resources/static/user/assets/js/page-login-security-1.js"></script>
	<script src="/resources/static/user/assets/js/footer.js"></script>

	<!-- JS Plugins Init. -->
	<script>
		$(document).on(
				'ready',
				function() {
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
					$.HSCore.components.HSDropdown.init(
							$('[data-dropdown-target]'), {
								afterOpen : function() {
									$(this).find('input[type="search"]')
											.focus();
								}
							});

					// initialization of HSScrollBar component
					$.HSCore.components.HSScrollBar.init($('.js-scrollbar'));

					// initialization of go to
					$.HSCore.components.HSGoTo.init('.js-go-to');

					// input = file 저장주소
					$.HSCore.helpers.HSFileAttachments.init();
					$.HSCore.components.HSFileAttachment
							.init('.js-file-attachment');
					$.HSCore.helpers.HSFocusState.init();

					//include mypageSideBar active 클래스 추가 
					$("ul.list-unstyled.mb-0 li").eq(0).children().first()
							.addClass("active").addClass(
									"g-color-primary--parent-active").addClass(
									"g-bg-gray-light-v5--active");
				});
	</script>
</body>
</html>