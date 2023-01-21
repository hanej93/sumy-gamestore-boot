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
<title>sumy gamestore - paid games list page</title>

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
						<h1 class="h3 mb-0">내가 보유한 게임</h1>
					</div>

					<div class="align-self-center ml-auto">
						<ul class="u-list-inline">
							<li class="list-inline-item g-mr-5"><a
								class="u-link-v5 g-color-text" href="/user/login-security">마이페이지</a>
								<i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i></li>
							<li class="list-inline-item g-color-primary"><span>내가
									보유한 게임</span></li>
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
				
				<!-- Orders -->
				<div class="col-lg-9 g-mb-50">
					<div class="row justify-content-end g-mb-20 g-mb-0--md">
						<div class="col-md-7 g-mb-30">
							<!-- Search Form -->
							<div class="input-group g-pos-rel">
								<span
									class="g-pos-abs g-top-0 g-left-0 g-z-index-3 g-px-13 g-py-10">
									<i
									class="g-color-gray-dark-v4 g-font-size-12 icon-education-045 u-line-icon-pro"></i>
								</span> <input id="mygame-title-search" value="${paging.keyword }"
									class="form-control u-form-control g-brd-around g-brd-gray-light-v3 g-brd-primary--focus g-font-size-13 g-rounded-left-5 g-pl-35 g-pa-0"
									type="search" placeholder="게임 이름으로 검색">
								<div class="input-group-append g-brd-none g-py-0">
									<button id="mygame-title-search-btn"
										class="btn u-btn-black g-font-size-12 text-uppercase g-py-12 g-px-25"
										type="button">보유 조회</button>
								</div>
							</div>
							<!-- End Search Form -->
						</div>
					</div>

					<div class="mb-5">
						<h3 class="h6 d-inline-block">
							<span class="g-color-gray-dark-v4 g-font-weight-400">내가
								보유한 게임</span> <span class="g-font-weight-400">${purchasedGameCount } 건</span>
						</h3>

						<!-- Secondary Button -->
						<div class="d-inline-block ml-2">
							<select id="orderOpt" 
							class="form-control rounded g-py-12">
								<option value="">구매한 날짜순</option>
								<option value="dictionary" <c:if test="${paging.orderOpt eq 'dictionary' }">selected</c:if>>가나다순</option>
								<option value="priceAsc" <c:if test="${paging.orderOpt eq 'priceAsc'}">selected</c:if>>가격오름차순</option>
								<option value="priceDesc" <c:if test="${paging.orderOpt eq 'priceDesc'}">selected</c:if>>가격내림차순</option>
							</select>
						</div>
						<!-- End Secondary Button -->
					</div>

					<!-- Order Block -->
					<div class="g-brd-around g-brd-gray-light-v4 rounded g-mb-30">
						<!-- 게시글 반복 시작 -->
       					<c:forEach items="${viewAll }" var="purchasedGameList">
						<header class="g-bg-gray-light-v5 g-pa-20">
							<div class="row">
								<div class="col-sm-3 col-md-4 ml-auto text-sm-right">
									<h4
										class="g-color-gray-dark-v4 g-font-weight-400 g-font-size-12 text-uppercase g-mb-2">
										주문 ID : <span>${purchasedGameList.purchasedGameId }</span>
									</h4>
								</div>
							</div>
						</header>

						<!-- Order Content -->
						<div class="g-pa-20">
							<div class="row">
								<div class="col-md-8">
									<div class="mb-4">
										<h3 class="h5 mb-1">${purchasedGameList.gameTitle }</h3>
										<p class="g-color-gray-dark-v4 g-font-size-13">
											게임사 : <span>${purchasedGameList.gameDev }</span>
										</p>
									</div>

									<div class="row">
										<div class="col-4 col-sm-3 g-mb-30">
											<img class="img-fluid"
												src="${purchasedGameList.gameThumbImage }"
												alt="Image Description">
										</div>

										<div class="col-8 col-sm-9 g-mb-30">
										<c:if test="${ purchasedGameList.gameDiscountRate ne '0'}">
											<del class="g-font-size-12 g-color-gray-dark-v5 mr-3">
											&#8361;<fmt:formatNumber value="${purchasedGameList.gamePrice}" type="number"/>
											</del>
										</c:if>
										<span class="g-color-gray-dark-v2 g-font-size-15">
											&#8361;<fmt:formatNumber value="${purchasedGameList.gamePrice * (100-purchasedGameList.gameDiscountRate) / 100}" type="number" pattern="###,###,###,###,###,###"/>
										</span>
										<!-- <span class="d-block g-color-lightred mb-2">&#8361;32,000</span> -->
										
										<span
											class="d-block g-color-gray-dark-v4 g-font-size-13 mb-2">
											구매날짜 : <fmt:parseDate value="${purchasedGameList.purchasedWriteDate }" var="dateFmt" pattern="yyyy-MM-dd'T'HH:mm"/>
											<fmt:formatDate value="${dateFmt}"  pattern="yyyy.MM.dd  HH:mm"/></span>
										</div>
									</div>
								</div>

								<div class="col-md-4">
									<a
										class="btn btn-block u-btn-primary g-font-size-12 text-uppercase g-py-12 g-px-25 mb-4"
										href="/sumy/single-product/${purchasedGameList.gameId }">게임 상세보기</a>
								</div>
							</div>
						</div>
						<!-- End Order Content -->
						</c:forEach>
					</div>
					<!-- End Order Block -->

					<!-- Pagination -->
					<nav class="g-mt-100" aria-label="Page Navigation">
						<ul class="list-inline mb-0">
							<c:if test="${paging.startPage != 1 }">
								<li class="list-inline-item"><a
									class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-mr-15"
									href="/user/purchased?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}&orderOpt=${paging.orderOpt}" aria-label="Next"> <span aria-hidden="true">
											<i class="fa fa-angle-left"></i>
									</span> <span class="sr-only">Before</span>
								</a></li>
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				                <c:choose>
				                	<c:when test="${p == paging.nowPage }">
										<li class="list-inline-item hidden-down"><a
											class="active u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--active g-color-white g-bg-primary--active g-font-size-12 rounded-circle g-pa-5"
											href="/user/purchased?nowPage=${p }&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}&orderOpt=${paging.orderOpt}">${p }</a></li>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<%-- <li class="list-inline-item hidden-down"><a
											class="u-pagination-v1__item g-width-30 g-height-30 g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5"
											href="#">${p }</a></li> --%>
											<li class="list-inline-item hidden-down"><a
											class="u-pagination-v1__item g-width-30 g-height-30 g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 active"
											href="/user/purchased?nowPage=${p }&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}&orderOpt=${paging.orderOpt}">${p }</a></li>
					                </c:when>
				                </c:choose>
			                </c:forEach>
			                
			                <c:if test="${paging.endPage != paging.lastPage}">
							<li class="list-inline-item"><a
								class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-ml-15"
								href="/user/purchased?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}&orderOpt=${paging.orderOpt}"  aria-label="Next"> <span aria-hidden="true">
										<i class="fa fa-angle-right"></i>
								</span> <span class="sr-only">Next</span>
							</a></li>
							<<li class="list-inline-item float-right"><span
								class="u-pagination-v1__item-info g-color-gray-dark-v4 g-font-size-12 g-pa-5">Page
									${paging.nowPage } of ${paging.lastPage }</span></li>
							</c:if>
						</ul>
					</nav>
					<!-- End Pagination -->
				</div>
				<!-- Orders -->
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

      // input = file 저장주소
      $.HSCore.helpers.HSFileAttachments.init();
      $.HSCore.components.HSFileAttachment.init('.js-file-attachment');
      $.HSCore.helpers.HSFocusState.init();
      
      //include mypageSideBar active 클래스 추가 
      $("ul.list-unstyled.mb-0 li").eq(1).children().first().addClass("active").addClass("g-color-primary--parent-active").addClass("g-bg-gray-light-v5--active");
    });
  </script>
  <script src="/resources/static/user/assets/js/page-purchased-1.js"></script>
</body>
</html>