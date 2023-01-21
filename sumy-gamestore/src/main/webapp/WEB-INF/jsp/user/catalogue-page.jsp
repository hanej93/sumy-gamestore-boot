<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<!-- Title -->
<title>sumy gamestore - catalogue page</title>

<!-- Required Meta Tags Always Come First -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<!-- CSS Global Compulsory -->
<link rel="stylesheet"
	href="/resources/static/assets/vendor/bootstrap/bootstrap.min.css">

<!-- Favicon -->
<link rel="shortcut icon" href="/resources/static/favicon.ico">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/icon-hs/style.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet"
	href="/resources/static/assets/vendor/icon-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/static/assets/vendor/icon-line-pro/style.css">
<!-- <link rel="stylesheet" href="/resources/static/assets/vendor/icon-hs/style.css"> -->
<link rel="stylesheet"
	href="/resources/static/assets/vendor/dzsparallaxer/dzsparallaxer.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/dzsparallaxer/dzsscroller/scroller.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/dzsparallaxer/advancedscroller/plugin.css">
<link rel="stylesheet" href="/resources/static/assets/vendor/animate.css">
<!-- <link rel="stylesheet" href="/resources/static/assets/vendor/hamburgers/hamburgers.min.css"> -->
<link rel="stylesheet"
	href="/resources/static/assets/vendor/hs-megamenu/src/hs.megamenu.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.min.css">

<!-- CSS Unify Theme -->
<link rel="stylesheet" href="/resources/static/user/assets/css/styles.e-commerce.css">
</head>

<body>
	<main class="g-pt-80">
		<!-- Header -->
		<jsp:include page="layout/header.jsp"/>
		<!-- End Header -->

		<!-- Promo Block -->
		<section
			class="dzsparallaxer auto-init height-is-based-on-content use-loading mode-scroll loaded dzsprx-readyall"
			data-options='{direction: "fromtop", animation_duration: 25, direction: "reverse"}'>
			<div
				class="divimage dzsparallaxer--target w-100 g-bg-pos-top-center g-bg-cover g-bg-black-opacity-0_7--after"
				style="height: 140%; background-image: url(/resources/static/user/assets/img/banner/egs-amongus.jpg);"></div>

			<div class="container g-color-white g-pt-100 g-pb-40 opacity-75">
				<div class="g-mb-50">
					<span
						class="d-block g-color-white-opacity-0_8 g-font-weight-300 g-font-size-20">당신을
						위한 게임</span>
					<h3
						class="g-color-white g-font-size-50 g-font-size-90--md g-line-height-1_2 mb-0">Sumy
						Game Shop</h3>
					<p
						class="g-color-white g-font-weight-600 g-font-size-20 text-uppercase">Year
						2021</p>
				</div>

			</div>
		</section>
		<!-- End Promo Block -->

		<!-- Products -->
		<div class="container">
			<div class="row">
				<!-- Content -->
				<div class="col-md-9">
					<div class="g-pr-15--lg">
						<!-- Filters -->
						<div
							class="d-flex justify-content-between align-items-center g-brd-bottom g-brd-gray-light-v4 g-pt-40 g-pb-20">
								<span>
									<c:if test="${not empty paging.keyword}">
										검색한 결과 : ${paging.keyword }
									</c:if>
								</span>
							<!-- Sort By -->
							<div>
								<h2
									class="h6 align-middle d-inline-block g-font-weight-400 text-uppercase g-pos-rel g-top-1 mb-0">정렬
									:</h2>

								<!-- Secondary Button -->
								<div class="d-inline-block ml-2">
									<select id="orderOpt" 
									class="form-control rounded g-py-12">
										<option <c:if test="${paging.orderOpt == ''}">selected</c:if> value="">최신등록순</option>
										<option <c:if test="${paging.orderOpt == 'hit'}">selected</c:if> value="hit">인기순</option>
										<option <c:if test="${paging.orderOpt == 'star'}">selected</c:if> value="star">별점순</option>
										<option <c:if test="${paging.orderOpt == 'dictionary'}">selected</c:if> value="dictionary">가나다순</option>
										<option <c:if test="${paging.orderOpt == 'priceAsc'}">selected</c:if> value="priceAsc">가격오름차순</option>
										<option <c:if test="${paging.orderOpt == 'priceDesc'}">selected</c:if> value="priceDesc">가격내림차순</option>
										<option <c:if test="${paging.orderOpt == 'discount'}">selected</c:if> value="discount">할인율높은순</option>
									</select>
								</div>
								<!-- End Secondary Button -->
							</div>
							<!-- End Sort By -->
						</div>
						<!-- End Filters -->

						<!-- Products -->
						<div class="row g-pt-30 g-mb-50 justify-content-center d-flex align-items-center">
							<c:if test="${empty viewAll}">
								<div class="col-8 col-lg-6 g-mb-30 g-height-600 align-middle justify-content-center d-flex align-items-center">
									<h5>검색조건에 해당하는 게임이 없습니다</h5>
								</div>
							</c:if>
							<c:forEach items="${viewAll}" var="gameInfo">
								<div class="col-6 col-lg-4 g-mb-30">
									<!-- Product -->
									<figure class="g-pos-rel g-mb-30 g-height-300">
										<img class="img-fluid" src="${gameInfo.gameThumbImage }" style="min-height: 320px; height: 320px;"
											alt="Image Description">
										<c:if test="${gameInfo.gameDiscountRate > 0}">
										<span
											class="u-ribbon-v1 g-width-40 g-height-40 g-color-white g-bg-primary g-font-size-13 text-center text-uppercase g-rounded-50x g-top-10 g-right-minus-10 g-px-2 g-py-10">-${gameInfo.gameDiscountRate }%</span>
										</c:if>
										
										<a class="u-link-v2" href="/sumy/single-product/${gameInfo.gameId }"></a>
									</figure>
		
									<div class="media">
										<!-- Product Info -->
										<div class="d-flex flex-column">
											<h4 class="h6 g-color-black mb-1">
												<a class="u-link-v5 g-color-black g-color-primary--hover"
													href="page-single-product-1.html"> ${gameInfo.gameTitle } </a>
											</h4>
											<span
												class="d-inline-block g-color-gray-dark-v5 g-font-size-13">${gameInfo.gameDev }</span>
											
											
											<span class="g-color-black g-font-size-17"> 
												<c:if test="${ gameInfo.gameDiscountRate ne '0'}">
													<del
															class="g-font-size-12 g-color-gray-dark-v5">&#8361;<fmt:formatNumber value="${gameInfo.gamePrice}" type="number"/></del>
												</c:if>
													&#8361;<fmt:formatNumber value="${gameInfo.gamePrice * (100-gameInfo.gameDiscountRate) / 100}" type="number" pattern="###,###,###,###,###,###"/>
											</span>
											
											
										</div>
										<!-- End Product Info -->
		
										<!-- 위시리스트 아이콘 -->
										<%-- 
										<!-- Products Icons -->
										<ul class="list-inline media-body text-right">
											<li class="list-inline-item align-middle mx-0"><a id="wishlistBtn${gameInfo.gameId }" gameId="${gameInfo.gameId }"
												class="u-icon-v1 u-icon-size--sm g-color-gray-dark-v5 g-color-primary--hover g-font-size-15 rounded-circle"
												href="#" data-toggle="tooltip"
												data-placement="top" title="위시리스트 담기"> <i
													class="icon-finance-100 u-line-icon-pro"></i>
											</a></li>
										</ul>
										<!-- End Products Icons -->
										 --%>
										
									</div>
									<!-- End Product -->
								</div>
							</c:forEach>
						</div>
						<!-- End Products -->

						<hr class="g-mb-60">

						<!-- Pagination -->
						<nav class="g-mb-100" aria-label="Page Navigation">
							<ul class="list-inline mb-0">
								
								<c:if test="${paging.startPage != 1 }">
									<li class="list-inline-item"><a
										class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-mr-15"
										href="/catalogue?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}
										&orderOpt=${paging.orderOpt}&lowPriceFilter=${paging.lowPriceFilter}&highPriceFilter=${paging.highPriceFilter}&starFilter=${paging.starFilter}&discountFilter=${paging.discountFilter}
										<c:forEach items="${paging.categoryListFilter }" var="categoryFilter">
											&categoryListFilter=${categoryFilter }
										</c:forEach>
											" aria-label="Next"> <span aria-hidden="true">
												<i class="fa fa-angle-left"></i>
										</span> <span class="sr-only">Before</span>
									</a></li>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<li class="list-inline-item hidden-down"><a
												class="active u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--active g-color-white g-bg-primary--active g-font-size-12 rounded-circle g-pa-5"
												href="/catalogue?nowPage=${p}&cntPerPage=${paging.cntPerPage}
												&orderOpt=${paging.orderOpt}&lowPriceFilter=${paging.lowPriceFilter}&highPriceFilter=${paging.highPriceFilter}&starFilter=${paging.starFilter}&discountFilter=${paging.discountFilter}
												<c:forEach items="${paging.categoryListFilter }" var="categoryFilter">
													&categoryListFilter=${categoryFilter }
												</c:forEach>
												">${p }</a></li>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<li class="list-inline-item hidden-down"><a
												class="u-pagination-v1__item g-width-30 g-height-30 g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5"
												href="/catalogue?nowPage=${p}&cntPerPage=${paging.cntPerPage}
												&orderOpt=${paging.orderOpt}&lowPriceFilter=${paging.lowPriceFilter}&highPriceFilter=${paging.highPriceFilter}&starFilter=${paging.starFilter}&discountFilter=${paging.discountFilter}
												<c:forEach items="${paging.categoryListFilter }" var="categoryFilter">
													&categoryListFilter=${categoryFilter }
												</c:forEach>
												">${p }</a></li>
										</c:when>
									</c:choose>
								</c:forEach>	
											
								<c:if test="${paging.endPage != paging.lastPage}">					
								<li class="list-inline-item"><a
									class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-ml-15"
									href="/catalogue?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}
									&orderOpt=${paging.orderOpt}&lowPriceFilter=${paging.lowPriceFilter}&highPriceFilter=${paging.highPriceFilter}&starFilter=${paging.starFilter}&discountFilter=${paging.discountFilter}
									<c:forEach items="${paging.categoryListFilter }" var="categoryFilter">
										&categoryListFilter=${categoryFilter }
									</c:forEach>
									" aria-label="Next"> <span aria-hidden="true">
											<i class="fa fa-angle-right"></i>
									</span> <span class="sr-only">Next</span>
								</a></li>
								</c:if>
								<li class="list-inline-item float-right"><span
									class="u-pagination-v1__item-info g-color-gray-dark-v4 g-font-size-12 g-pa-5">Page
										${paging.nowPage } of ${paging.lastPage }</span></li>
							</ul>
						</nav>
						<!-- End Pagination -->
					</div>
				</div>
				<!-- End Content -->

				<!-- Filters -->
				<form class="col-md-3 g-brd-left--lg g-brd-gray-light-v4 g-pt-40">
					<div class="g-pl-15--lg g-pt-60">
						<!-- Categories -->
						<div class="g-mb-30">
							<h3 class="h5 mb-3">이벤트</h3>

							<ul class="list-unstyled">
								<li class="my-3"><a
									class="d-block u-link-v5 g-color-gray-dark-v4 g-color-primary--hover"
									href="/catalogue">전체상품 <span class="float-right g-font-size-12">${countGameListAll }</span></a>
								</li>
								<li class="my-3"><a
									class="d-block u-link-v5 g-color-gray-dark-v4 g-color-primary--hover"
									href="/catalogue?discountFilter=y">할인상품 <span class="float-right g-font-size-12">${countGameListDiscount }</span></a>
								</li>
								
							</ul>
						</div>
						<!-- End Categories -->

						<hr>

						<!-- 필터인덱스3 -->
						<!-- Pricing -->
						<div class="g-mb-30">
							<h3 class="h5 mb-3">가격</h3>

							<div class="text-center">
								<span class="d-block g-color-primary mb-4">(<span
									id="rangeSliderAmount3">0</span>) 원
								</span>
								<div id="rangeSlider1" class="u-slider-v1-3"
									data-result-container="rangeSliderAmount3" data-range="true"
									data-default="
									<c:choose>
										<c:when test="${paging.lowPriceFilter ne 0  }">${paging.lowPriceFilter }</c:when>
										<c:otherwise>0</c:otherwise>
									</c:choose>,
									<c:choose>
										<c:when test="${paging.highPriceFilter ne 0  }">${paging.highPriceFilter }</c:when>
										<c:otherwise>60000</c:otherwise>
									</c:choose>
									" data-min="0" data-max="60000"
									data-step="5000"></div>
									
									
							</div>
						</div>
						<!-- End Pricing -->


						<hr>

						<!-- Rating -->
						<div class="g-mb-30">
							<h3 class="h5 mb-3">별점</h3>

							<ul id="starFilter"
								class="js-rating u-rating-v1 g-line-height-1 g-font-size-20 g-color-gray-light-v3 mb-0"
								data-hover-classes="g-color-primary">
								<c:forEach begin="1" end="${paging.starFilter }" step="1">
									<li class="g-color-primary g-line-height-1_4 click"><i
										class="fa fa-star"></i></li>
								</c:forEach>
								<c:forEach begin="1" end="${5 - (paging.starFilter) }" step="1">
									<li class="g-line-height-1_4"><i class="fa fa-star"></i>
									</li>
								</c:forEach>
							</ul>
						</div>
						<!-- End Rating -->




						<div id="accordion-12"
							class="u-accordion u-accordion-color-primary" role="tablist"
							aria-multiselectable="true">
							<!-- Card -->
							<div class="card g-brd-none rounded-0 g-mb-15">
								<div id="accordion-12-heading-01"
									class="u-accordion__header g-pa-0" role="tab">
									<h5 class="mb-0">
										<a
											class="d-flex g-color-main g-text-underline--none--hover g-brd-none"
											href="#accordion-12-body-01" data-toggle="collapse"
											data-parent="#accordion-12" aria-expanded="true"
											aria-controls="accordion-12-body-01"> 장르 <span
											class="u-accordion__control-icon g-ml-10"> <i
												class="fa fa-angle-down"></i> <i class="fa fa-angle-up"></i>
										</span>
										</a>
									</h5>
								</div>
								<div id="accordion-12-body-01" class="collapse show"
									role="tabpanel" aria-labelledby="accordion-12-heading-01"
									data-parent="#accordion-12">
									<ul class="list-unstyled">
										<c:forEach items="${categoryListGroupById }" var="categoryCount">
											<li class="my-2"><label
											class="form-check-inline u-check d-block u-link-v5 g-color-gray-dark-v4 g-color-primary--hover g-pl-30">
												<input 
												<c:forEach items="${paging.categoryListFilter}" var="category">
													<c:if test="${category eq categoryCount.categoryId}">checked</c:if>
												</c:forEach>
												value="${categoryCount.categoryId }" name="categoryListFilter"
												class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0"
												type="checkbox"> <span
												class="d-block u-check-icon-checkbox-v4 g-absolute-centered--y g-left-0">
													<i class="fa" data-check-icon="&#xf00c"></i>
											</span> ${categoryCount.categoryName } <span class="float-right g-font-size-13">${categoryCount.categoryCount }</span>
											</label></li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<!-- End Card -->
						</div>

						<hr>
						<div class="row justify-content-center">
							<button id="catalogueFilterResetBtn"
								class="btn u-btn-black g-font-size-12 text-uppercase g-py-12 g-px-25 g-mx-15 g-mb-20"
								type="button">초기화</button>
							<button id="catalogueFilterApplyBtn"
								class="btn u-btn-black g-font-size-12 text-uppercase g-py-12 g-px-25 g-mx-15 g-mb-20"
								type="button">적용</button>
						</div>
						<!-- 필터인덱스1 -->
					</div>
				</form>
				<!-- End Filters -->
			</div>
		</div>
		<!-- End Products -->

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
	<script src="/resources/static/assets/vendor/jquery-ui/ui/widget.js"></script>
	<script src="/resources/static/assets/vendor/jquery-ui/ui/widgets/menu.js"></script>
	<script src="/resources/static/assets/vendor/jquery-ui/ui/widgets/mouse.js"></script>
	<script src="/resources/static/assets/vendor/jquery-ui/ui/widgets/slider.js"></script>
	<script src="/resources/static/assets/vendor/dzsparallaxer/dzsparallaxer.js"></script>
	<script src="/resources/static/assets/vendor/dzsparallaxer/dzsscroller/scroller.js"></script>
	<script src="/resources/static/assets/vendor/dzsparallaxer/advancedscroller/plugin.js"></script>
	<script src="/resources/static/assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>
	<script
		src="/resources/static/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

	<!-- JS Unify -->
	<script src="/resources/static/assets/js/hs.core.js"></script>
	<script src="/resources/static/assets/js/components/hs.header.js"></script>
	<script src="/resources/static/assets/js/helpers/hs.hamburgers.js"></script>
	<script src="/resources/static/assets/js/components/hs.dropdown.js"></script>
	<script src="/resources/static/assets/js/components/hs.scrollbar.js"></script>
	<script src="/resources/static/assets/js/helpers/hs.rating.js"></script>
	<script src="/resources/static/assets/js/components/hs.slider.js"></script>
	<script src="/resources/static/assets/js/components/hs.go-to.js"></script>
	<script src="/resources/static/assets/js/components/hs.carousel.js"></script>

	<!-- JS Customization -->
	<script src="/resources/static/user/assets/js/catalogue-page.js"></script>
	<script src="/resources/static/user/assets/js/footer.js"></script>

	<!-- JS Plugins Init. -->
	<script>
    $(document).on('ready', function () {
    // initialization of carousel
	$.HSCore.components.HSCarousel.init('.js-carousel');

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

      // initialization of rating
      $.HSCore.helpers.HSRating.init();

      // initialization of range slider
      $.HSCore.components.HSSlider.init('#rangeSlider1');
    });


  </script>
  
  <script>
	var discountFilter = "${paging.discountFilter}";
	console.log(discountFilter);
  </script>
</body>
</html>