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
<title>sumy gamestore - wish list page</title>

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
						<h1 class="h3 mb-0">위시리스트</h1>
					</div>

					<div class="align-self-center ml-auto">
						<ul class="u-list-inline">
							<li class="list-inline-item g-mr-5"><a
								class="u-link-v5 g-color-text" href="/user/login-security">마이페이지</a>
								<i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i></li>
							<li class="list-inline-item g-color-primary"><span>위시리스트</span>
							</li>
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

				<!-- Payment Options -->
				<div class="col-lg-5 g-mb-50">
					<!-- Products Block -->
					<div
						class="rounded g-brd-around g-brd-gray-light-v4 g-overflow-x-scroll g-overflow-x-visible--lg g-pa-30">
						<table class="text-center w-100">
							<thead
								class="h6 g-brd-bottom g-brd-gray-light-v4 g-color-black text-uppercase">
								<tr>
									<th class="g-font-weight-500 text-left g-pb-20">게임</th>
									<th class="g-font-weight-500 g-width-130 g-pb-20">가격</th>
									<th></th>
								</tr>
							</thead>

							<tbody>
							
							<c:set var = "originalTotalPrice" value = "0" scope="request"/>
							<c:set var = "finalTotalPrice" value = "0" scope="request"/>
							
							
							<c:forEach items="${viewAll }" var="wishList">
							<c:set var= "originalTotalPrice" value="${originalTotalPrice + wishList.gamePrice}" scope="request"/>
							<c:set var= "finalTotalPrice" value="${finalTotalPrice + wishList.gamePrice * (100-wishList.gameDiscountRate) / 100}" scope="request"/>
								<!-- Item-->
								<tr class="tr_child g-brd-bottom g-brd-gray-light-v4">
									<td class="text-left g-py-25"><img
										class="d-inline-block g-width-100 mr-4"
										src="${wishList.gameThumbImage }" alt="Image Description">
										<div class="d-inline-block align-middle">
											<a href="/sumy/single-product/${wishList.gameId }" class="u-link-v5 g-color-black g-color-primary--hover">${wishList.gameTitle }</a>
											<ul
												class="list-unstyled g-color-gray-dark-v4 g-font-size-12 g-line-height-1_6 mb-0">
												<li>게임사 : ${wishList.gameDev }</li>
											</ul>
										</div></td>
									<td class="text-right g-color-black">
										<div class="d-flex flex-column">
											
												<del
													class="priceBefore g-font-size-12 g-color-gray-dark-v5 mr-3">
													<c:if test="${ wishList.gameDiscountRate ne '0'}">
														&#8361;<fmt:formatNumber value="${wishList.gamePrice}" type="number"/>
													</c:if>
													</del>
											
											<span class="priceAfter g-color-gray-dark-v2 g-font-size-13">
												&#8361;<fmt:formatNumber value="${wishList.gamePrice * (100-wishList.gameDiscountRate) / 100}" type="number" pattern="###,###,###,###,###,###"/> <span
												class="deleteWish g-color-gray-dark-v4 g-color-black--hover g-cursor-pointer" wishlistId=${wishList.wishlistId } >
													<i class="mt-auto fa fa-trash"></i>
											</span>
											</span>
											
										</div>
									</td>
								</tr>
								<!-- End Item-->
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- End Products Block -->
				</div>
				<!-- End Payment Options -->

				<div class="col-lg-4 g-mb-50">
					<aside class="g-bg-gray-light-v5 g-pa-20 g-pb-50 mb-4">
						<h3 class="h5 mb-1 g-font-weight-500">전체 합계</h3>

						<hr class="g-brd-gray-light-v4 g-my-30">

						<div class="d-flex justify-content-between mb-2">
							<span class="g-color-black">상품 수</span> <span
								class="g-color-black g-font-weight-300"><span
								class="g-color-primary" id="wishTotalNum"><!-- 2 --></span> 개</span>
						</div>

						<div class="d-flex justify-content-between mb-2">
							<span class="g-color-black">상품 금액</span> <span
								class="g-color-black g-font-weight-300"><span
								id="wishTotalPriceBefore1"><fmt:formatNumber value="${originalTotalPrice }" type="number" pattern="###,###,###,###,###,###"/></span> &#8361;</span>
						</div>

						<div class="d-flex justify-content-between mb-2">
							<span class="g-color-black">할인 금액</span> <span
								class="g-font-weight-300 g-color-lightred">- <span
								id="wishTotalDiscountRate1"><fmt:formatNumber value="${originalTotalPrice - finalTotalPrice }" type="number" pattern="###,###,###,###,###,###"/></span> &#8361;
							</span>
						</div>

						<hr class="g-brd-gray-light-v4 g-my-30">

						<div class="d-flex justify-content-between mb-2">
							<span class="g-color-black">전체 주문 금액</span> <span
								class="g-color-primary g-font-weight-700 g-font-size-16 g-line-height-1_2"><span
								id="wishTotalPriceAfter1"><fmt:formatNumber value="${finalTotalPrice }" type="number" pattern="###,###,###,###,###,###"/></span> &#8361;</span>
						</div>
					</aside>
					<button id="kakaoPayApiBtn"
						class="btn btn-block u-btn-primary g-font-size-12 text-uppercase g-py-15 g-px-25"
						type="button">결제</button>
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
	<script src="/resources/static/assets/js/components/hs.count-qty.js"></script>
	<script src="/resources/static/assets/js/components/hs.scrollbar.js"></script>
	<script src="/resources/static/assets/js/components/hs.go-to.js"></script>
	<script src="/resources/static/assets/js/helpers/hs.focus-state.js"></script>
	<script src="/resources/static/assets/js/components/hs.file-attachement.js"></script>
	<script src="/resources/static/assets/js/helpers/hs.file-attachments.js"></script>

	<!-- JS Customization -->
	<script src="/resources/static/user/assets/js/page-wishlist-1.js"></script>
	<script src="/resources/static/user/assets/js/footer.js"></script>
	<script src="/resources/static/user/assets/js/payment.js"></script>

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
      
      $.HSCore.components.HSScrollBar.init($('.js-custom-scroll'));

      // initialization of go to
      $.HSCore.components.HSGoTo.init('.js-go-to');

      // initialization of quantity counter
      $.HSCore.components.HSCountQty.init('.js-quantity');

      // input = file 저장주소
      $.HSCore.helpers.HSFileAttachments.init();
      $.HSCore.components.HSFileAttachment.init('.js-file-attachment');
      $.HSCore.helpers.HSFocusState.init();
      
    //include mypageSideBar active 클래스 추가 
      $("ul.list-unstyled.mb-0 li").eq(2).children().first().addClass("active").addClass("g-color-primary--parent-active").addClass("g-bg-gray-light-v5--active");
    });
  </script>
</body>
</html>