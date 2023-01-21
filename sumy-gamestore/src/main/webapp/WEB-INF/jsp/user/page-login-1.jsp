<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Title -->
<title>sumy gamestore - login page</title>

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

<style>
.backgroundBKop05 {
	background: rgba(0, 0, 0, 0.5);
}

main{
	height:100vh;
}

#myVideo {
	position: fixed;
	top: 0;
	left: 0;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -1;
}
</style>
</head>

<body style="background: black;">
	<main class="backgroundBKop05 g-pt-80">
		<!-- Header -->
		<jsp:include page="layout/header.jsp" />
		<!-- End Header -->
		
		<video muted autoplay loop id="myVideo">
			<source
				src="/resources/static/user/assets/video/K_DA - POP_STARS (ft. Madison Beer, (G)I-DLE, Jaira Burns) _ Music Video - League of Legends (1080p).mp4"
				type="video/mp4">
			<strong>Your browser does not support the video tag.</strong>
		</video>

		<!-- Login -->
		<section class="container g-pt-20">
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-5 order-lg-2">
					<div
						class="g-brd-around g-brd-gray-light-v3 rounded g-px-30 g-py-50 mb-4 ">
						<header class="text-center mb-4">
							<h1 class="h4 g-color-white g-font-weight-600">로그인</h1>
						</header>

						<!-- Form -->
						<form id="loginForm" method="post" action="/loginProc" class="g-py-15">
							<div class="form-group mb-4">
								<div class="input-group g-rounded-left-3">
									<span class="input-group-prepend g-width-45"> <span
										class="input-group-text justify-content-center w-100 g-bg-transparent g-brd-gray-light-v3 g-color-gray-dark-v5">
											<i class="icon-finance-067 u-line-icon-pro"></i>
									</span>
									</span> <input id="userEmail" name="username"
										class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 g-rounded-left-0 g-rounded-right-3 g-py-15 g-px-15"
										type="email" placeholder="이메일 주소 @포함">
								</div>
								<small class="form-control-feedback" style="display: none;">이메일
									주소 입력은 필수 항목입니다.</small>
							</div>

							<div class="form-group mb-4">
								<div class="input-group g-rounded-left-3">
									<span class="input-group-prepend g-width-45"> <span
										class="input-group-text justify-content-center w-100 g-bg-transparent g-brd-gray-light-v3 g-color-gray-dark-v5">
											<i class="icon-media-094 u-line-icon-pro"></i>
									</span>
									</span> 
									
									<input id="userPassword" name="password"
										class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-none g-rounded-left-0 g-py-15 g-px-15"
										type="password" placeholder="비밀번호 입력">
										<span class="input-group-append g-color-gray-dark-v5 g-brd-left justify-content-center align-items-center g-bg-white g-rounded-right-3" style="cursor:pointer;"><i id="passwordEye" class="fa fa-eye fa-lg"></i></span>

								</div>
								<small class="form-control-feedback" style="display: none;">비밀번호
									입력은 필수 항목입니다.</small>
							</div>

							<div class="row justify-content-between mb-5">
								<div class="col align-self-center">
									<label
										class="form-check-inline u-check g-color-gray-dark-v5 g-font-size-13 g-pl-25 mb-0">
										<input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0" name="remember-me"
										type="checkbox"> <span
										class="d-block u-check-icon-checkbox-v6 g-absolute-centered--y g-left-0">
											<i class="fa" data-check-icon="&#xf00c"></i>
									</span> 자동 로그인
									</label>
								</div>
								<div class="col align-self-center text-right">
									<a class="g-font-size-13" href="/sumy/password-recovery">비밀번호
										찾기</a>
								</div>
							</div>

							<div class="mb-5">
								<button id="loginBtn"
									class="btn btn-block u-btn-primary g-font-size-12 text-uppercase g-py-12 g-px-25"
									type="submit">로그인</button>
							</div>

							<div class="d-flex justify-content-center text-center g-mb-30">
								<div
									class="d-inline-block align-self-center g-width-50 g-height-1 g-bg-gray-light-v1"></div>
								<span class="align-self-center g-color-gray-dark-v5 mx-4">OR</span>
								<div
									class="d-inline-block align-self-center g-width-50 g-height-1 g-bg-gray-light-v1"></div>
							</div>

							<div class="row no-gutters">
								<div class="col-6">
									<a
										class="btn btn-block u-btn-yellow g-font-size-12 text-uppercase g-py-12 g-px-25 mr-2"
										type="button" href="${kakaoUrl }">카카오톡 로그인</a>
								</div>
								<div class="col-6">
									<a href="${ naverUrl}"
										class="btn btn-block u-btn-white g-color-green g-brd-green g-font-size-12 text-uppercase g-py-12 g-px-25 ml-2"
										type="button">네이버 로그인</a>
								</div>
							</div>
						</form>
						<!-- End Form -->
					</div>

					<div class="text-center">
						<p class="g-color-gray-dark-v5 mb-0">
							계정을 가지고 있지 않으신가요? <a class="g-font-weight-600"
								href="/sumy/join">회원가입</a>
						</p>
					</div>
				</div>
			</div>
		</section>
		<!-- End Login -->

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
	<script src="/resources/static/user/assets/js/page-login-1.js"></script>
	<script src="/resources/static/user/assets/js/footer.js"></script>

	<!-- 카카오 로그인 api 소스 첨부 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<!-- javascript key : 9ecf755c39ffadc782344e2b46539a29 -->
	
	
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
      
    //카카오 로그인 api
  	window.Kakao.init("9ecf755c39ffadc782344e2b46539a29");
  	
  	function kakaoLogin(){
  		window.Kakao.Auth.login({
  			scope:'profile_nickname, profile_image, account_email, gender',
  			success: function(authObj){
  				console.log(authObj);
  				window.Kakao.API.request({
  					url:'/v2/user/me',
  					success: res =>{
  						const kakao_account = res.kakao_account;
  						console.log(kakao_account);
  					}
  				});
  			}
  		});
  	}
    });
  </script>

</body>
</html>