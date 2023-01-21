<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Title -->
  <title>Sumy GameStore 게임 수정</title>

  <!-- Required Meta Tags Always Come First -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <!-- Favicon -->
  <link rel="shortcut icon" href="/resources/static/favicon.ico">
  <!-- Google Fonts -->
  <link rel="stylesheet"
    href="//fonts.googleapis.com/css?family=Open+Sans%3A400%2C300%2C500%2C600%2C700%7CPlayfair+Display%7CRoboto%7CRaleway%7CSpectral%7CRubik">
  <!-- CSS Global Compulsory -->
  <link rel="stylesheet" href="/resources/static/assets/vendor/bootstrap/bootstrap.min.css">
  <!-- CSS Global Icons -->
  <link rel="stylesheet" href="/resources/static/assets/vendor/icon-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="/resources/static/assets/vendor/icon-line/css/simple-line-icons.css">
  <link rel="stylesheet" href="/resources/static/assets/vendor/icon-etlinefont/style.css">
  <link rel="stylesheet" href="/resources/static/assets/vendor/icon-line-pro/style.css">
  <link rel="stylesheet" href="/resources/static/assets/vendor/icon-hs/style.css">

  <link rel="stylesheet" href="/resources/static/admin/assets/vendor/hs-admin-icons/hs-admin-icons.css">
  <link rel="stylesheet" href="/resources/static/assets/vendor/animate.css">
  <link rel="stylesheet" href="/resources/static/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.min.css">
  <link rel="stylesheet" href="/resources/static/admin/assets/vendor/bootstrap-select/css/bootstrap-select.min.css">
  <link rel="stylesheet" href="/resources/static/admin/assets/vendor/chartist-js/chartist.min.css">
  <link rel="stylesheet" href="/resources/static/admin/assets/vendor/fancybox/jquery.fancybox.min.css">

  <link rel="stylesheet" href="/resources/static/assets/vendor/hamburgers/hamburgers.min.css">

  <!-- CSS Unify -->
  <link rel="stylesheet" href="/resources/static/admin/assets/css/unify-admin.css">

  <!-- CSS Customization -->
  <link rel="stylesheet" href="/resources/static/assets/css/custom.css">

  <!-- 썸머 노트 -->
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">

</head>

<body>
  <main>
    <!-- sidebar 시작 -->
    	<jsp:include page="layout/sidebar.jsp"/>
    <!-- sidebar 끝 -->

        <div class="col g-ml-45 g-ml-0--lg g-pb-65--md">
          <!-- Breadcrumb-v1 -->
          <div class="g-bg-gray-light-v8 g-pa-20">
            <ul class="u-list-inline g-color-gray-dark-v6">

              <li class="list-inline-item g-mr-10">
                <a id="pageName" class="u-link-v5 g-color-gray-dark-v6 g-color-secondary--hover g-valign-middle" href="/admin/game/list">게임 관리</a>
                <i class="hs-admin-angle-right g-font-size-12 g-color-gray-light-v6 g-valign-middle g-ml-10"></i>
              </li>

              <li class="list-inline-item g-mr-10">
                <a class="u-link-v5 g-color-gray-dark-v6 g-color-secondary--hover g-valign-middle" href="${pageContext.request.contextPath }/admin/game/list">게임 리스트</a>
                <i class="hs-admin-angle-right g-font-size-12 g-color-gray-light-v6 g-valign-middle g-ml-10"></i>
              </li>

              <li class="list-inline-item">
                <span class="g-valign-middle">게임 수정</span>
              </li>
            </ul>
          </div>
          <!-- End Breadcrumb-v1 -->


          <!-- 컨텐츠 시작 -->
          <div class="g-pa-20">
            <h1 class="g-font-weight-300 g-font-size-28 g-color-black g-mb-28">게임 수정</h1>

            <div class="container">
              <!-- 1-st column -->
              <div class="">
                <!-- Line Text Inputs -->
                <div class="g-brd-around g-brd-gray-light-v7 g-rounded-4 g-pa-15 g-pa-20--md g-mb-30">
                  <!-- 게임명 시작 -->
                  <div class="g-mb-30">
                    <label class="" for="inputGroup-4_2">
                      <h5>게임명</h5>
                    </label>

                    <div class="form-group g-pos-rel">
                      <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                        <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                      </span>
                      <input id="gameId" type="hidden" value="${gameInfo.gameId }">
                      <input id="gameTitle" value="${gameInfo.gameTitle }"
                        class="form-control form-control-md g-brd-none g-brd-bottom g-brd-gray-light-v7 g-brd-gray-light-v3--focus rounded-0 px-0 g-py-10"
                        type="text" placeholder="게임명을 입력해주세요." maxlength="100">
                    </div>
                  </div>
                  <!-- 게임명 끝 -->

                  <!-- 제작사명 시작 -->
                  <div class="g-mb-30">
                    <label class="" for="inputGroup-4_2">
                      <h5>제작사명</h5>
                    </label>

                    <div class="form-group g-pos-rel">
                      <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                        <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                      </span>
                      <input id="gameDev" value="${gameInfo.gameDev }"
                        class="form-control form-control-md g-brd-none g-brd-bottom g-brd-gray-light-v7 g-brd-gray-light-v3--focus rounded-0 px-0 g-py-10"
                        type="text" placeholder="제작사명을 입력해주세요." maxlength="100">
                    </div>
                  </div>
                  <!-- 제작사명 끝 -->

                  <!-- 게임 등급 시작 -->
                  <div class="g-mb-30">
                    <label class="">
                      <h5>게임 등급</h5>
                    </label>

                    <div
                      class="form-group u-select--v3 g-pos-rel g-brd-none g-brd-bottom g-brd-gray-light-v7 rounded-0 mb-0">
                      <select id="gameRate"
                      class="js-select u-select--v3-select u-sibling w-100 g-pl-0--child" required="required"
                        title="게임 등급 선택" style="display: none;">
                        <option value="전체" <c:if test="${gameInfo.gameRate eq '전체' }">selected</c:if>
                          data-content='<span class="d-flex align-items-center w-100"><i class="icon-hotel-restaurant-088 u-line-icon-pro g-font-size-18 g-mr-15"></i><span>전체 이용가</span></span>'>
                          전체 이용가
                        </option>
                        <option value="12세" <c:if test="${gameInfo.gameRate eq '12세' }">selected</c:if>
                          data-content='<span class="d-flex align-items-center w-100"><i class="fa fa-soccer-ball-o g-font-size-18 g-mr-15"></i><span>12세 이용가</span></span>'>
                          12세 이용가
                        </option>
                        <option value="15세" <c:if test="${gameInfo.gameRate eq '15세' }">selected</c:if>
                          data-content='<span class="d-flex align-items-center w-100"><i class="icon-hotel-restaurant-002 u-line-icon-pro g-font-size-18 g-mr-15"></i><span>15세 이용가</span></span>'>
                          15세 이용가
                        </option>
                        <option value="18세" <c:if test="${gameInfo.gameRate eq '18세' }">selected</c:if>
                          data-content='<span class="d-flex align-items-center w-100"><i class="icon-hotel-restaurant-089 u-line-icon-pro g-font-size-18 g-mr-15"></i><span>청소년 이용 불가</span></span>'>
                          청소년 이용 불가
                        </option>
                      </select>

                      <div
                        class="d-flex align-items-center g-absolute-centered--y g-right-0 g-color-gray-light-v6 g-color-lightblue-v9--sibling-opened g-mr-15">
                        <i class="hs-admin-angle-down"></i>
                      </div>
                    </div>
                  </div>
                  <!-- 게임 등급 끝 -->


                  <h5 class="g-my-20">썸네일 이미지</h5>
                  <!-- 이미지 썸네일 시작 -->
                  <div class="row justify-content-center g-mb-30 g-bg-gray-light-v9 rounded-0 g-mx-0">
                    <img id="preview-image" class="img-fluid g-height-300" src="/upload/default_img.jpg">
                  </div>
                  <!-- 이미지 썸네일 끝 -->

                  <!-- 이미지 선택 시작 -->
                  <div class="form-group mb-20 g-brd-bottom g-brd-gray-light-v7 rounded-0">
                    <label class="u-file-attach-v2 g-color-gray-dark-v5 mb-0">
                    <form id="fileForm" enctype="multipart/form-data">
                      <input
                      id="fileAttachment" name="thumbnail" type="file" accept=".gif,.jpg,.jpeg,.png">
                    </form>
                      <i class="icon-cloud-upload g-font-size-16 g-pos-rel g-top-2 g-mr-5"></i>
                      <span class="js-value" id="imgExplain">이미지 파일을 첨부해주세요.</span>
                    </label>
                  </div>
                  <!-- 이미지 선택 끝 -->

                  <!-- 게임 가격 시작 -->
                  <div class="g-mt-30 g-mb-30">
                    <label class="" for="inputGroup-4_2">
                      <h5>게임 가격</h5>
                    </label>

                    <div class="form-group g-pos-rel input-group">
                      <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                        <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                      </span>
                      <input id="sumy-game-input-price" value="${gameInfo.gamePrice }"
                        class="form-control form-control-md g-brd-none g-brd-bottom g-brd-gray-light-v7 g-brd-gray-light-v3--focus rounded-0 px-0 g-py-10"
                        type="text" maxlength="8" style="text-align:right"
                        oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                      <div class="input-group-append">
                        <span class="input-group-text rounded-0 g-color-gray-dark-v5 g-brd-none">원</span>
                      </div>
                    </div>
                  </div>
                  <!-- 게임 가격 끝 -->

                  <!-- 할인율 시작 -->
                  <div class="g-mt-30 g-mb-30">
                    <label class="" for="inputGroup-4_2">
                      <h5>게임 할인율</h5>
                    </label>

                    <div class="form-group g-pos-rel input-group">
                      <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                        <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                      </span>
                      <input id="sumy-game-discount-rate" value="${gameInfo.gameDiscountRate }"
                        class="form-control form-control-md g-brd-none g-brd-bottom g-brd-gray-light-v7 g-brd-gray-light-v3--focus rounded-0 px-0 g-py-10"
                        type="text" style="text-align:right"
                        oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                      <div class="input-group-append">
                        <span class="input-group-text rounded-0 g-color-gray-dark-v5 g-brd-none">%</span>
                      </div>
                    </div>
                  </div>
                  <!-- 할인율 끝 -->

                  <!-- 할인된 게임 가격 시작 -->
                  <div class="g-mt-30 g-mb-30">
                    <label class="" for="inputGroup-4_2">
                      <h5>할인된 게임 가격</h5>
                    </label>

                    <div class="form-group g-pos-rel input-group">
                      <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                        <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                      </span>
                      <input id="sumy-game-result-price" value="${gameInfo.gamePrice * (100 - gameInfo.gameDiscountRate) / 100 }"
                        class="form-control form-control-md g-brd-none g-brd-bottom g-brd-gray-light-v7 g-brd-gray-light-v3--focus rounded-0 px-0 g-py-10 g-bg-white"
                        type="text" maxlength="8" style="text-align:right" readonly="readonly">
                      <div class="input-group-append">
                        <span class="input-group-text rounded-0 g-color-gray-dark-v5 g-brd-none">원</span>
                      </div>
                    </div>
                  </div>
                  <!-- 할인된 게임 가격 끝 -->
                  <!-- 게임 카테고리 선택 시작 -->
							<h5 class="g-mb-20">카테고리 선택</h5>
							<div id="sumy-game-category" class="row g-mb-30">
								<!-- Left Column -->
								<div class="col-md-12 row">
									<c:forEach items="${categoryList }" var="category">
										<div class="form-group g-mb-10 col-md-6">
											<label class="u-check g-pl-25"> <input id="category"
												value="${ category.categoryId}"
												class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0"
												type="checkbox"
												<c:if test="${gameInfo.gameCategoryId1 eq category.categoryId }">checked</c:if>
												<c:if test="${gameInfo.gameCategoryId2 eq category.categoryId }">checked</c:if>
												<c:if test="${gameInfo.gameCategoryId3 eq category.categoryId }">checked</c:if>
												<c:if test="${gameInfo.gameCategoryId4 eq category.categoryId }">checked</c:if>
												>
												<div
													class="u-check-icon-checkbox-v4 g-absolute-centered--y g-left-0">
													<i class="fa" data-check-icon=""></i>
												</div> ${ category.categoryName}
											</label>
										</div>
									</c:forEach>
								</div>
							</div>
							<!-- 게임 카테고리 선택 끝 -->

                  <!-- 게임설명 시작 -->
                  <div class="g-mt-30 g-mb-30">
                    <label for="inputGroup-4_2">
                      <h5>게임설명</h5>
                    </label>

                    <div class="form-group g-pos-rel">
                      <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                        <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                      </span>
                      <textarea id="gameSubText"
                       class="form-control form-control-md rounded-0 g-color-gray-dark-v6"
                        type="text" placeholder="게임설명을 입력해주세요." rows="4" maxlength="200">${gameInfo.gameSubText }</textarea>
                    </div>
                  </div>
                  <!-- 게임설명 끝 -->

                  <!-- 게임본문 시작 -->
                  <div class="g-mb-30">
                    <label for="inputGroup-4_2">
                      <h5>게임본문</h5>
                    </label>

                    <div class="form-group g-pos-rel">
                      <span class="g-pos-abs g-top-0 g-right-0 d-block g-width-40 h-100 opacity-0 g-opacity-1--success">
                        <i class="hs-admin-check g-absolute-centered g-font-size-default g-color-secondary"></i>
                      </span>
                      <textarea
                      id="summernote" class="form-control form-control-md rounded-0 g-color-gray-dark-v6"
                        type="text" placeholder="게임본문을 입력해주세요.">${gameInfo.gameMainText }</textarea>

                    </div>
                  </div>
                  <!-- 게임본문 끝 -->

                </div>
                <!-- End Line Text Inputs -->




              </div>
              <!-- End 1-st column -->

              <!-- 2-nd column -->
              <div class="">
                <!-- Rounded Text Inputs -->
                <div class="g-brd-around g-brd-gray-light-v7 g-rounded-4 g-pa-15 g-pa-20--md g-mb-30">
                  <h5>게임 미리보기</h5>
                  <div class="g-bg-gray-light-v9 rounded-0 g-mb-30">
                    <div class="row justify-content-center">
                      <img id="preview-image-0" class="col-4 g-py-5" height="300px"
                        src="/upload/default_img.jpg">
                      <img id="preview-image-1" class="col-4 g-py-5" height="300px"
                        src="/upload/default_img.jpg">
                    </div>
                    <div class="row justify-content-center">
                      <img id="preview-image-2" class="col-4 g-py-5" height="300px"
                        src="/upload/default_img.jpg">
                      <img id="preview-image-3" class="col-4 g-py-5" height="300px"
                        src="/upload/default_img.jpg">
                      <img id="preview-image-4" class="col-4 g-py-5" height="300px"
                        src="/upload/default_img.jpg">
                    </div>
                  </div>
                  <!-- End Rounded Text Inputs -->

                  <!-- 이미지 선택 시작 -->
                  <div class="form-group mb-20 g-brd-bottom g-brd-gray-light-v7 rounded-0 g-mb-30">
                    <label class="u-file-attach-v2 g-color-gray-dark-v5 mb-0">
                    <form>
                      <input id="input-multiple-image" name="files" type="file" accept=".gif,.jpg,.jpeg,.png"
                        multiple>
                    </form>
                      <i class="icon-cloud-upload g-font-size-16 g-pos-rel g-top-2 g-mr-5"></i>
                      <span id="imgExplainMulti" class="js-value">이미지 파일을 첨부해주세요.</span>
                    </label>
                  </div>
                  <!-- 이미지 선택 끝 -->
                </div>
              </div>
              <!-- End Rounded Text Inputs -->

            </div>
            <!-- End 2-nd column -->

            <div class="justify-content-center row align-items-center">
              <a href="${pageContext.request.contextPath }/admin/game/list" class="btn btn-lg u-btn-outline-primary u-btn-hover-v1-1 g-mr-10 g-font-size-14"
                data-dismiss="modal">돌아가기</a>
              <a id="btn-game-add-parent" href="#" class="btn btn-lg u-btn-outline-primary u-btn-hover-v1-1 g-mr-10 g-font-size-14"
                data-toggle="modal" data-dismiss="modal">수정</a>
            </div>

          </div>
        </div>
        <!-- 컨텐츠 끝 -->

        <div class="align-items-center g-line-height-1 justify-content-center">

          <!-- 게임 추가 모달 내용 시작 -->
          <div class="modal fade justify-content-center" id="exampleModal" tabindex="-1"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog  modal-dialog-scrollable">
              <div class="modal-content">
                <div class="modal-body">
                  <div class="row justify-content-center g-mx-5">
                    <div class="col-12 g-mt-10 g-mb-30">게임을 수정 하시겠습니까?</div>
                    <div>
                      <a id="btn-game-update" href="" class="btn btn-lg u-btn-outline-primary u-btn-hover-v1-1 g-mr-10 g-font-size-14"
                        data-toggle="modal" data-dismiss="modal">수정</a>
                      <a href="#" class="btn btn-lg u-btn-outline-primary u-btn-hover-v1-1 g-mr-10 g-font-size-14"
                        data-dismiss="modal">닫기</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- 게임 추가 모달 내용 끝 -->

          <!-- 추가 완료 팝업 시작-->
          <div class="modal fade justify-content-center" id="exampleModal2" tabindex="-1"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable">
              <div class="modal-content">
                <div class="modal-body">
                  <div class="row justify-content-center g-mx-5">
                    <div class="col-12 g-mt-10 g-mb-30">게임 수정을 완료하였습니다.</div>
                    <div>
                      <a href="/admin/game/list" class="btn btn-lg u-btn-outline-primary u-btn-hover-v1-1 g-font-size-14"
                        >확인</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- 추가 완료 팝업 끝-->


          <!-- Footer -->
          <jsp:include page="layout/footer.jsp" />
          <!-- End Footer -->
          
        </div>
      </div>
      </section>
    </main>

    <!-- JS Global Compulsory -->
    <script src="/resources/static/admin/assets/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/static/admin/assets/vendor/jquery-migrate/jquery-migrate.min.js"></script>

    <script src="/resources/static/assets/vendor/popper.js/popper.min.js"></script>
    <script src="/resources/static/assets/vendor/bootstrap/bootstrap.min.js"></script>

    <script src="/resources/static/assets/vendor/cookiejs/jquery.cookie.js"></script>



    <!-- JS Plugins Init. -->
    <script src="/resources/static/assets/vendor/appear.js"></script>
    <script src="/resources/static/admin/assets/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <script src="/resources/static/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="/resources/static/admin/assets/vendor/chartist-js/chartist.min.js"></script>
    <script src="/resources/static/admin/assets/vendor/fancybox/jquery.fancybox.min.js"></script>
    <script src="/resources/static/assets/vendor/jquery.filer/js/jquery.filer.min.js"></script>


    <!-- JS Implementing Plugins -->
    <script src="/resources/static/assets/vendor/jquery.maskedinput/src/jquery.maskedinput.js"></script>


    <!-- JS Unify -->
    <script src="/resources/static/assets/js/hs.core.js"></script>
    <script src="/resources/static/admin/assets/js/components/hs.side-nav.js"></script>
    <script src="/resources/static/assets/js/helpers/hs.hamburgers.js"></script>
    <script src="/resources/static/assets/js/components/hs.dropdown.js"></script>
    <script src="/resources/static/assets/js/components/hs.scrollbar.js"></script>
    <script src="/resources/static/admin/assets/js/components/hs.bar-chart.js"></script>
    <script src="/resources/static/assets/js/helpers/hs.focus-state.js"></script>
    <script src="/resources/static/admin/assets/js/components/hs.popup.js"></script>

    <script src="/resources/static/assets/js/helpers/hs.file-attachments.js"></script>
    <script src="/resources/static/assets/js/components/hs.file-attachement.js"></script>
    <script src="/resources/static/assets/js/components/hs.masked-input.js"></script>

    <!-- JS Custom -->
    <!-- <script src="/resources/static/assets/js/custom.js"></script> -->
	
	<!-- 썸머노트 스크립트 -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <!-- include summernote-ko-KR -->
	<script src="/resources/static/etc/summernote-ko-KR.js"></script>

    <!-- 썸머노트 설정 -->
    <script>
      $('#summernote').summernote({
        placeholder: '게임본문을 입력해주세요.',
        tabsize: 2,
        height: 300,
        lang: 'ko-KR'
      });
    </script>

    <!-- JS Plugins Init. -->
    <script>
      $(document).on('ready', function () {
        // initialization of custom select
        $('.js-select').selectpicker();

        // initialization of sidebar navigation component
        $.HSCore.components.HSSideNav.init('.js-side-nav');

        // initialization of hamburger
        $.HSCore.helpers.HSHamburgers.init('.hamburger');

        // initialization of charts
        $.HSCore.components.HSBarChart.init('.js-bar-chart');

        // initialization of HSDropdown component
        $.HSCore.components.HSDropdown.init($('[data-dropdown-target]'), {
          dropdownHideOnScroll: false
        });

        // initialization of custom scrollbar
        $.HSCore.components.HSScrollBar.init($('.js-custom-scroll'));

        // initialization of popups
        $.HSCore.components.HSPopup.init('.js-fancybox', {
          btnTpl: {
            smallBtn: '<button data-fancybox-close class="btn g-pos-abs g-top-25 g-right-30 g-line-height-1 g-bg-transparent g-font-size-16 g-color-gray-light-v6 g-brd-none p-0" title=""><i class="hs-admin-close"></i></button>'
          }
        });

        $.HSCore.helpers.HSFileAttachments.init();
        $.HSCore.components.HSFileAttachment.init('.js-file-attachment');
        $.HSCore.helpers.HSFocusState.init();

        $.HSCore.components.HSMaskedInput.init('[data-mask]');

        // 이미지 미리보기 시작
        function readImage(input) {
          // 인풋 태그에 파일이 있는 경우
          if (input.files && input.files[0]) {
            // 이미지 파일인지 검사 (생략)
            // FileReader 인스턴스 생성
            const reader = new FileReader()
            // 이미지가 로드가 된 경우
            reader.onload = e => {
              const previewImage = document.getElementById("preview-image");
              previewImage.src = e.target.result;
            }
            // reader가 이미지 읽도록 하기
            reader.readAsDataURL(input.files[0]);
          }
        }

        // 이미지 업로드 유효성 체크
        function checkImgEffective() {
          var fileNm = $("#fileAttachment").val();

          if (fileNm != "") {

            var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();

            if (!(ext == "gif" || ext == "jpg" || ext == "png" || ext == "jpeg")) {
              alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");
              $("#fileAttachment").val('');
              $("#imgExplain").text("이미지 파일을 첨부해주세요.");
              $("#preview-image").attr('src', "/resources/static/assets/img-temp/500x600/img1.jpg");
              return false;
            }
          }
        }

        // input file에 change 이벤트 부여
        const inputImage = document.getElementById("fileAttachment")
        inputImage.addEventListener("change", e => {
          if( $("#fileAttachment").val() == ""){
            $("#imgExplain").text("이미지 파일을 첨부해주세요.");
            $("#preview-image").attr('src', "/resources/static/assets/img-temp/500x600/img1.jpg");
          }
          checkImgEffective();
          readImage(e.target);
        });
        // 이미지 미리보기 끝


        // 멀티 이미지 미리보기 시작
        function readMultipleImage(input) {
          // 인풋 태그에 파일이 있는 경우
          let imgFiles = document.getElementById("input-multiple-image").files;
          let imgExplainStr = "&nbsp;&nbsp;&nbsp;&nbsp;";
          if(imgFiles.length > 5){
            alert("이미지 파일은 최대 5개까지 첨부 가능합니다.");
            $("#input-multiple-image").val('');
            return false;
          }

          for (const file of imgFiles) {
            let ext = file.name.slice(file.name.lastIndexOf(".") + 1).toLowerCase();
            if (!(ext == "gif" || ext == "jpg" || ext == "png" || ext == "jpeg")) {
              alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");
              $("#input-multiple-image").val('');
              return false;
            }

            imgExplainStr += file.name +"&nbsp;&nbsp;&nbsp;&nbsp;";
          }

          $("#imgExplainMulti").html(imgExplainStr);

          for (let i = 0; i < 5; i++) {
            let imgStr = "preview-image-" + i;
            document.getElementById(imgStr).setAttribute('src', '/resources/static/assets/img-temp/500x600/img1.jpg');
          }

          if (input.files) {
            // 이미지 파일인지 검사 (생략)
            // FileReader 인스턴스 생성
            const fileArr = Array.from(input.files);
            fileArr.forEach((file, index) => {
              const reader = new FileReader()
              // 이미지가 로드가 된 경우
              reader.onload = e => {
                let imgStr = "preview-image-" + index;
                const previewImage = document.getElementById(imgStr)
                previewImage.src = e.target.result
              }

              reader.readAsDataURL(file);
            });

            // reader가 이미지 읽도록 하기
          }
        }

        // input file에 change 이벤트 부여
        const multiInputImage = document.getElementById("input-multiple-image");
        multiInputImage.addEventListener("change", e => {
          readMultipleImage(e.target)
          if($("#input-multiple-image").val() == ""){
            $("#imgExplainMulti").text("이미지 파일을 첨부해주세요.");
              for (let i = 0; i < 5; i++) {
                let imgStr = "preview-image-" + i;
                document.getElementById(imgStr).setAttribute('src', '/resources/static/assets/img-temp/500x600/img1.jpg');
              }
          }
        });
        // 멀티 이미지 미리보기 끝

        
      });
    </script>
    
    <script src="/resources/static/etc/admin-game-add.js"></script>
    
</body>

</html>