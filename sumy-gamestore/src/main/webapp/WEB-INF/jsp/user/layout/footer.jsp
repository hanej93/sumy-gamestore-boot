<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<!-- Footer -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<footer class="g-mt-160 g-bg-gray-dark-v1 g-color-white-opacity-0_8 g-py-20 text-center justify-content-center d-flex align-items-center" style="min-height: 65px">
	<div class="g-ml-30 ">
		<div>
			<div class="text-center text-md-left g-mb-10 g-mb-0--md justify-content-center">
				<div class="d-lg-flex justify-content-center ">
					<small
						class="d-block g-font-size-default g-mr-10 g-mb-10 g-mb-0--md">2021
						© All Rights Reserved.</small>
					<ul class="u-list-inline">
						<li class="list-inline-item g-mx-30"><a
							class="g-color-white-opacity-0_8 g-color-white--hover g-text-underline--none--hover"
							id="aboutSumyBtn" type='button' data-toggle="modal"
							data-target="#aboutSumyModal">회사소개</a></li>
						<c:if test="${principal != null}">
							<li class="list-inline-item g-mx-30"><a
								class="g-color-white-opacity-0_8 g-color-white--hover g-text-underline--none--hover"
								id="aboutSumyBtn" type='button' data-toggle="modal"
								data-target="#questionForSumyModal" data-dismiss="modal"
								aria-label="Close">문의하기</a></li>
						</c:if>
						<!-- <li class="list-inline-item g-mx-30"><a
							class="g-color-white-opacity-0_8 g-color-white--hover g-text-underline--none--hover"
							href="#">이용약관</a></li>
						<li class="list-inline-item g-mx-30"><a
							class="g-color-white-opacity-0_8 g-color-white--hover g-text-underline--none--hover"
							href="#">개인정보처리방침</a></li>
						<li class="list-inline-item g-mx-30"><a
							class="g-color-white-opacity-0_8 g-color-white--hover g-text-underline--none--hover"
							href="#">스토어 환불 정책</a></li> -->
					</ul>
				</div>
			</div>

			<!-- <div class="col-md-4 align-self-center">
				<ul class="list-inline text-center text-md-right mb-0">
					<li class="list-inline-item g-mx-10" data-toggle="tooltip"
						data-placement="top" title="Facebook"><a href="#"
						class="g-color-white-opacity-0_5 g-color-white--hover"> <i
							class="fa fa-facebook"></i>
					</a></li>
					<li class="list-inline-item g-mx-10" data-toggle="tooltip"
						data-placement="top" title="Skype"><a href="#"
						class="g-color-white-opacity-0_5 g-color-white--hover"> <i
							class="fa fa-skype"></i>
					</a></li>
					<li class="list-inline-item g-mx-10" data-toggle="tooltip"
						data-placement="top" title="Linkedin"><a href="#"
						class="g-color-white-opacity-0_5 g-color-white--hover"> <i
							class="fa fa-linkedin"></i>
					</a></li>
					<li class="list-inline-item g-mx-10" data-toggle="tooltip"
						data-placement="top" title="Pinterest"><a href="#"
						class="g-color-white-opacity-0_5 g-color-white--hover"> <i
							class="fa fa-pinterest"></i>
					</a></li>
					<li class="list-inline-item g-mx-10" data-toggle="tooltip"
						data-placement="top" title="Twitter"><a href="#"
						class="g-color-white-opacity-0_5 g-color-white--hover"> <i
							class="fa fa-twitter"></i>
					</a></li>
					<li class="list-inline-item g-mx-10" data-toggle="tooltip"
						data-placement="top" title="Dribbble"><a href="#"
						class="g-color-white-opacity-0_5 g-color-white--hover"> <i
							class="fa fa-dribbble"></i>
					</a></li>
				</ul>
			</div> -->
		</div>
	</div>
</footer>
<!-- End Footer -->

<!-- 회사소개 모달 내용 시작 -->
<div class="modal fade" id="aboutSumyModal" tabindex="-1"
	aria-labelledby="declarationModalLabel" style="display: none;"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title ml-auto" id="declarationModalLabel">
					회사소개</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div
					class="g-brd-around g-brd-gray-light-v3 g-bg-white rounded g-mb-20">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.344060966518!2d126.98692621556901!3d37.57051513165742!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2e7a005c9c5%3A0xac4890a924a29f30!2z642U7KGw7J2A7Lu07ZOo7YSw7JWE7Yq47ZWZ7JuQIOyiheuhnOy6oO2NvOyKpA!5e0!3m2!1sko!2skr!4v1624784512798!5m2!1sko!2skr"
						width="100%" height="200px" style="border: 0;" allowfullscreen=""
						loading="lazy"></iframe>
				</div>
				<div style="border-radius: 2px;">
					<div class="col-12 g-my-15 text-left g-color-gray-dark-v5">
						<span class="u-icon-v1 g-color-primary--hover "> <i
							class="icon-communication-002 u-line-icon-pro"></i>
						</span> 회사명 - Sumy
					</div>
					<div class="col-12 g-my-15 text-left g-color-gray-dark-v5">
						<span class="u-icon-v1 g-color-primary--hover"> <i
							class="icon-communication-044 u-line-icon-pro"></i>
						</span> 사업자등록번호 - 123-12315-46546
					</div>
					<div class="col-12 g-my-15 text-left g-color-gray-dark-v5">
						<span class="u-icon-v1 g-color-primary--hover"> <i
							class="icon-communication-054 u-line-icon-pro"></i>
						</span> 대표문의번호 - 1599-8888
					</div>
					<div class="col-12 g-my-15 text-left g-color-gray-dark-v5">
						<span class="u-icon-v1 g-color-primary--hover"> <i
							class="icon-communication-011 u-line-icon-pro"></i>
						</span> 찾아오시는 길 -<br>
						<h6>서울특별시 종로구 종로2가 수표로 105 육의전빌딩 9층</h6>
					</div>
				</div>

			</div>
			<c:if test="${principal != null}">
				<div class="modal-footer justify-content-center">
					<div class="row g-mx-minus-5 g-mb-20">
						<button class="btn btn-lg u-btn-primary g-mr-10 g-font-size-14"
							type="button" data-toggle="modal"
							data-target="#questionForSumyModal" data-dismiss="modal"
							aria-label="Close">문의하기</button>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</div>
<!-- 회사소개 모달 내용 끝 -->

<!-- 문의하기 모달 내용 시작 -->
<div class="modal fade" id="questionForSumyModal" tabindex="-1"
	aria-labelledby="declarationModalLabel" aria-hidden="true"
	style="overflow-y: auto;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title ml-auto" id="declarationModalLabel">문의하기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<form name="questionForm">
					<input type="number" name="userId" value="${principal.user.userId}"
						style="display: none;"> <input type="text"
						name="questionImage1" value="" style="display: none;"> <label
						class="g-mb-10">문의 제목</label>
					<div class="g-mb-10">
						<input id="questionForSumyModalTitle" name="questionTitle"
							class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 rounded g-py-15 g-px-15"
							type="text" placeholder="문의 제목 입력">
					</div>
					<label class="g-mb-10">문의 내용</label>
					<!-- Textarea Resizable -->
					<div class="g-mb-30">
						<textarea id="questionForSumyModalContents" name="questionText"
							class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 g-brd-primary--focus g-resize-none rounded-3 g-py-13 g-px-15"
							rows="5" placeholder="문의 내용을 작성해주세요."></textarea>
					</div>
					<label class="g-mb-10">이미지 찾기</label>
					<div class="input-group g-mb-10">
						<div class="custom-file">
							<!-- Plain File Input -->
							<div class="form-group mb-0">
								<label class="u-file-attach-v2 g-color-gray-dark-v5 mb-0">
									<input id="questionImgInput" class="questionFileInput"
									type="file"> <i
									class="icon-cloud-upload g-font-size-16 g-pos-rel g-top-2 g-mr-5"></i>
									<span class="js-value">이미지 첨부하기</span>
								</label>
							</div>
							<!-- End Plain File Input -->
						</div>
					</div>

					<div
						class="g-brd-around g-brd-gray-light-v3 g-bg-white rounded g-mb-20 text-center g-bg-gray-light-v5"
						style="height: 360px">
						<img id="questionImg" class="img-fluid"
							src="/upload/default_img.jpg"
							alt="이미지 찾기를 실행해주세요." style="height: 100%">
					</div>
			</div>
			<div class="modal-footer justify-content-center">
				<div class="row g-mx-minus-5 g-mb-20">
					<button id="questionForSumyBtn"
						class="btn btn-lg u-btn-primary g-mr-10 g-font-size-14"
						type="button" aria-label="Close">문의하기</button>
					<button
						class="btn btn-lg u-btn-outline-primary u-btn-hover-v1-1 g-mr-10 g-font-size-14"
						data-dismiss="modal" aria-label="Close" type="button">닫기
					</button>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
<!-- 문의하기 모달 내용 끝 -->