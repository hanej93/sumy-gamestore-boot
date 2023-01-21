<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<html>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<head>
<!-- Required Meta Tags Always Come First -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<!-- CSS Global Compulsory -->
<link rel="stylesheet"
	href="/resources/static/assets/vendor/bootstrap/bootstrap.min.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet"
	href="/resources/static/assets/vendor/icon-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/animate.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.min.css">

<!-- CSS Unify Theme -->
<link rel="stylesheet"
	href="/resources/static/user/assets/css/styles.e-commerce.css">
</head>
<body>
	<!-- Header -->
	<header id="js-header"
		class="u-header u-header--sticky-top u-header--toggle-section u-header--change-appearance"
		data-header-fix-moment="300">
		<!-- Top Bar -->
		<div
			class="u-header__section u-header__section--hidden u-header__section--dark g-bg-black g-transition-0_3 g-py-10">
			<div class="g-mx-30">
				<div
					class="row flex-lg-row flex-column justify-content-between align-items-center text-uppercase g-font-weight-100 g-color-white g-font-size-16 g-mx-0--lg">
					<div class="col-auto">
						<li class="list-inline-item g-mx-30"><a href="/">
								<img src="/resources/static/user/assets/img/logo/logo-y.png"
								alt="logo.png" height="60px">
						</a></li>
						<li class="list-inline-item g-mx-15"><a
							class="g-color-white g-color-primary--hover g-text-underline--none--hover"
							href="/catalogue"> 전체 </a></li>
						<li class="list-inline-item g-mx-15"><a
							class="g-color-white g-color-primary--hover g-text-underline--none--hover"
							href="/sumy/news/list"> NEWS </a></li>
						<li class="list-inline-item g-mx-15"><a
							class="g-color-white g-color-primary--hover g-text-underline--none--hover"
							href="/qna"> FAQ </a></li>
							<c:if test="${principal.user.userAuthorityRate eq 'ROLE_ADMIN' }">
								<li class="list-inline-item g-mx-15"><a
								class="g-color-white g-color-primary--hover g-text-underline--none--hover"
								href="/admin/game/list"> 관리자 화면 </a></li>
							</c:if>
					</div>

				<div class="g-mx-30">
					<div class="col-auto">
						<!-- Search -->
						<div
							class="d-inline-block g-valign-middle g-pos-rel g-top-minus-1 g-mr-15">
							<a href="#"
								class="g-font-size-18 g-color-white g-color-primary--hover"
								aria-haspopup="true" aria-expanded="false"
								aria-controls="searchform-1"
								data-dropdown-target="#searchform-1"
								data-dropdown-type="css-animation" data-dropdown-duration="300"
								data-dropdown-animation-in="fadeInUp"
								data-dropdown-animation-out="fadeOutDown"> <i
								class="fa fa-search"></i>
							</a>

							<!-- Search Form -->
							<form id="searchform-1" action="/catalogue"
								class="u-searchform-v1 u-dropdown--css-animation u-dropdown--hidden g-bg-black g-pa-10 g-mt-10 g-box-shadow-none">
								<div class="input-group g-brd-primary--focus">
									<input name="keyword"
										class="form-control rounded-0 u-form-control g-brd-gray-light-v3"
										type="search" placeholder="게임 제목 검색">

									<div class="input-group-addon p-0">
										<button
											class="btn rounded-0 btn-primary btn-md g-font-size-14 g-px-18"
											type="submit">검색</button>
									</div>
								</div>
							</form>
							<!-- End Search Form -->
						</div>
						<!-- End Search -->
						<c:if test="${principal != null}">
							<!-- Basket -->
							<div class="u-basket d-inline-block g-valign-middle g-pt-2">
								<!-- <a href="/user/wishlist" id="basket-bar-invoker"
									class="u-icon-v1 g-color-white g-text-underline--none--hover g-width-20 g-height-20 g-mr-40"
									aria-controls="basket-bar" aria-haspopup="true"
									aria-expanded="false" data-dropdown-event="hover"
									data-dropdown-target="#basket-bar"
									data-dropdown-type="css-animation" data-dropdown-duration="300"
									data-dropdown-hide-on-scroll="false"
									data-dropdown-animation-in="fadeIn"
									data-dropdown-animation-out="fadeOut"> <span
									class="u-badge-v1--sm g-color-white g-bg-primary g-rounded-50x">3</span>
									<i class="fa fa-shopping-cart"></i>
								</a> -->
								
								<a href="/user/wishlist" id="basket-bar-invoker"
									class="u-icon-v1 g-color-white g-text-underline--none--hover g-width-20 g-height-20 g-mr-40">
									<i class="fa fa-shopping-cart"></i>
								</a>

								<div id="basket-bar"
									class="u-basket__bar u-dropdown--css-animation u-dropdown--hidden g-text-transform-none g-bg-black g-brd-top g-brd-2 g-brd-primary g-color-main g-mt-13"
									aria-labelledby="basket-bar-invoker">
									<div id="product-container" class="js-scrollbar g-height-280">
										<!-- Product -->
										<div class="u-basket__product g-brd-white-opacity-0_3">
											<div class="row align-items-center no-gutters">
												<div class="col-4 g-pr-20">
													<a href="#" class="u-basket__product-img"> <img
														src="/resources/static/user/assets/img-temp/150x150/img1.jpg"
														alt="Image Description">
													</a>
												</div>

												<div class="col-8">
													<h6 class="g-font-weight-600 g-mb-0">
														<a href="#"
															class="g-color-white g-color-white--hover g-text-underline--none--hover">Black
															Glasses</a>
													</h6>
													<small class="g-color-gray-dark-v5 g-font-size-14">$400.00</small>
												</div>
											</div>

											<button class="u-basket__product-remove" type="button">&times;</button>
										</div>
										<!-- End Product -->

										<!-- Product -->
										<div class="u-basket__product g-brd-white-opacity-0_3">
											<div class="row align-items-center no-gutters">
												<div class="col-4 g-pr-20">
													<a href="#" class="u-basket__product-img"> <img
														src="/resources/static/user/assets/img-temp/150x150/img2.jpg"
														alt="Image Description">
													</a>
												</div>

												<div class="col-8">
													<h6 class="g-font-weight-600 g-mb-0">
														<a href="#"
															class="g-color-white g-color-white--hover g-text-underline--none--hover">Black
															Glasses</a>
													</h6>
													<small class="g-color-gray-dark-v5 g-font-size-14">$400.00</small>
												</div>
											</div>

											<button class="u-basket__product-remove" type="button">&times;</button>
										</div>
										<!-- End Product -->

										<!-- Product -->
										<div class="u-basket__product g-brd-white-opacity-0_3">
											<div class="row align-items-center no-gutters">
												<div class="col-4 g-pr-20">
													<a href="#" class="u-basket__product-img"> <img
														src="/resources/static/user/assets/img-temp/150x150/img3.jpg"
														alt="Image Description">
													</a>
												</div>

												<div class="col-8">
													<h6 class="g-font-weight-600 g-mb-0">
														<a href="#"
															class="g-color-white g-color-white--hover g-text-underline--none--hover">Black
															Glasses</a>
													</h6>
													<small class="g-color-gray-dark-v5 g-font-size-14">$400.00</small>
												</div>
											</div>

											<button class="u-basket__product-remove" type="button">&times;</button>
										</div>
										<!-- End Product -->

										<!-- Product -->
										<div class="u-basket__product g-brd-white-opacity-0_3">
											<div class="row align-items-center no-gutters">
												<div class="col-4 g-pr-20">
													<a href="#" class="u-basket__product-img"> <img
														src="/resources/static/user/assets/img-temp/150x150/img4.jpg"
														alt="Image Description">
													</a>
												</div>

												<div class="col-8">
													<h6 class="g-font-weight-600 g-mb-0">
														<a href="#"
															class="g-color-white g-color-white--hover g-text-underline--none--hover">Black
															Glasses</a>
													</h6>
													<small class="g-color-gray-dark-v5 g-font-size-14">$400.00</small>
												</div>
											</div>

											<button class="u-basket__product-remove" type="button">&times;</button>
										</div>
										<!-- End Product -->
									</div>

									<div class="g-brd-top g-brd-white-opacity-0_3 g-pa-15 g-pb-20">
										<!-- <a href="/user/wishlist"
											class="btn u-btn-outline-primary rounded-0 g-width-120">위시리스트</a> -->
										<a href="/user/wishlist"
											class="btn btn-block u-btn-primary rounded-0 g-py-10">위시리스트
											가기</a>
									</div>

								</div>

							</div>
							<!-- End Basket -->
						</c:if>

						<c:if test="${principal == null}">
							<li class="list-inline-item g-mx-15"><a
								class="g-color-white g-color-primary--hover g-text-underline--none--hover"
								href="/sumy/login">Login</a></li>
						</c:if>
						<c:if test="${principal != null}">
							<li class="list-inline-item g-mx-15"><a
								class="g-color-white g-color-primary--hover g-text-underline--none--hover"
								href="/logout">Logout</a></li>
							<li class="list-inline-item g-mx-15"><a
								class="g-color-white g-color-primary--hover g-text-underline--none--hover"
								href="/user/login-security">Mypage</a></li>
						</c:if>
					</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Top Bar -->
	</header>
	<!-- End Header -->
</body>
</html>