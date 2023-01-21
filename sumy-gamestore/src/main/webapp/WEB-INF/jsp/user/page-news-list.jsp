<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<!-- Title -->
<title>sumy gamestore - news list page</title>

<!--favicon  -->
<link rel="shortcut icon" type="image/x-icon" href="/resources/static/user/assets/img/logo/logo-yy (1).ico" />

<!-- Required Meta Tags Always Come First -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<!-- Favicon -->
<!-- <link rel="shortcut icon" href="favicon.ico"> -->

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
						<h1 class="h3 mb-0">뉴스</h1>
					</div>
				</div>
			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- Content -->
		<div class="container g-py-100">
			<div>
				<c:forEach items="${viewAll }" var="newsList">
					<div class="g-brd-around g-brd-gray-light-v4 rounded g-mb-30"
						style="cursor: pointer;"
						onclick="location.href='/sumy/news/${newsList.newsId}';">
	
						<header class="g-bg-gray-light-v5 g-pa-20">
							<div class="row">
								<div class="col-sm-3 col-md-4 ml-auto text-sm-right">
									<h4
										class="g-color-gray-dark-v4 g-font-weight-400 g-font-size-12 text-uppercase g-mb-2">
										뉴스 ID : <span>${newsList.newsId }</span>
									</h4>
								</div>
							</div>
						</header>
						<div class="g-pa-20">
							<!-- News Info -->
							<h2 class="h4 mb-3 mt-3">${newsList.newsTitle }</h2>
	
							<div class="row">
								<div class="col-lg-9 g-mb-30">
									<h3 class="h6 g-color-gray-dark-v3">${newsList.newsSubTitle}</h3>
									<div class="col-lg-8 g-mb-150"></div>
	
									<div class="col g-mb-30">
										<span class="d-block g-color-text mb-2">작성일 : 
											<span>
												<fmt:parseDate value="${newsList.newsWriteDate }" var="dateFmt" pattern="yyyy-MM-dd'T'HH:mm"/>
		      				  					<fmt:formatDate value="${dateFmt}"  pattern="yyyy.MM.dd  HH:mm"/>
	      				 					</span>
										</span>
										<c:if test="${not empty newsList.newsUpdateDate }">
										<span class="d-block g-color-text mb-4">수정일 :
											<span>
												<fmt:parseDate value="${newsList.newsUpdateDate }" var="dateFmt" pattern="yyyy-MM-dd'T'HH:mm"/>
		      				  					<fmt:formatDate value="${dateFmt}"  pattern="yyyy.MM.dd  HH:mm"/>
											</span>
										</span>
										</c:if>
									</div>
	
								</div>
								<div class="col g-mb-30">
									<img class="img-fluid" src="${newsList.newsThumbImage }"
										alt="Image Description" width="200px">
								</div>
							</div>
							<!-- End News Info -->
						</div>
					</div>
				</c:forEach>
				
			</div>
			<!-- Pagination -->
			<nav class="g-mt-20 g-mb-40" aria-label="Page Navigation">
				<ul class="list-inline mb-0">
					<c:if test="${paging.startPage != 1 }">
						<li class="list-inline-item"><a
							class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-mr-15"
							href="/sumy/news/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}&keywordOpt=${paging.keywordOpt}" aria-label="Next"> <span aria-hidden="true"> <i
									class="fa fa-angle-left"></i>
							</span> <span class="sr-only">Before</span>
						</a></li>
					</c:if>
					
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">  
		              <c:choose>
		                	<c:when test="${p != paging.nowPage }">
						               <li class="list-inline-item hidden-down"><a
								class="u-pagination-v1__item g-width-30 g-height-30 g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5"
								href="/sumy/news/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}&keywordOpt=${paging.keywordOpt}">${p }</a></li>
			                </c:when>
			                <c:when test="${p == paging.nowPage }">
						                <li class="list-inline-item hidden-down"><a
								class="active u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--active g-color-white g-bg-primary--active g-font-size-12 rounded-circle g-pa-5"
								href="#">${p }</a></li>
			                </c:when>
		                </c:choose>
	                </c:forEach>
	                
	                <c:if test="${paging.endPage != paging.lastPage}">
						<li class="list-inline-item"><a
							class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-ml-15"
							href="/sumy/news/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}&keywordOpt=${paging.keywordOpt}" aria-label="Next"> <span aria-hidden="true"> <i
									class="fa fa-angle-right"></i>
							</span> <span class="sr-only">Next</span>
						</a></li>
					</c:if>
					<li class="list-inline-item float-right"><span
						class="u-pagination-v1__item-info g-color-gray-dark-v4 g-font-size-12 g-pa-5">Page
							${paging.nowPage } of ${paging.lastPage }</span></li>
				</ul>
			</nav>
			<!-- End Pagination -->
			<div class="g-mb-20 g-mt-20 g-mb-0--md">
				<div class="col-md-2 g-mb-30">
					<select id="keywordOpt-select" class="form-control rounded g-py-12">
						<option <c:if test="${paging.keywordOpt == 'titleContent'}">selected</c:if> value="titleContent">제목+내용</option>
						<option <c:if test="${paging.keywordOpt == 'title'}">selected</c:if> value="title" >제목</option>
						<option <c:if test="${paging.keywordOpt == 'content'}">selected</c:if> value="content" >내용</option>
					</select>
				</div>
				<div class="col-md-7 g-mb-30">

					<!-- Search Form -->
					<form class="input-group">
						<input id = "news-search" value="${paging.keyword }"
							class="g-pos-rel d-inline-block g-brd-around g-brd-gray-light-v3 g-brd-primary--focus g-font-size-13 g-rounded-left-5 g-pl-35 g-pa-0"
							type="search" placeholder="검색"> <span
							class="g-pos-abs g-top-0 g-left-0 g-z-index-3 g-px-13 g-py-10">
							<i
							class="g-color-gray-dark-v4 g-font-size-12 icon-education-045 u-line-icon-pro"></i>
						</span>
						<div class="input-group-append g-brd-none g-py-0">
							<button id="news-search-btn"
								class="btn u-btn-black g-font-size-12 text-uppercase g-py-12 g-px-25"
								type="button">뉴스 조회</button>
						</div>
					</form>
					<!-- End Search Form -->
				</div>
			</div>
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
  <script src="/resources/static/user/assets/js/page-news-list.js"></script>
</body>
</html>