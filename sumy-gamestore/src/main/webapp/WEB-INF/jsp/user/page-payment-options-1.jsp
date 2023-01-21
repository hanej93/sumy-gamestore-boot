<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Title -->
<title>sumy gamestore - Payment information page</title>

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
<link rel="stylesheet" href="/resources/static/assets/vendor/icon-line-pro/style.css">
<link rel="stylesheet" href="/resources/static/assets/vendor/icon-hs/style.css">
<link rel="stylesheet" href="/resources/static/assets/vendor/animate.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/hamburgers/hamburgers.min.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/hs-megamenu/src/hs.megamenu.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.min.css">

<!-- CSS Unify Theme -->
<link rel="stylesheet" href="/resources/static/user/assets/css/styles.e-commerce.css">

<!-- CSS Customization -->
<link rel="stylesheet" href="/resources/static/assets/css/custom.css">
</head>

<body>
	<main>
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
						<h1 class="h3 mb-0">Your Credit and Debit Card Options</h1>
					</div>

					<div class="align-self-center ml-auto">
						<ul class="u-list-inline">
							<li class="list-inline-item g-mr-5"><a
								class="u-link-v5 g-color-text" href="#">Home</a> <i
								class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i></li>
							<li class="list-inline-item g-mr-5"><a
								class="u-link-v5 g-color-text" href="#">Pages</a> <i
								class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i></li>
							<li class="list-inline-item g-color-primary"><span>Payment
									Options</span></li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<!-- End Breadcrumbs -->

		<div class="container g-pt-70 g-pb-30">
			<div class="row">
				<!-- Profile Settings -->
				<div class="col-lg-3 g-mb-50">
					<aside
						class="g-brd-around g-brd-gray-light-v4 rounded g-px-20 g-py-30">
						<!-- Profile Picture -->
						<div class="text-center g-pos-rel g-mb-30">
							<div class="g-width-100 g-height-100 mx-auto mb-3">
								<img class="img-fluid rounded-circle"
									src="/resources/static/user/assets/img-temp/100x100/img1.jpg" alt="Image Decor">
							</div>

							<span class="d-block g-font-weight-500">James Collins</span> <span
								class="u-icon-v3 u-icon-size--xs g-color-white--hover g-bg-primary--hover rounded-circle g-pos-abs g-top-0 g-right-15 g-cursor-pointer"
								title="Change Profile Picture" data-toggle="tooltip"
								data-placement="top"> <i
								class="icon-finance-067 u-line-icon-pro"></i>
							</span>
						</div>
						<!-- End Profile Picture -->

						<hr class="g-brd-gray-light-v4 g-my-30">

						<!-- Profile Settings List -->
						<ul class="list-unstyled mb-0">
							<li class="g-pb-3"><a
								class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3"
								href="page-wallet-1.html"> <span
									class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i
										class="icon-finance-059 u-line-icon-pro"></i></span> Your Wallet
							</a></li>
							<li class="g-pb-3"><a
								class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3"
								href="page-orders-1.html"> <span
									class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i
										class="icon-finance-114 u-line-icon-pro"></i></span> Your Orders
							</a></li>
							<li class="g-py-3"><a
								class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3"
								href="page-open-orders-1.html"> <span
									class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i
										class="icon-finance-115 u-line-icon-pro"></i></span> Open Orders
							</a></li>
							<li class="g-py-3"><a
								class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3"
								href="page-cancelled-orders-1.html"> <span
									class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i
										class="icon-finance-113 u-line-icon-pro"></i></span> Cancelled Orders
							</a></li>
							<li class="g-py-3"><a
								class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3"
								href="page-wishlist-1.html"> <span
									class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i
										class="icon-medical-022 u-line-icon-pro"></i></span> Wishlist
							</a></li>
							<li class="g-py-3"><a
								class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3"
								href="page-addresses-1.html"> <span
									class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i
										class="icon-real-estate-027 u-line-icon-pro"></i></span> Addresses
							</a></li>
							<li class="g-py-3"><a
								class="d-block align-middle active u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover g-color-primary--parent-active g-bg-gray-light-v5--active rounded g-pa-3"
								href="page-payment-options-1.html"> <span
									class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i
										class="icon-finance-110 u-line-icon-pro"></i></span> Payment Options
							</a></li>
							<li class="g-py-3"><a
								class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3"
								href="page-login-security-1.html"> <span
									class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i
										class="icon-finance-135 u-line-icon-pro"></i></span> Login &amp;
									Security
							</a></li>
							<li class="g-pt-3"><a
								class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3"
								href="page-notifications-1.html"> <span
									class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i
										class="icon-education-033 u-line-icon-pro"></i></span> Notifications
							</a></li>
						</ul>
						<!-- End Profile Settings List -->
					</aside>
				</div>
				<!-- End Profile Settings -->

				<!-- Payment Options -->
				<div class="col-lg-9 g-mb-50">
					<div class="row justify-content-between">
						<div class="col-md-8 col-lg-6 g-mb-70 g-mb-0--md">
							<div class="mb-4">
								<h3 class="h5 mb-3">Payment Details</h3>
								<div
									class="d-flex justify-content-between align-items-center mb-3">
									<img class="g-width-40" src="/resources/static/user/assets/img-temp/50x35/img1.jpg"
										alt="Image Description"> <span class="g-font-size-13">****
										**** **** 5021</span>

									<div class="ml-auto">
										<!-- Delete -->
										<a
											class="u-icon-v1 u-icon-size--xs g-color-gray-dark-v5 g-color-primary--hover g-font-size-16 g-text-underline--none--hover"
											href="#" title="Delete" data-toggle="tooltip"
											data-placement="top"> <i
											class="icon-hotel-restaurant-214 u-line-icon-pro"></i>
										</a>
										<!-- End Delete -->
									</div>
								</div>
							</div>

							<!-- Payment Details -->
							<div
								class="g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v5 rounded g-pa-30">
								<form class="row justify-content-between g-mb-30">
									<!-- Payment Method -->
									<div class="col-6">
										<h4 class="h6 g-color-black g-font-weight-400 mb-3">Payment
											Method</h4>
										<img class="g-width-40" src="/resources/static/user/assets/img-temp/50x35/img1.jpg"
											alt="Image Description"> <span class="g-font-size-13">Ending
											in 5021</span>
									</div>
									<!-- End Payment Method -->

									<!-- Name on Card -->
									<div class="col-6">
										<h4 class="h6 g-color-black g-font-weight-400 mb-3">Name
											on Card</h4>
										<input
											class="form-control u-form-control g-brd-around g-brd-gray-light-v3 g-brd-primary--focus g-font-size-13 g-rounded-3"
											type="tel" placeholder="Payoneer">
									</div>
									<!-- End Name on Card -->
								</form>

								<!-- Card Number -->
								<div class="g-mb-30">
									<h4 class="h6 g-color-black g-font-weight-400 mb-3">Card
										Number</h4>
									<form>
										<input
											class="form-control u-form-control g-brd-around g-brd-gray-light-v3 g-brd-primary--focus g-font-size-13 g-rounded-3"
											type="tel" placeholder="1234 5678 9012 3456">
									</form>
								</div>
								<!-- End Card Number -->

								<form class="row justify-content-between g-mb-30">
									<!-- Expiration Date -->
									<div class="col-7 col-sm-5">
										<h4 class="h6 g-color-black g-font-weight-400 mb-3">Expiration
											Date</h4>
										<div class="row g-mx-minus-2">
											<div class="col g-px-2">
												<input
													class="form-control u-form-control g-brd-around g-brd-gray-light-v3 g-brd-primary--focus g-font-size-13 g-rounded-3 g-rounded-right-0 g-pr-10"
													type="tel" placeholder="MM">
											</div>
											<div class="col g-px-2">
												<input
													class="form-control u-form-control g-brd-around g-brd-gray-light-v3 g-brd-primary--focus g-font-size-13 g-rounded-3 g-pr-10"
													type="tel" placeholder="YYYY">
											</div>
										</div>
									</div>
									<!-- End Expiration Date -->

									<!-- Security Code -->
									<div class="col-5 col-sm-4">
										<h4 class="h6 g-color-black g-font-weight-400 mb-3">Security
											Code</h4>
										<div class="input-group g-pos-rel">
											<input
												class="form-control u-form-control g-brd-around g-brd-gray-light-v3 g-brd-primary--focus g-font-size-13 g-rounded-3 g-rounded-left-0 g-pr-40 g-ml-minus-1"
												type="tel" placeholder="123">
											<div
												class="g-brd-gray-light-v3 g-absolute-centered--y g-right-5 g-z-index-3 p-0">
												<img class="g-width-30" src="/resources/static/user/assets/img-temp/50x25/img1.jpg"
													alt="Image Description">
											</div>
										</div>
									</div>
									<!-- End Security Code -->
								</form>

								<button
									class="btn u-btn-primary g-font-size-12 text-uppercase g-py-12 g-px-25"
									type="submit">Update</button>
							</div>
							<!-- End Payment Details -->
						</div>

						<div class="col-md-4 col-lg-6">
							<div class="g-mb-25">
								<h3 class="h5 mb-3">Add a New Payment Method</h3>
								<p>Unify accepts all major credit and debit cards.</p>
							</div>

							<!-- Accordion -->
							<div id="accordion-12"
								class="u-accordion u-accordion-color-primary" role="tablist"
								aria-multiselectable="true">
								<!-- Card -->
								<div class="card g-brd-none rounded-0 g-mb-15">
									<div id="accordion-12-heading-01"
										class="u-accordion__header g-pa-0" role="tab">
										<h5 class="mb-0">
											<a
												class="d-block g-font-size-13 g-text-underline--none--hover p-0"
												href="#accordion-12-body-01" data-toggle="collapse"
												data-parent="#accordion-12" aria-expanded="false"
												aria-controls="accordion-12-body-01"> <span
												class="u-accordion__control-icon g-mr-10"> <i
													class="fa fa-caret-down"></i> <i class="fa fa-caret-up"></i>
											</span> Add a Card
											</a>
										</h5>
									</div>
									<div id="accordion-12-body-01" class="collapse" role="tabpanel"
										aria-labelledby="accordion-12-heading-01">
										<div
											class="u-accordion__body g-color-gray-dark-v5 g-pl-20 g-pr-0 g-pt-2 g-pb-0">
											<p class="g-font-size-13">Enter your card information:</p>

											<div class="row g-mx-minus-5 mb-3">
												<!-- Card Name -->
												<div class="col-3 col-md-12 col-lg-3 g-px-5 g-mb-20">
													<h4 class="h6 g-color-black g-font-weight-400 mb-3">Card
														Name</h4>
													<div class="input-group g-pos-rel">
														<input
															class="form-control u-form-control g-brd-around g-brd-gray-light-v3 g-brd-primary--focus g-font-size-13 g-rounded-3 g-rounded-left-0 g-pr-40 g-ml-minus-1"
															type="tel">
													</div>
												</div>
												<!-- End Card Name -->

												<!-- Card Number -->
												<div class="col-4 col-md-12 col-lg-4 g-px-5 g-mb-20">
													<h4 class="h6 g-color-black g-font-weight-400 mb-3">Card
														Number</h4>
													<div class="input-group g-pos-rel">
														<input
															class="form-control u-form-control g-brd-around g-brd-gray-light-v3 g-brd-primary--focus g-font-size-13 g-rounded-3 g-rounded-left-0 g-pr-40 g-ml-minus-1"
															type="tel">
													</div>
												</div>
												<!-- End Card Number -->

												<!-- Expiration Date -->
												<div class="col-5 col-md-12 col-lg-5 g-px-5 g-mb-20">
													<h4 class="h6 g-color-black g-font-weight-400 mb-3">Expiration
														Date</h4>
													<div class="row g-mx-minus-2">
														<div class="col g-px-2">
															<input
																class="form-control u-form-control g-brd-around g-brd-gray-light-v3 g-brd-primary--focus g-font-size-13 g-rounded-3 g-rounded-right-0"
																type="tel" placeholder="MM">
														</div>
														<div class="col g-px-2">
															<input
																class="form-control u-form-control g-brd-around g-brd-gray-light-v3 g-brd-primary--focus g-font-size-13 g-rounded-3"
																type="tel" placeholder="YYYY">
														</div>
													</div>
												</div>
												<!-- End Expiration Date -->
											</div>
										</div>

										<div class="g-pl-20">
											<button
												class="btn u-btn-primary g-font-size-13 rounded g-px-18 g-py-10"
												type="submit">Add Card</button>
										</div>
									</div>
								</div>
								<!-- End Card -->
							</div>
							<!-- End Accordion -->
						</div>
					</div>
				</div>
				<!-- End Payment Options -->
			</div>
		</div>

		<!-- Call to Action -->
		<div class="g-bg-primary">
			<div class="container g-py-20">
				<div class="row justify-content-center">
					<div class="col-md-4 mx-auto g-py-20">
						<!-- Media -->
						<div class="media g-px-50--lg">
							<i
								class="d-flex g-color-white g-font-size-40 g-pos-rel g-top-3 mr-4 icon-real-estate-048 u-line-icon-pro"></i>
							<div class="media-body">
								<span
									class="d-block g-color-white g-font-weight-500 g-font-size-17 text-uppercase">Free
									Shipping</span> <span class="d-block g-color-white-opacity-0_8">In
									2-3 Days</span>
							</div>
						</div>
						<!-- End Media -->
					</div>

					<div
						class="col-md-4 mx-auto g-brd-x--md g-brd-white-opacity-0_3 g-py-20">
						<!-- Media -->
						<div class="media g-px-50--lg">
							<i
								class="d-flex g-color-white g-font-size-40 g-pos-rel g-top-3 mr-4 icon-real-estate-040 u-line-icon-pro"></i>
							<div class="media-body">
								<span
									class="d-block g-color-white g-font-weight-500 g-font-size-17 text-uppercase">Free
									Returns</span> <span class="d-block g-color-white-opacity-0_8">No
									Questions Asked</span>
							</div>
						</div>
						<!-- End Media -->
					</div>

					<div class="col-md-4 mx-auto g-py-20">
						<!-- Media -->
						<div class="media g-px-50--lg">
							<i
								class="d-flex g-color-white g-font-size-40 g-pos-rel g-top-3 mr-4 icon-hotel-restaurant-062 u-line-icon-pro"></i>
							<div class="media-body text-left">
								<span
									class="d-block g-color-white g-font-weight-500 g-font-size-17 text-uppercase">Free
									24</span> <span class="d-block g-color-white-opacity-0_8">Days
									Storage</span>
							</div>
						</div>
						<!-- End Media -->
					</div>
				</div>
			</div>
		</div>
		<!-- End Call to Action -->

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
	<script src="/resources/static/assets/vendor/jquery-migrate/jquery-migrate.min.js"></script>
	<script src="/resources/static/assets/vendor/popper.js/popper.min.js"></script>
	<script src="/resources/static/assets/vendor/bootstrap/bootstrap.min.js"></script>

	<!-- JS Implementing Plugins -->
	<script src="/resources/static/assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>
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
	<script src="/resources/static/assets/js/custom.js"></script>
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