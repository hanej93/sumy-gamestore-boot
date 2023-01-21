<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!-- Profile Settings -->
<div class="col-lg-3 g-mb-50">
	<aside class="g-brd-around g-brd-gray-light-v4 rounded g-px-20 g-py-30">
		<!-- Profile Picture -->
		<div class="text-center g-pos-rel g-mb-30">
			<div class="g-width-100 g-height-100 mx-auto mb-3">
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal" var="principal" />
				</sec:authorize>
				<core:if test="${principal.user.userProfileImage eq null}">
					<img id="blah2" class="rounded-circle"
						src="/resources/static/user/assets/img-temp/100x100/img1.jpg"
						alt="Image Decor" width="100%" height="100%">
				</core:if>
				<core:if test="${principal.user.userProfileImage ne null}">
					<img id="blah2" class="rounded-circle"
						src="${principal.user.userProfileImage}" alt="Image Decor"
						width="100%" height="100%">
				</core:if>
			</div>

			<span class="d-block g-font-weight-500">${principal.user.userName}</span> <span
				class="u-icon-v3 u-icon-size--xs g-color-white--hover g-bg-primary--hover rounded-circle g-pos-abs g-top-0 g-right-15 g-cursor-pointer"
				title="프로필 사진 변경" type="button" data-toggle="modal"
				data-target="#profileUpdateModal"> <i
				class="icon-finance-067 u-line-icon-pro"></i>
			</span>
		</div>
		<!-- End Profile Picture -->

		<hr class="g-brd-gray-light-v4 g-my-30">

		<!-- Profile Settings List -->
		<ul class="list-unstyled mb-0">
			<li class="g-py-3"><a
				class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3"
				href="/user/login-security"> <span
					class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i
						class="icon-finance-135 u-line-icon-pro"></i></span> 회원정보 변경
			</a></li>
			<li class="g-py-3"><a
				class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3"
				href="/user/purchased"> <span
					class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i
						class="icon-finance-114 u-line-icon-pro"></i></span> 내가 보유한 게임
			</a></li>
			<li class="g-py-3"><a
				class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3"
				href="/user/wishlist"> <span
					class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i
						class="icon-finance-100 u-line-icon-pro"></i></span> 위시리스트
			</a></li>
			<!-- <li class="g-py-3"><a
				class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3"
				href="page-payment-options-1.html"> <span
					class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i
						class="icon-finance-110 u-line-icon-pro"></i></span> 결제 정보
			</a></li> -->
		</ul>
		<!-- End Profile Settings List -->
	</aside>
</div>
<!-- End Profile Settings -->