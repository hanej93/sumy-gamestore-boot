<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page-help-1</title>
<head>
<!-- Title -->
<title>sumy gamestore - Q&A page</title>

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

		<!-- Help -->
		<div class="container g-pt-100 g-pb-70">
			<div class="row g-mb-20">
				<div class="col-md-4 g-mb-30">
					<h2 class="mb-5">
						자주 묻는 질문<br>Q&A
					</h2>
					<c:if test="${principal != null}">
						<div class="g-mb-30">
							<!-- Media -->
							<div class="media">
								<div class="d-flex mr-2">
									<span
										class="u-icon-v3 g-width-20 g-height-20 g-color-white g-bg-primary g-font-size-12 rounded-circle">
										<i class="fa fa-question"></i>
									</span>
								</div>
								<div class="media-body">
									<a
										class="u-link-v5 g-color-main g-color-primary--hover g-font-weight-600"
										data-toggle="modal" data-target="#questionForSumyModal"
										style="cursor: pointer;">질문을 찾지 못하셨나요?</a>
									<p>
										걱정하지 마세요. <br>Sumy 팀에게 문의 메일을 보내주시면<br>빠르게
										처리해드릴게요!
									</p>
								</div>
							</div>
							<!-- End Media -->
						</div>
					</c:if>
				</div>

				<div class="col-md-8 g-mb-30">

					<!-- Tab panes -->
					<div id="nav-5-3-primary-ver"
						class="tab-content g-pt-20 g-pt-0--md">
						<div class="tab-pane fade show active" id="nav-5-3-primary-ver--1"
							role="tabpanel">
							<h3 class="h5 g-color-gray-dark-v2 g-mb-30">자주 묻는 질문</h3>

							<!-- Accordion -->
							<div id="accordion-12-1"
								class="u-accordion u-accordion-color-primary" role="tablist"
								aria-multiselectable="true">
								<!-- Card -->
								<div
									class="card g-brd-none g-brd-bottom g-brd-gray-light-v3 rounded-0 g-pb-30 g-mb-30">
									<div id="accordion-12-1-heading-01"
										class="u-accordion__header g-color-gray-dark-v4 g-font-weight-500 g-font-size-16 g-pa-0"
										role="tab">
										<span
											class="g-color-primary g-font-weight-700 g-font-size-16 g-line-height-1_2">1.</span>
										Sumy Games Store는 무엇인가요?
									</div>
									<div id="accordion-12-1-body-01" class="collapse"
										role="tabpanel" aria-labelledby="accordion-12-1-heading-01">
										<div class="u-accordion__body g-color-gray-dark-v4">
											Sumy Games Store는 플레이어와 크리에이터를 모두 고려하여 게임들이 엄선된 PC 및 Mac용 디지털
											스토어입니다. 게이머에게 굉장한 게임들을, 게임 개발사에게는 공평한 기회를 제공하는 것에 집중하고 있습니다.
											제품 가격의 70%만이 개발사의 몫으로 제공되는 다른 스토어들과는 다르게 Sumy Games Store에서
											게임을 구매하면 제품 가격의 88%가 개발사의 몫으로 제공됩니다. 이는 개발사들이 더 방대하고, 더 뛰어난
											게임을 개발하는 데 투자할 수 있도록 돕습니다.</div>
									</div>
									<h5 class="g-font-weight-400 g-font-size-13 g-pl-8 mt-3 mb-0">
										<a
											class="g-color-primary g-text-underline--none--hover g-pa-10"
											href="#accordion-12-1-body-01" data-toggle="collapse"
											data-parent="#accordion-12-1" aria-expanded="false"
											aria-controls="accordion-12-1-body-01"> <span
											class="u-accordion__control-icon"> <i
												class="g-font-style-normal">질문 더보기 <span
													class="ml-2 fa fa-caret-down"></span>
											</i> <i class="g-font-style-normal">질문 닫기 <span
													class="ml-2 fa fa-caret-up"></span>
											</i>
										</span>
										</a>
									</h5>
								</div>
								<!-- End Card -->

								<!-- Card -->
								<div
									class="card g-brd-none g-brd-bottom g-brd-gray-light-v3 rounded-0 g-pb-30 g-mb-30">
									<div id="accordion-12-1-heading-02"
										class="u-accordion__header g-color-gray-dark-v4 g-font-weight-500 g-font-size-16 g-pa-0"
										role="tab">
										<span
											class="g-color-primary g-font-weight-700 g-font-size-16 g-line-height-1_2">2.</span>
										Sumy Games Store는 어디서 다운로드할 수 있나요?
									</div>
									<div id="accordion-12-1-body-02" class="collapse"
										role="tabpanel" aria-labelledby="accordion-12-1-heading-02">
										<div class="u-accordion__body g-color-gray-dark-v4">
											Sumy Games Store 사이트인 Sumygames.com을 방문하거나 페이지 우측 상단에서 “수미게임즈
											받기”를 클릭하세요. 오직 저희 공식 사이트에서만 Sumy Games Store 런처 설치 프로그램을 안전하게
											다운로드받을 수 있습니다. 다른 경로를 통해 다운로드받은 설치 프로그램은 안전하지 않을 수 있습니다.</div>
									</div>
									<h5 class="g-font-weight-400 g-font-size-13 g-pl-8 mt-3 mb-0">
										<a
											class="collapsed g-color-primary g-text-underline--none--hover g-pa-10"
											href="#accordion-12-1-body-02" data-toggle="collapse"
											data-parent="#accordion-12-1" aria-expanded="false"
											aria-controls="accordion-12-1-body-02"> <span
											class="u-accordion__control-icon"> <i
												class="g-font-style-normal">질문 더보기 <span
													class="ml-2 fa fa-caret-down"></span>
											</i> <i class="g-font-style-normal">질문 닫기 <span
													class="ml-2 fa fa-caret-up"></span>
											</i>
										</span>
										</a>
									</h5>
								</div>
								<!-- End Card -->

								<!-- Card -->
								<div
									class="card g-brd-none g-brd-bottom g-brd-gray-light-v3 rounded-0 g-pb-30 g-mb-30">
									<div id="accordion-12-1-heading-03"
										class="u-accordion__header g-color-gray-dark-v4 g-font-weight-500 g-font-size-16 g-pa-0"
										role="tab">
										<span
											class="g-color-primary g-font-weight-700 g-font-size-16 g-line-height-1_2">3.</span>
										Sumy Games Store는 어떤 플랫폼을 지원하나요?
									</div>
									<div id="accordion-12-1-body-03" class="collapse"
										role="tabpanel" aria-labelledby="accordion-12-1-heading-03">
										<div class="u-accordion__body g-color-gray-dark-v4">현재
											Sumy Games Store는 PC와 Mac을 지원하고 있습니다. 모든 상품 페이지의 “게임 정보”
											섹션에서는 각각의 게임에 대하여 특정 플랫폼의 호환 여부를 확인할 수 있습니다.</div>
									</div>
									<h5 class="g-font-weight-400 g-font-size-13 g-pl-8 mt-3 mb-0">
										<a
											class="collapsed g-color-primary g-text-underline--none--hover g-pa-10"
											href="#accordion-12-1-body-03" data-toggle="collapse"
											data-parent="#accordion-12-1" aria-expanded="false"
											aria-controls="accordion-12-1-body-03"> <span
											class="u-accordion__control-icon"> <i
												class="g-font-style-normal">질문 더보기 <span
													class="ml-2 fa fa-caret-down"></span>
											</i> <i class="g-font-style-normal">질문 닫기 <span
													class="ml-2 fa fa-caret-up"></span>
											</i>
										</span>
										</a>
									</h5>
								</div>
								<!-- End Card -->

								<!-- Card -->
								<div
									class="card g-brd-none g-brd-bottom g-brd-gray-light-v3 rounded-0 g-pb-30 g-mb-30">
									<div id="accordion-12-1-heading-04"
										class="u-accordion__header g-color-gray-dark-v4 g-font-weight-500 g-font-size-16 g-pa-0"
										role="tab">
										<span
											class="g-color-primary g-font-weight-700 g-font-size-16 g-line-height-1_2">4.</span>
										앞으로의 Sumy Games Store 계획은 무엇인가요?
									</div>
									<div id="accordion-12-1-body-04" class="collapse"
										role="tabpanel" aria-labelledby="accordion-12-1-heading-04">
										<div class="u-accordion__body g-color-gray-dark-v4">앞으로
											추가될 기능, 개발자 업데이트, 알려진 주요 이슈는 Trello의 Sumy Games Store 로드맵에서
											확인할 수 있습니다. 또한 중요한 업데이트는 저희 새 소식 페이지와 Facebook, Twitter,
											Instagram, YouTube 등의 소셜 미디어에서도 공유되고 있습니다.</div>
									</div>
									<h5 class="g-font-weight-400 g-font-size-13 g-pl-8 mt-3 mb-0">
										<a
											class="collapsed g-color-primary g-text-underline--none--hover g-pa-10"
											href="#accordion-12-1-body-04" data-toggle="collapse"
											data-parent="#accordion-12-1" aria-expanded="false"
											aria-controls="accordion-12-1-body-04"> <span
											class="u-accordion__control-icon"> <i
												class="g-font-style-normal">질문 더보기 <span
													class="ml-2 fa fa-caret-down"></span>
											</i> <i class="g-font-style-normal">질문 닫기 <span
													class="ml-2 fa fa-caret-up"></span>
											</i>
										</span>
										</a>
									</h5>
								</div>
								<!-- End Card -->

								<!-- Card -->
								<div
									class="card g-brd-none g-brd-bottom g-brd-gray-light-v3 rounded-0 g-pb-30 g-mb-30">
									<div id="accordion-12-1-heading-05"
										class="u-accordion__header g-color-gray-dark-v4 g-font-weight-500 g-font-size-16 g-pa-0"
										role="tab">
										<span
											class="g-color-primary g-font-weight-700 g-font-size-16 g-line-height-1_2">5.</span>
										Sumy Games Store는 왜 독점작을 출시하나요?
									</div>
									<div id="accordion-12-1-body-05" class="collapse"
										role="tabpanel" aria-labelledby="accordion-12-1-heading-05">
										<div class="u-accordion__body g-color-gray-dark-v4">
											독점작은 성공한 많은 게임 플랫폼 및 스트리밍 영상, 음악 등의 기타 디지털 엔터테인먼트 산업의 성장에
											기여했습니다. <br> <br> 수미는 Sumy Games Store에서 게임을 독점
											제공하기 위해 개발사 및 퍼블리셔와 파트너십을 맺고 협업하고 있습니다. 수미는 독점 계약의 조건으로 개발사 및
											퍼블리셔에 개발 및 마케팅에 대한 지원을 제공합니다. 이는 개발사들이 게임의 품질을 더 높일 수 있게 도우며,
											크리에이터들에게는 큰 폭으로 불확실성을 줄여줍니다. <br> <br> 또한, 대부분의
											스토어에서는 개발사/퍼블리셔에게 돌아가는 수익 분배가 70%인 것과 달리 Sumy Games Store에서는
											88%가 됩니다.
										</div>
									</div>
									<h5 class="g-font-weight-400 g-font-size-13 g-pl-8 mt-3 mb-0">
										<a
											class="collapsed g-color-primary g-text-underline--none--hover g-pa-10"
											href="#accordion-12-1-body-05" data-toggle="collapse"
											data-parent="#accordion-12-1" aria-expanded="false"
											aria-controls="accordion-12-1-body-05"> <span
											class="u-accordion__control-icon"> <i
												class="g-font-style-normal">질문 더보기 <span
													class="ml-2 fa fa-caret-down"></span>
											</i> <i class="g-font-style-normal">질문 닫기 <span
													class="ml-2 fa fa-caret-up"></span>
											</i>
										</span>
										</a>
									</h5>
								</div>
								<!-- End Card -->

								<!-- Card -->
								<div
									class="card g-brd-none g-brd-bottom g-brd-gray-light-v3 rounded-0 g-pb-30 g-mb-30">
									<div id="accordion-12-1-heading-06"
										class="u-accordion__header g-color-gray-dark-v4 g-font-weight-500 g-font-size-16 g-pa-0"
										role="tab">
										<span
											class="g-color-primary g-font-weight-700 g-font-size-16 g-line-height-1_2">6.</span>
										크리에이터 후원 프로그램은 무엇인가요?
									</div>
									<div id="accordion-12-1-body-06" class="collapse"
										role="tabpanel" aria-labelledby="accordion-12-1-heading-06">
										<div class="u-accordion__body g-color-gray-dark-v4">
											크리에이터 후원 프로그램은 크리에이터들이 크리에이터 링크나 크리에이터 태그를 사용하여 Sumy Games
											Store의 게임으로부터 수익을 얻을 수 있는 프로그램입니다. 크리에이터 후원 프로그램에 관한 자세한 내용은
											여기서 확인할 수 있습니다.</div>
									</div>
									<h5 class="g-font-weight-400 g-font-size-13 g-pl-8 mt-3 mb-0">
										<a
											class="collapsed g-color-primary g-text-underline--none--hover g-pa-10"
											href="#accordion-12-1-body-06" data-toggle="collapse"
											data-parent="#accordion-12-1" aria-expanded="false"
											aria-controls="accordion-12-1-body-03"> <span
											class="u-accordion__control-icon"> <i
												class="g-font-style-normal">질문 더보기 <span
													class="ml-2 fa fa-caret-down"></span>
											</i> <i class="g-font-style-normal">질문 닫기 <span
													class="ml-2 fa fa-caret-up"></span>
											</i>
										</span>
										</a>
									</h5>
								</div>
								<!-- End Card -->

								<!-- Card -->
								<div
									class="card g-brd-none g-brd-bottom g-brd-gray-light-v3 rounded-0 g-pb-30 g-mb-30">
									<div id="accordion-12-1-heading-07"
										class="u-accordion__header g-color-gray-dark-v4 g-font-weight-500 g-font-size-16 g-pa-0"
										role="tab">
										<span
											class="g-color-primary g-font-weight-700 g-font-size-16 g-line-height-1_2">7.</span>
										무료 게임은 무엇인가요?
									</div>
									<div id="accordion-12-1-body-07" class="collapse"
										role="tabpanel" aria-labelledby="accordion-12-1-heading-07">
										<div class="u-accordion__body g-color-gray-dark-v4">수미는
											2020년 한 해 동안 매주 새로운 무료 게임을 제공하고 있습니다. 한 번 무료 게임을 받으면 해당 게임이
											유료로 전환되더라도 게임을 계속 소장할 수 있습니다.</div>
									</div>
									<h5 class="g-font-weight-400 g-font-size-13 g-pl-8 mt-3 mb-0">
										<a
											class="collapsed g-color-primary g-text-underline--none--hover g-pa-10"
											href="#accordion-12-1-body-07" data-toggle="collapse"
											data-parent="#accordion-12-1" aria-expanded="false"
											aria-controls="accordion-12-1-body-07"> <span
											class="u-accordion__control-icon"> <i
												class="g-font-style-normal">질문 더보기 <span
													class="ml-2 fa fa-caret-down"></span>
											</i> <i class="g-font-style-normal">질문 닫기 <span
													class="ml-2 fa fa-caret-up"></span>
											</i>
										</span>
										</a>
									</h5>
								</div>
								<!-- End Card -->
							</div>
							<!-- End Accordion -->
						</div>
					</div>
					<!-- End Tab panes -->
				</div>
			</div>

			<div class="row"></div>
		</div>
		<!-- End Help -->

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
	<script src="/resources/static/assets/vendor/jquery.countdown.min.js"></script>
	<script
		src="/resources/static/assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>
	<script
		src="/resources/static/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
	<script
		src="/resources/static/assets/vendor/jquery.filer/js/jquery.filer.min.js"></script>

	<!-- JS Unify -->
	<script src="/resources/static/assets/js/hs.core.js"></script>
	<script src="/resources/static/assets/js/components/hs.header.js"></script>
	<script src="/resources/static/assets/js/helpers/hs.hamburgers.js"></script>
	<script src="/resources/static/assets/js/components/hs.dropdown.js"></script>
	<script src="/resources/static/assets/js/components/hs.scrollbar.js"></script>
	<script src="/resources/static/assets/js/components/hs.go-to.js"></script>
	<script src="/resources/static/assets/js/components/hs.tabs.js"></script>
	<script src="/resources/static/assets/js/helpers/hs.focus-state.js"></script>
	<script
		src="/resources/static/assets/js/components/hs.file-attachement.js"></script>
	<script
		src="/resources/static/assets/js/helpers/hs.file-attachments.js"></script>

	<!-- JS Customization -->
	<script src="/resources/static/user/assets/js/footer.js"></script>


	<!-- JS Plugins Init. -->
	<script>
		$(document).on('ready', function() {

			// initialization of header
			$.HSCore.components.HSHeader.init($('#js-header'));
			$.HSCore.helpers.HSHamburgers.init('.hamburger');

			// initialization of forms
			$.HSCore.components.HSFileAttachment.init('.js-file-attachment');
			$.HSCore.helpers.HSFocusState.init();

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

			// Tabs
			$.HSCore.components.HSTabs.init('[role="tablist"]');

			// input = file 저장주소
			$.HSCore.helpers.HSFileAttachments.init();
			$.HSCore.components.HSFileAttachment.init('.js-file-attachment');
			$.HSCore.helpers.HSFocusState.init();
		});

		$(window).on('resize', function() {
			setTimeout(function() {
				$.HSCore.components.HSTabs.init('[role="tablist"]');
			}, 200);
		});
	</script>
</body>
</html>