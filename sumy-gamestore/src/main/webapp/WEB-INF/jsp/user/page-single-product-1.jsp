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
<meta charset="UTF-8">
<title>page-single-product-1</title>
<head>
<!-- Title -->
<title>sumy gamestore - games View Details page</title>

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

<!-- CSS Implementing Plugins -->
<link rel="stylesheet"
	href="/resources/static/assets/vendor/icon-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/static/assets/vendor/icon-line-pro/style.css">
<link rel="stylesheet" href="/resources/static/assets/vendor/icon-hs/style.css">
<link rel="stylesheet" href="/resources/static/assets/vendor/animate.css">
<!-- <link rel="stylesheet" href="/resources/static/assets/vendor/hamburgers/hamburgers.min.css"> -->
<link rel="stylesheet"
	href="/resources/static/assets/vendor/hs-megamenu/src/hs.megamenu.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/slick-carousel/slick/slick.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet"
	href="/resources/static/assets/vendor/icon-line/css/simple-line-icons.css">

<!-- CSS Unify Theme -->
<link rel="stylesheet" href="/resources/static/user/assets/css/styles.e-commerce.css">

</head>

<body>
	<main class="g-pt-80">
		<!-- Header -->
		<header id="js-header"
			class="u-header u-header--sticky-top u-header--toggle-section u-header--change-appearance"
			data-header-fix-moment="300">
			<!-- Top Bar -->
			<jsp:include page="layout/header.jsp"/>
			<!-- End Top Bar -->
		</header>
		<!-- End Header -->

		<!-- Breadcrumbs -->
		<section class="g-brd-bottom g-brd-gray-light-v4 g-py-30">
			<div class="container">
				<ul class="u-list-inline">
					<li class="list-inline-item g-mr-5"><a
						class="u-link-v5 g-color-text" href="/catalogue">게임
							카탈로그 목록</a> <i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i>
					</li>
					<li class="list-inline-item g-color-primary"><span>게임
							상세보기</span></li>
				</ul>
			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- Product Description -->
		<div class="container g-py-50">
			<div class="row">
				<div class="col-lg-7">
					<!-- Carousel -->
					<div id="carouselCus1" class="js-carousel g-pt-10 g-mb-10"
						data-infinite="true" data-fade="true"
						data-arrows-classes="u-arrow-v1 g-brd-around g-brd-white g-absolute-centered--y g-width-45 g-height-45 g-font-size-14 g-color-white g-color-primary--hover rounded-circle"
						data-arrow-left-classes="fa fa-angle-left g-left-40"
						data-arrow-right-classes="fa fa-angle-right g-right-40"
						data-nav-for="#carouselCus2">
						<c:if test="${not empty gameInfo.gameIntroImage1}">
						<div class="js-slide g-bg-cover g-bg-black-opacity-0_1--after">
							<img class="img-fluid w-100"
								src="${gameInfo.gameIntroImage1}" alt="Image Description">
						</div>
						</c:if>
						<c:if test="${not empty gameInfo.gameIntroImage2}">
						<div class="js-slide g-bg-cover g-bg-black-opacity-0_1--after">
							<img class="img-fluid w-100"
								src="${gameInfo.gameIntroImage2}" alt="Image Description">
						</div>
						</c:if>
						<c:if test="${not empty gameInfo.gameIntroImage3}">
						<div class="js-slide g-bg-cover g-bg-black-opacity-0_1--after">
							<img class="img-fluid w-100"
								src="${gameInfo.gameIntroImage3}" alt="Image Description">
						</div>
						</c:if>
						<c:if test="${not empty gameInfo.gameIntroImage4}">
						<div class="js-slide g-bg-cover g-bg-black-opacity-0_1--after">
							<img class="img-fluid w-100"
								src="${gameInfo.gameIntroImage4}" alt="Image Description">
						</div>
						</c:if>
						<c:if test="${not empty gameInfo.gameIntroImage5}">
						<div class="js-slide g-bg-cover g-bg-black-opacity-0_1--after">
							<img class="img-fluid w-100"
								src="${gameInfo.gameIntroImage5}" alt="Image Description">
						</div>
						</c:if>
						
					</div>

					<div id="carouselCus2"
						class="js-carousel text-center u-carousel-v3 g-mx-minus-5"
						data-infinite="true" data-center-mode="true" data-slides-show="3"
						data-is-thumbs="true" data-focus-on-select="false"
						data-nav-for="#carouselCus1">
						<c:if test="${not empty gameInfo.gameIntroImage1}">
						<div class="js-slide g-cursor-pointer g-px-5">
							<img class="img-fluid" src="${gameInfo.gameIntroImage1}"
								alt="Image Description">
						</div>
						</c:if>
						<c:if test="${not empty gameInfo.gameIntroImage2}">
						<div class="js-slide g-cursor-pointer g-px-5">
							<img class="img-fluid" src="${gameInfo.gameIntroImage2}"
								alt="Image Description">
						</div>
						</c:if>
						<c:if test="${not empty gameInfo.gameIntroImage3}">
						<div class="js-slide g-cursor-pointer g-px-5">
							<img class="img-fluid" src="${gameInfo.gameIntroImage3}"
								alt="Image Description">
						</div>
						</c:if>
						<c:if test="${not empty gameInfo.gameIntroImage4}">
						<div class="js-slide g-cursor-pointer g-px-5">
							<img class="img-fluid" src="${gameInfo.gameIntroImage4}"
								alt="Image Description">
						</div>
						</c:if>
						<c:if test="${not empty gameInfo.gameIntroImage5}">
						<div class="js-slide g-cursor-pointer g-px-5">
							<img class="img-fluid" src="${gameInfo.gameIntroImage5}"
								alt="Image Description">
						</div>
						</c:if>
					</div>
					<!-- End Carousel -->
				</div>

				<div class="col-lg-5">
					<div class="g-px-40--lg g-pt-10">
						<!-- Product Info -->
						<img class="img-fluid" src="${gameInfo.gameThumbImage}"
							alt="Image Description">
						<h2
							class="g-color-gray-dark-v5 g-font-weight-400 g-font-size-12 text-uppercase mb-2 g-mt-30">${gameInfo.gameDev}</h2>
						<h1 class="g-font-weight-300 mb-4">${gameInfo.gameTitle}</h1>
						<!-- End Product Info -->

						<!-- Price -->
						<div class="g-mb-30">
							<h2
								class="g-color-gray-dark-v5 g-font-weight-400 g-font-size-12 text-uppercase mb-2">게임
								가격</h2>

							<span id="wishTotalPriceAfter1" class="g-color-black g-font-weight-500 g-font-size-30 mr-2">&#8361;<fmt:formatNumber value="${gameInfo.gamePrice * (100-gameInfo.gameDiscountRate) / 100}" type="number" pattern="###,###,###,###,###,###"/></span>
							<c:if test="${ gameInfo.gameDiscountRate ne '0'}">
								<s class="g-color-gray-dark-v4 g-font-weight-500 g-font-size-16">&#8361;<fmt:formatNumber value="${gameInfo.gamePrice}" type="number"/></s>
							</c:if>
						</div>
						<form name="singlePaymentForm" style="display:none;">
							<input value="${gameInfo.gameId}" type="text" name="gameId">
							<input value="${gameInfo.gamePrice * (100-gameInfo.gameDiscountRate) / 100}" type="number" name="gamePrice" pattern="replace(/,/g, '')">
						</form>
						<!-- End Price -->
						
						<c:choose>
						<c:when test="${not empty principal }">
						<c:choose>
						<%-- 이미 구매한 게임인 경우 조건--%>
						<c:when test="${purchasedGame eq 0}">
							<!-- Buttons -->
							<div class="row g-mx-minus-5 g-mb-20">
								<div class="col g-px-5 g-mb-10">
									<button id="purchaseBtn" gameId='${gameInfo.gameId }' 
										class="btn btn-block u-btn-primary g-font-size-12 text-uppercase g-py-15 g-px-25"
										type="button">
										구매 <i class="align-middle ml-2 icon-wallet u-line-icon-pro"></i>
									</button>
								</div>
								<div class="col g-px-5 g-mb-10">
									
										<c:choose>
											<c:when test="${empty existsWishlist }">
												<button id="wishlist-btn" gameId="${gameInfo.gameId }"
													class="btn btn-block u-btn-bluegray g-font-size-12 text-uppercase g-py-15 g-px-25"
													 data-toggle="tooltip" data-placement="top" data-original-title="해당 게임이 위시리스트에 담겨졌습니다."
													 data-trigger="manual" 
													><span>위시리스트 담기</span><i class="align-middle ml-2 icon-finance-100 u-line-icon-pro"></i>
												</button>
											</c:when>
											<c:otherwise>
												<button id="wishlist-btn" gameId="${gameInfo.gameId }"
													class="btn btn-block u-btn-black g-font-size-12 text-uppercase g-py-15 g-px-25"
													data-toggle="tooltip" data-placement="top" data-original-title="해당 게임이 위시리스트에서 제거되었습니다."
													 data-trigger="manual" 
													><span>위시리스트 있음</span><i class="align-middle ml-2 icon-finance-100 u-line-icon-pro"></i>
												</button>
											</c:otherwise>
										</c:choose>
									
								</div>
							</div>
							<!-- End Buttons -->
						</c:when>
						<c:otherwise>
							<!-- Buttons -->
							<div class="row g-mx-minus-5 g-mb-20">
								<div class="col g-px-5 g-mb-10">
								<a class="u-link-v5" href="/user/purchased">
									<button 
										class="btn btn-block u-btn-primary g-font-size-12 text-uppercase g-py-15 g-px-25"
										type="button">
										구매한 게임 <i class="align-middle ml-2 icon-wallet u-line-icon-pro"></i>
									</button>
								</a>
								</div>
							</div>
							<!-- End Buttons -->
						</c:otherwise>
						</c:choose>
						</c:when>
						<c:otherwise>
							<!-- Buttons -->
						
							<div class="row g-mx-minus-5 g-mb-20">
								<div class="col g-px-5 g-mb-10">
								<a class="u-link-v5" href="/sumy/login">
									<button  
										class="btn btn-block u-btn-primary g-font-size-12 text-uppercase g-py-15 g-px-25"
										>
										구매 <i class="align-middle ml-2 icon-wallet u-line-icon-pro"></i>
									</button>
								</a>
								</div>
								<div class="col g-px-5 g-mb-10">
								<a class="u-link-v5" href="/sumy/login">
									<button 
										class="btn btn-block u-btn-bluegray g-font-size-12 text-uppercase g-py-15 g-px-25"
										><span>위시리스트 담기</span><i class="align-middle ml-2 icon-finance-100 u-line-icon-pro"></i>
									</button>
								</a>
								</div>
							</div>
							<!-- End Buttons -->
						</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
		<!-- End Product Description -->

		<!-- Description -->
		<div class="container">
			<div class="g-brd-bottom g-brd-gray-light-v4 g-py-50">
				<h2 class="h4 mb-3">게임 스토리</h2>

				<div class="row">
					<div class="col-lg-7 col-md-8 g-mb-30">
						<p>${gameInfo.gameSubText }</p>
					</div>

					<div class="g-px-40--lg col-lg-5 col-md-4 g-mb-0 g-mb-30--md">
						<!-- List -->
						<ul class="list-unstyled g-color-text">
							<li class="g-brd-bottom--dashed g-brd-gray-light-v3 pt-1 mb-3">
								<span>개발사:</span> <span class="float-right g-color-black">${gameInfo.gameDev }</span>
							</li>
							<li class="g-brd-bottom--dashed g-brd-gray-light-v3 pt-1 mb-3">
								<span>태그: </span>
								<c:set var="comma" value=", "/>
								<span class="float-right g-color-black">
								<c:forEach items="${gameCategoryList }" var="gameCategory" varStatus="status">
									<c:choose>
										<c:when test="${status.first }">
											${gameCategory }
										</c:when>
										<c:otherwise>
											, ${gameCategory }
										</c:otherwise>
									</c:choose>
								</c:forEach>
								</span>
							</li>
							<li class="g-brd-bottom--dashed g-brd-gray-light-v3 pt-1 mb-3">
								<span>출시일:</span> <span class="float-right g-color-black">
									<fmt:parseDate value="${gameInfo.gameReleaseDate}" var="dateFmt" pattern="yyyy-MM-dd'T'HH:mm"/>
      								<fmt:formatDate value="${dateFmt}"  pattern="yyyy-MM-dd"/>
								</span>
							</li>
							<li class="g-brd-bottom--dashed g-brd-gray-light-v3 pt-1 mb-3">
								<span>구매 수:</span> <span class="float-right g-color-black">${gameInfo.gameSaleCount}</span>
							</li>
						</ul>
						<!-- End List -->
					</div>
				</div>
			</div>
		</div>
		<!-- End Description -->

		<!-- Details -->
		<div class="container g-py-50 text-center">
			<!-- 자세히보기 인덱스2 -->
			<div>
				<span class="d-block g-font-size-12 text-uppercase mb-5">게임소개</span>
				<h2 class="mb-4">${gameInfo.gameTitle }</h2>
				<style>
					.line--clamp {
						/* display: -webkit-box;
						-webkit-box-orient: vertical;
						-webkit-line-clamp: 8; */
						max-height: 300px;
						overflow: hidden;
					}
				</style>
				<div id="details" class="mb-5">
				${gameInfo.gameMainText }
				</div>
			</div>
			
			<button id="detailsBtn"
				class="d-none btn u-btn-primary g-font-size-12 text-uppercase g-py-12 g-px-25">자세히 보기</button>
		</div>
		<!-- End Details -->

		<!-- Review -->
		<div class="container">
			<div class="g-brd-y g-brd-gray-light-v4 g-py-100">
				<div class="row justify-content-center">
					<div class="col-lg-9">
						<h2 class="h4 mb-5">리뷰 보기</h2>

						<!-- Review -->
						<div class="g-brd-bottom g-brd-gray-light-v4 g-pb-10 g-mb-50">
							<c:if test="${empty reviewList}">
								<div class="col-8 col-lg-6 g-mb-30 g-height-100 align-middle justify-content-center d-flex align-items-center">
									<h5>작성된 리뷰가 없습니다</h5>
								</div>
							</c:if>
							<!-- 리뷰 반복 시작 -->
							<c:forEach items="${reviewList }" var="review">
							<!-- Media -->
							<div class="media g-mb-30">
								<img
									class="d-flex g-width-60 g-height-60 rounded-circle g-mt-3 g-mr-20"
									src="${review.userProfileImage }" alt="Image Description">
								<div class="media-body">
									<div class="d-flex align-items-start g-mb-15 g-mb-10--sm">
										<div class="d-block">
											<h5 class="h6">${review.userNickname }</h5>

											<!-- Rating -->
											<ul
												class="u-rating-v1 g-font-size-13 g-color-gray-light-v3 mb-0"
												data-hover-classes="g-color-primary">
												<c:forEach begin="1" end="${review.reviewStarRating }" step="1">
													<li class="g-color-primary g-line-height-1_4 click"><i
														class="fa fa-star"></i></li>
												</c:forEach>
												<c:forEach begin="1" end="${5 - (review.reviewStarRating) }" step="1">
													<li class="g-line-height-1_4"><i class="fa fa-star"></i>
													</li>
												</c:forEach>
											</ul>
											<!-- End Rating -->

											<span class="d-block g-color-gray-dark-v5 g-font-size-11">
												<fmt:parseDate value="${review.reviewUpdateDate}" var="dateFmt" pattern="yyyy-MM-dd'T'HH:mm"/>
      											<fmt:formatDate value="${dateFmt}"  pattern="yyyy년 MM월 dd일"/>
											</span>
										</div>
										<div class="ml-auto">
											<!-- Small Button Group -->
											
											<div class="btn-group g-mr-10 g-mb-15">
												<button class="btn btn-primary btn-sm dropdown-toggle"
													type="button" 
													<sec:authorize access="isAuthenticated()">
													data-toggle="dropdown" 
													</sec:authorize>
													aria-haspopup="true"
													aria-expanded="false">
													<i class="align-middle icon-layers u-line-icon-pro"></i>
												</button>
												
												<div class="dropdown-menu">
												<c:choose>
													<c:when test="${principal.user.userId == review.userId }">
														<button class="dropdown-item reviewUpdateBtn">댓글
															수정</button>
														<button reviewId="${review.reviewId}" class="dropdown-item reviewDeleteBtn">댓글
															삭제</button>
													</c:when>
													<c:otherwise>
														<button class="dropdown-item" data-toggle="modal"
															data-target="#declarationModal${review.reviewId }" style="cursor: pointer;">
															신고하기</button>
												</c:otherwise>
												</c:choose>
														<!-- <div class="dropdown-divider"></div> -->
												</div>
												
											</div>
											
											<!-- End Small Button Group -->
										</div>
									</div>

									<p>${review.reviewText }</p>
									<form name="reviewForm" style="display: none;">
										<div class="g-mb-30">
											<textarea id="updateWriteText${review.reviewId}"
												class="reviewUpdateInput form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 g-brd-primary--focus g-resize-none rounded-3 g-py-13 g-px-15"
												rows="5" placeholder="리뷰를 작성해주세요.">${review.reviewText }</textarea>
										</div>
										<div class="row align-items-center">
											<div class="col-8">
												<button
													class="btn u-btn-primary g-font-size-12 text-uppercase g-py-15 g-px-25 reviewFormReset g-mr-10"
													type="button" role="button">취소</button>
												<button reviewId=${review.reviewId }
													class="btn u-btn-primary g-font-size-12 text-uppercase g-py-15 g-px-25 reviewFormComplete"
													type="button" role="button">수정 완료</button>
											</div>

											<!-- Rating -->
											<div class="col-5 col-sm-4 col-md-3">
												<h3 class="h6 mb-1">별점:</h3>

												<ul id="updateWriteStar${review.reviewId}"
													class="js-rating u-rating-v1 g-font-size-20 g-color-gray-light-v3 mb-0"
													data-hover-classes="g-color-primary">
													<li class="g-color-primary g-line-height-1_4 click"><i
														class="fa fa-star"></i></li>
													<li class="g-color-primary g-line-height-1_4 click"><i
														class="fa fa-star"></i></li>
													<li class="g-color-primary g-line-height-1_4 click"><i
														class="fa fa-star"></i></li>
													<li class="g-color-primary g-line-height-1_4 click"><i
														class="fa fa-star"></i></li>
													<li class="g-line-height-1_4"><i class="fa fa-star"></i>
													</li>
												</ul>
												<!-- End Rating -->
											</div>
										</div>
									</form>
									<!-- 모달 내용 시작 -->
									<div class="modal fade" id="declarationModal${review.reviewId }" tabindex="-1"
										aria-labelledby="declarationModalLabel" style="display: none;"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title ml-auto" id="declarationModalLabel">댓글
														신고하기</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">×</span>
													</button>
												</div>
												<div class="modal-body">
													<div class="row justify-content-start text-left g-mx-5">
														<div class="col-12 g-my-15">
															신고대상 이름 : <span id="declarationName${review.reviewId }">${review.userNickname}</span>
														</div>
													</div>
													<form>
														<!-- Textarea Resizable -->
														<div class="form-group g-mb-20 g-px-20">
															<!-- <label class="g-mb-10" for="inputGroup2_2">Textarea resizable</label> -->
															<textarea id="declarationText${review.reviewId }"
																class="form-control form-control-md rounded-0 g-color-gray-dark-v6"
																rows="4" placeholder="신고하는 이유에 대해서 작성해주세요." maxlength="200"></textarea>
														</div>
													</form>
												</div>
												<div class="modal-footer justify-content-center">
													<button principalUserId="${principal.user.userId}" reviewId="${review.reviewId }" id="declarationBtn${review.reviewId }"
														class="btn btn-lg u-btn-outline-primary u-btn-hover-v1-1 g-mr-10 g-font-size-14"
														data-dismiss="modal${review.reviewId }" aria-label="Close" type="button">신고하기</button>
												</div>
											</div>
										</div>
									</div>
									<!-- 모달 내용 끝 -->

									<ul class="list-inline my-0">
										<li class="list-inline-item g-mr-20"><a
											class="g-color-gray-dark-v5 g-text-underline--none--hover"
											href="#"> <i class="icon-like g-pos-rel g-top-1 g-mr-3"></i>
												${review.reviewLikeCount}
										</a></li>

									</ul>
								</div>
							</div>
							<!-- End Media -->
							</c:forEach>
							<!-- 리뷰 반복 끝 -->

						</div>
						<!-- End Review -->
						<div class="text-center">
							<button
								class="btn btn-lg u-btn-outline-primary u-btn-hover-v1-1 g-font-size-14"
								onclick="location.href='/sumy/single-product/${gameInfo.gameId}/review'">리뷰 더보기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Review -->

		<!-- Products -->
		<div class="g-bg-gray-light-v5">
			<div class="container g-pt-50 g-pb-50">
				<div class="row g-mx-minus-10">
					<!-- Products -->
					<div class="container">
						<div class="text-center mx-auto g-max-width-600 g-mb-50">
							<h2 class="g-color-black mb-4">관련 게임</h2>
						</div>

						<div id="carouselCus1" class="js-carousel g-pb-100 g-mx-minus-10"
							data-infinite="true" data-slides-show="4"
							data-lazy-load="ondemand"
							data-arrows-classes="u-arrow-v1 g-pos-abs g-bottom-0 g-width-45 g-height-45 g-color-gray-dark-v5 g-bg-secondary g-color-white--hover g-bg-primary--hover rounded"
							data-arrow-left-classes="fa fa-angle-left g-left-10"
							data-arrow-right-classes="fa fa-angle-right g-right-10"
							data-pagi-classes="u-carousel-indicators-v1 g-absolute-centered--x g-bottom-20 text-center">
							
							<c:forEach items="${relatedGameList}" var="relatedGame">
							<div class="js-slide">
								<div class="g-px-10">
									<!-- Product -->
									<figure class="g-pos-rel g-mb-20">
										<img class="img-fluid"
											data-lazy="${relatedGame.gameThumbImage }"
											alt="Image Description">
										<c:if test="${relatedGame.gameDiscountRate > 0 }">
										<span
											class="u-ribbon-v1 g-width-40 g-height-40 g-color-white g-bg-primary g-font-size-13 text-center text-uppercase g-rounded-50x g-top-10 g-right-minus-10 g-px-2 g-py-10">-${relatedGame.gameDiscountRate}%</span>
										</c:if>	
										<a class="u-link-v2" href="/sumy/single-product/${relatedGame.gameId }"></a>
									</figure>

									<div class="media">
										<!-- Product Info -->
										<div class="d-flex flex-column">
											<h4 class="h6 g-color-black mb-1">
												<a class="u-link-v5 g-color-black g-color-primary--hover"
													href="/sumy/single-product/${relatedGame.gameId }"> ${relatedGame.gameTitle } </a>
											</h4>
											<span
												class="d-inline-block g-color-gray-dark-v5 g-font-size-13">${relatedGame.gameDev }</span>
											
												<span class="g-color-black g-font-size-17"> 
												<c:if test="${ relatedGame.gameDiscountRate ne '0'}">
													<del class="g-font-size-12 g-color-gray-dark-v5">&#8361;<fmt:formatNumber value="${relatedGame.gamePrice}" type="number"/></del>
												</c:if>
													&#8361;<fmt:formatNumber value="${relatedGame.gamePrice * (100-relatedGame.gameDiscountRate) / 100}" type="number" pattern="###,###,###,###,###,###"/>
												</span>
											
										</div>
										<!-- End Product Info -->
										<!-- 
										Products Icons
										<ul class="list-inline media-body text-right">
											<li class="list-inline-item align-middle mx-0"><a
												class="u-icon-v1 u-icon-size--sm g-color-gray-dark-v5 g-color-primary--hover g-font-size-15 rounded-circle"
												href="page-wishlist-1.html" data-toggle="tooltip"
												data-placement="top" title="위시리스트 담기"> <i
													class="icon-finance-100 u-line-icon-pro"></i>
											</a></li>
										</ul>
										End Products Icons
										 -->
									</div>
									<!-- End Product -->
								</div>
							</div>
							</c:forEach>

						</div>
					</div>
					<!-- End Products -->

				</div>
			</div>
		</div>
		<!-- End Products -->

		<!-- 모달 내용 시작 -->
		<div class="modal fade" id="declarationModal" tabindex="-1"
			aria-labelledby="declarationModalLabel" style="display: none;"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title ml-auto" id="declarationModalLabel">댓글
							신고하기</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row justify-content-start text-left g-mx-5">
							<div class="col-12 g-my-15">
								신고대상 이름 : <span id="declarationName">프로악플러</span>
							</div>
						</div>
						<form>
							<!-- Textarea Resizable -->
							<div class="form-group g-mb-20 g-px-20">
								<!-- <label class="g-mb-10" for="inputGroup2_2">Textarea resizable</label> -->
								<textarea id="inputGroup2_2"
									class="form-control form-control-md rounded-0 g-color-gray-dark-v6"
									rows="4" placeholder="신고하는 이유에 대해서 작성해주세요." maxlength="200"></textarea>
							</div>


						</form>
					</div>
					<div class="modal-footer justify-content-center">
						<button id="declarationBtn"
							class="btn btn-lg u-btn-outline-primary u-btn-hover-v1-1 g-mr-10 g-font-size-14"
							data-dismiss="modal" aria-label="Close" type="button">신고하기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 모달 내용 끝 -->

		<!-- Footer -->
		<footer class="g-bg-main-light-v1">
			<jsp:include page="layout/footer.jsp"/>
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
	<script src="/resources/static/assets/vendor/slick-carousel/slick/slick.js"></script>
	<script src="/resources/static/assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>
	<script src="/resources/static/assets/vendor/jquery.countdown.min.js"></script>
	<script
		src="/resources/static/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

	<!-- JS Unify -->
	<script src="/resources/static/assets/js/hs.core.js"></script>
	<script src="/resources/static/assets/js/components/hs.header.js"></script>
	<script src="/resources/static/assets/js/helpers/hs.hamburgers.js"></script>
	<script src="/resources/static/assets/js/components/hs.dropdown.js"></script>
	<script src="/resources/static/assets/js/components/hs.scrollbar.js"></script>
	<script src="/resources/static/assets/js/components/hs.countdown.js"></script>
	<script src="/resources/static/assets/js/components/hs.carousel.js"></script>
	<script src="/resources/static/assets/js/components/hs.tabs.js"></script>
	<script src="/resources/static/assets/js/components/hs.count-qty.js"></script>
	<script src="/resources/static/assets/js/components/hs.go-to.js"></script>
	<script src="/resources/static/assets/js/helpers/hs.rating.js"></script>

	<!-- JS Customization -->
	<script src="/resources/static/user/assets/js/page-single-product-1.js"></script>
	<script src="/resources/static/user/assets/js/footer.js"></script>

	<!-- JS Plugins Init. -->
	<script>
    $(document).on('ready', function () {
      // initialization of carousel
      $.HSCore.components.HSCarousel.init('.js-carousel');

      // initialization of header
      $.HSCore.components.HSHeader.init($('#js-header'));
      $.HSCore.helpers.HSHamburgers.init('.hamburger');

      // initialization of HSMegaMenu plugin
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

      // initialization of go to
      $.HSCore.components.HSGoTo.init('.js-go-to');

      // initialization of HSScrollBar component
      $.HSCore.components.HSScrollBar.init($('.js-scrollbar'));

      // initialization of quantity counter
      $.HSCore.components.HSCountQty.init('.js-quantity');

      // initialization of tabs
      $.HSCore.components.HSTabs.init('[role="tablist"]');
    });

    $(window).on('resize', function () {
      setTimeout(function () {
        $.HSCore.components.HSTabs.init('[role="tablist"]');
      }, 200);
    });

  </script>

	<script>
    $(document).on('ready', function () {

      // initialization of header
      $.HSCore.components.HSHeader.init($('#js-header'));
      $.HSCore.helpers.HSHamburgers.init('.hamburger');

      // initialization of HSMegaMenu plugin
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

      // initialization of go to
      $.HSCore.components.HSGoTo.init('.js-go-to');

      // initialization of HSScrollBar component
      $.HSCore.components.HSScrollBar.init($('.js-scrollbar'));

      // initialization of quantity counter
      $.HSCore.components.HSCountQty.init('.js-quantity');

      // initialization of tabs
      $.HSCore.components.HSTabs.init('[role="tablist"]');

      // initialization of rating
      $.HSCore.helpers.HSRating.init();
    });

    $(window).on('resize', function () {
      setTimeout(function () {
        $.HSCore.components.HSTabs.init('[role="tablist"]');
      }, 200);
    });
  </script>
</body>
</html>