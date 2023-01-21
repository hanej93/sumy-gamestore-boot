<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- Title -->
<title>sumy gamestore - news detail page</title>

<!--favicon  -->
<link rel="shortcut icon" type="image/x-icon" href="/resources/static/user/assets/img/logo/logo-yy (1).ico" />

<!-- Required Meta Tags Always Come First -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">

<!-- Google Fonts -->
<link rel="stylesheet"
	href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700,900">

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
<link rel="stylesheet"
	href="/resources/static/assets/vendor/dzsparallaxer/dzsparallaxer.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/dzsparallaxer/dzsscroller/scroller.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/dzsparallaxer/advancedscroller/plugin.css">
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
						<h1 class="h3 mb-0">뉴스 상세보기</h1>
					</div>

					<div class="align-self-center ml-auto">
						<ul class="u-list-inline">
							<li class="list-inline-item g-mr-5"><a
								class="u-link-v5 g-color-text" href="page-our-stores-1.html">뉴스</a>
								<i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i></li>
							<li class="list-inline-item g-color-primary"><span>뉴스
									상세보기</span></li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- Content -->
		<div class="container g-py-100">
			<div class="row">
				<div class="g-brd-around g-brd-gray-light-v4 rounded g-mb-30">

					<header class="g-bg-gray-light-v5 g-pa-20">
						<div class="row">
							<div class="col-sm-3 col-md-4 ml-auto text-sm-right">
								<h4
									class="g-color-gray-dark-v4 g-font-weight-400 g-font-size-12 text-uppercase g-mb-2">
									뉴스 ID : <span>${news.newsId }</span>
								</h4>
							</div>
						</div>
					</header>
					<div class="g-pa-20">
						<!-- News Info -->
						<div class="col g-mb-30">
							<h2 class="h4 mb-3 mt-3">${news.newsTitle }</h2>
							<span class="g-color-text mr-10">작성일 : <span>
							<fmt:parseDate value="${news.newsWriteDate }" var="dateFmt" pattern="yyyy-MM-dd'T'HH:mm"/>
		  					<fmt:formatDate value="${dateFmt}"  pattern="yyyy.MM.dd  HH:mm"/></span></span> 
							
							<fmt:parseDate value="${news.newsUpdateDate }" var="dateFmt" pattern="yyyy-MM-dd'T'HH:mm"/>
		  					<fmt:formatDate value="${dateFmt}"  pattern="yyyy.MM.dd  HH:mm"/></span></span>
							<div class="row">
								<div class="col-lg-12 g-mt-30 g-mb-30">
									<h3 class="h5 g-color-gray-dark-v3">${news.newsSubTitle }</h3>
								</div>
							</div>
							<div class="order-md-2 g-mb-30">
								<img class="img-fluid w-100"
									src="${news.newsThumbImage }" alt="Image Description">
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12 g-mt-30 g-mb-30">
								<h3 class="h6 g-color-gray-dark-v3">
									${news.newsText }
								</h3>
							</div>
						</div>
						<!-- End News Info -->
					</div>
				</div>

			</div>
			<!-- Pagination -->
			<nav class="g-mt-20 g-mb-40" aria-label="Page Navigation">
				<div class="text-center">
					<ul class="list-inline mb-0">
						<!-- <li class="list-inline-item"><a
							class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-mr-15"
							href="#" aria-label="Next"> <span aria-hidden="true">
									<i class="fa fa-angle-left"></i>
							</span> <span class="sr-only">Before</span>
						</a></li> -->
						<li class="list-inline-item hidden-down"><a
							href="/sumy/news/list" class="g-color-black">목록보기</a></li>
						<!-- <li class="list-inline-item"><a
							class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-ml-15"
							href="#" aria-label="Next"> <span aria-hidden="true">
									<i class="fa fa-angle-right"></i>
							</span> <span class="sr-only">Next</span>
						</a></li> -->
					</ul>
				</div>
			</nav>
			<!-- End Pagination -->
		</div>

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
	<script src="/resources/static/assets/vendor/dzsparallaxer/dzsparallaxer.js"></script>
	<script src="/resources/static/assets/vendor/dzsparallaxer/dzsscroller/scroller.js"></script>
	<script src="/resources/static/assets/vendor/dzsparallaxer/advancedscroller/plugin.js"></script>
	<script
		src="/resources/static/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="/resources/static/assets/vendor/jquery.countdown.min.js"></script>

	<!-- JS Unify -->
	<script src="/resources/static/assets/js/hs.core.js"></script>
	<script src="/resources/static/assets/js/components/hs.header.js"></script>
	<script src="/resources/static/assets/js/helpers/hs.hamburgers.js"></script>
	<script src="/resources/static/assets/js/components/hs.dropdown.js"></script>
	<script src="/resources/static/assets/js/components/hs.scrollbar.js"></script>
	<script src="/resources/static/assets/js/components/hs.go-to.js"></script>
	<script src="/resources/static/assets/js/components/hs.countdown.js"></script>
	
	<!-- JS Customization -->
	<script src="/resources/static/user/assets/js/footer.js"></script>


	<!-- JS Plugins Init. -->
	<script>
    $(document).on('ready', function () {
      // initialization of header
      $.HSCore.components.HSHeader.init($('#js-header'));
      $.HSCore.helpers.HSHamburgers.init('.hamburger');

      // initialization of HSMegaMenu component
      $('.js-mega-menu').HSMegaMenu({
        event: 'hover',
        pageContainer: $('.container'),
        breakpoint: 991
      });

      // initialization of HSDropdown component
      $.HSCore.components.HSDropdown.init($('[data-dropdown-target]'), {
        afterOpen: function () {
          $(this).find('input[type="search"]').focus();
        }
      });

      // initialization of HSScrollBar component
      $.HSCore.components.HSScrollBar.init($('.js-scrollbar'));

      // initialization of go to
      $.HSCore.components.HSGoTo.init('.js-go-to');

      // initialization of countdowns
      var countdowns = $.HSCore.components.HSCountdown.init('.js-countdown', {
        yearsElSelector: '.js-cd-years',
        monthElSelector: '.js-cd-month',
        daysElSelector: '.js-cd-days',
        hoursElSelector: '.js-cd-hours',
        minutesElSelector: '.js-cd-minutes',
        secondsElSelector: '.js-cd-seconds'
      });
    });
  </script>
</body>
</html>