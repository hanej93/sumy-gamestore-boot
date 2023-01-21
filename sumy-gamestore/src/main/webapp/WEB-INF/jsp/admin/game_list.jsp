<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Title -->
  <title>User Contacts | Unify - Responsive Website Template</title>

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
  <link rel="stylesheet" href="/resources/static/admin/assets/vendor/bootstrap-tagsinput/css/bootstrap-tagsinput.css">

  <link rel="stylesheet" href="/resources/static/assets/vendor/hamburgers/hamburgers.min.css">
  <link rel="stylesheet" href="/resources/static/assets/vendor/jquery-ui/themes/base/jquery-ui.min.css">

  <!-- CSS Unify -->
  <link rel="stylesheet" href="/resources/static/admin/assets/css/unify-admin.css">

  <!-- CSS Customization -->
  <link rel="stylesheet" href="/resources/static/assets/css/custom.css">
  
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
                <a id="pageName" class="u-link-v5 g-color-gray-dark-v6 g-color-secondary--hover g-valign-middle" href="#!">게임 관리</a>
                <i class="hs-admin-angle-right g-font-size-12 g-color-gray-light-v6 g-valign-middle g-ml-10"></i>
              </li>

              <li class="list-inline-item">
                <span class="g-valign-middle">게임 리스트</span>
              </li>
            </ul>
          </div>
          <!-- End Breadcrumb-v1 -->


          <!-- 테이블 시작 -->

          <div class="g-pa-20">
            <div class="media">
              <div class="d-flex align-self-center">
                <h1 class="g-font-weight-300 g-font-size-28 g-color-black mb-0">게임 리스트</h1>
              </div>

              <div class="row justify-content-end media-body align-self-center">
                <a class="btn btn-xl u-btn-secondary g-width-160--md g-font-size-default g-ml-10 g-height-50"
                  href="${pageContext.request.contextPath }/admin/game/add">게임 추가
                </a>
                <!-- Top Activity Toggler -->

               <!--  <a id="activityInvoker"
                  class="g-pos-rel g-width-50 g-height-50 g-font-size-20 btn btn-lg u-btn-outline-darkgray g-mx-20 g-color-primary g-color-secondary--hover g-bg-white g-brd-gray-light-v3"
                  href="#" aria-controls="activityMenu" aria-haspopup="true" aria-expanded="false"
                  data-dropdown-event="click" data-dropdown-target="#activityMenu" data-dropdown-type="css-animation"
                  data-dropdown-animation-in="fadeInRight" data-dropdown-animation-out="fadeOutRight"
                  data-dropdown-duration="300">
                  <i class="hs-admin-align-right g-absolute-centered"></i>
                </a> -->
                <!-- End Top Activity Toggler -->
              </div>
            </div>




            <hr class="d-flex g-brd-gray-light-v7 g-my-30">

            <div class="media flex-wrap g-mb-30">
              <div class="d-flex align-self-center align-items-center g-ml-10 g-ml-20--md g-ml-40--lg">

              </div>

              <div class="d-flex g-hidden-md-up w-100"></div>

              <div class="media-body align-self-center g-mt-10 g-mt-0--md">
                <div class="input-group g-pos-rel g-max-width-380 float-right">
                  <input id="game-title-search" value="${paging.keyword }"
                    class="form-control h-100 g-font-size-default g-brd-gray-light-v7 g-brd-lightblue-v3--focus g-rounded-20 g-pl-20 g-pr-50 g-py-10"
                    type="text" placeholder="게임제목을 입력하세요.">
                  <input id="nowPage" type="hidden" value="${paging.nowPage }">
                  <a  id="game-title-search-btn"
                    class="btn g-pos-abs g-top-0 g-right-0 g-z-index-2 g-width-60 h-100 g-bg-transparent g-font-size-16 g-color-primary g-color-secondary--hover rounded-0"
                    type="submit">
                    <i class="hs-admin-search g-absolute-centered"></i>
                  </a>
                </div>
              </div>
            </div>

            <div class="g-pa-15 g-pa-0-30-25--md">
              <table class="table w-100 g-mb-25">
                <thead class="g-color-gray-dark-v6">
                  <tr>
                    <th class="g-bg-gray-light-v8 g-font-weight-400 g-valign-middle g-brd-bottom-none g-py-15">
                      <div class="d-flex align-items-center justify-content-center">
                        No.
                      </div>
                    </th>
                    <th class="g-bg-gray-light-v8 g-font-weight-400 g-valign-middle g-brd-bottom-none g-py-15">
                      <div class="d-flex align-items-center justify-content-center">
                        게임
                      </div>
                    </th>
                    <th
                      class="g-hidden-sm-down g-bg-gray-light-v8 g-font-weight-400 g-valign-middle g-brd-bottom-none g-py-15">
                      <div class="d-flex align-items-center justify-content-center">
                        제작사
                      </div>
                    </th>
                    <th class="g-bg-gray-light-v8 g-font-weight-400 g-valign-middle g-brd-bottom-none g-py-15">
                      <div class="d-flex align-items-center justify-content-center">
                        가격
                      </div>
                    </th>
                    <th
                      class="g-hidden-sm-down g-bg-gray-light-v8 g-font-weight-400 g-valign-middle g-brd-bottom-none g-py-15">
                      <div class="d-flex align-items-center justify-content-center">
                        총 판매수익
                      </div>
                    </th>
                    <th
                      class="g-hidden-sm-down g-bg-gray-light-v8 g-font-weight-400 g-valign-middle g-brd-bottom-none g-py-15">
                      <div class="d-flex align-items-center justify-content-center">
                        게임판매수
                      </div>
                    </th>
                    <th class="g-bg-gray-light-v8 g-font-weight-400 g-valign-middle g-brd-bottom-none g-py-15">
                      <div class="d-flex align-items-center justify-content-center">
                        수정/삭제
                      </div>
                    </th>
                  </tr>
                </thead>

                <tbody class="g-font-size-default g-color-black" id="accordion-09" role="tablist"
                  aria-multiselectable="true">
                  <!-- 게시글 반복 시작 -->
                  <c:forEach items="${viewAll }" var="gameInfo">
                  <tr id="contact-1-header">
                    <td
                      class="g-valign-middle g-brd-top-none g-brd-bottom g-brd-gray-light-v7 g-py-15 g-py-30--md text-center">
                      ${gameInfo.gameId}</td>
                    <td
                      class="g-valign-middle g-brd-top-none g-brd-bottom g-brd-gray-light-v7 g-py-15 g-py-30--md g-px-5 g-px-10--sm">
                      <a class="d-flex align-items-center u-link-v5 g-color-black g-color-secondary--hover g-color-secondary--opened"
                        href="/sumy/single-product/${gameInfo.gameId }">
                        <img
                          class="flex-shrink-0 g-width-80 g-height-115 g-brd-around g-brd-2 g-brd-transparent g-brd-lightblue-v3--parent-opened g-rounded-5 g-mr-20--sm"
                          src="${gameInfo.gameThumbImage}" alt="Image Description">
                        <span class="flex-grow-1 ms-3">${gameInfo.gameTitle}</span>
                      </a>
                    </td>
                    <td
                      class="g-hidden-sm-down g-valign-middle g-brd-top-none g-brd-bottom g-brd-gray-light-v7 g-py-15 g-py-30--md text-center">
                      ${gameInfo.gameDev}</td>
                    <td
                      class="g-valign-middle g-brd-top-none g-brd-bottom g-brd-gray-light-v7 g-py-15 g-py-30--md g-px-5 g-px-10--sm text-center">
                      <span class="">
                      <c:if test="${ gameInfo.gameDiscountRate ne '0'}">
                        <span class="u-label g-bg-secondary rounded g-mr-5">${gameInfo.gameDiscountRate }%</span>
                        <del class="g-color-gray-dark-v10">₩<fmt:formatNumber value="${gameInfo.gamePrice}" type="number"/></del>
                      </c:if>
                        <span class="g-ml-8">₩<fmt:formatNumber value="${gameInfo.gamePrice * (100-gameInfo.gameDiscountRate) / 100}" type="number" pattern="###,###,###,###,###,###"/></span>
                      </span>
                    </td>
                    <td
                      class="g-hidden-sm-down g-valign-middle g-brd-top-none g-brd-bottom g-brd-gray-light-v7 g-py-15 g-py-30--md g-px-5 g-px-10--sm text-center">
                      <span class="g-hidden-sm-down">₩<fmt:formatNumber value="${gameInfo.gameTotalEarnings }" type="number"/></span>
                    </td>
                    <td
                      class="g-hidden-sm-down g-valign-middle g-brd-top-none g-brd-bottom g-brd-gray-light-v7 g-py-15 g-py-30--md text-center">
                      <span class="g-hidden-sm-down"><fmt:formatNumber value="${gameInfo.gameSaleCount }" type="number"/></span>
                    </td>

                    <td
                      class="g-valign-middle g-brd-top-none g-brd-bottom g-brd-gray-light-v7 g-py-15 g-py-30--md g-px-5 g-px-10--sm g-pr-25">
                      <div class="d-flex align-items-center justify-content-center g-line-height-1">
                        <a class="u-link-v5 g-color-gray-light-v6 g-color-secondary--hover g-mr-15" href="${pageContext.request.contextPath }/admin/game/update/${gameInfo.gameId}">
                          <i class="hs-admin-pencil g-font-size-18"></i>
                        </a>

                        <!-- 삭제 버튼 시작 -->
                        <a class="u-link-v5 g-color-gray-light-v6 g-color-secondary--hover" data-toggle="modal"
                        data-target="#exampleModal3${gameInfo.gameId}">
                          <i class="hs-admin-trash g-font-size-18"></i>
                        </a>
                        <!-- 삭제 버튼 끝 -->

                        <!-- 삭제 모달 내용 시작 -->
                        <div class="modal fade justify-content-center" id="exampleModal3${gameInfo.gameId}" tabindex="-1" aria-labelledby="exampleModalLabel"
                          aria-hidden="true">
                          <div class="modal-dialog  modal-dialog-scrollable">
                            <div class="modal-content">
                              <div class="modal-body">
                                <div class="row justify-content-center g-mx-5">
                                  <div class="col-12 g-mt-10 g-mb-30">게임을 삭제 하시겠습니까?</div>
                                  <div>
                                    <a id="delBtn${gameInfo.gameId}" gameId="${gameInfo.gameId}" href="#" class="btn btn-lg u-btn-outline-primary u-btn-hover-v1-1 g-mr-10 g-font-size-14" data-toggle="modal">삭제</a>
                                    <a href="#" class="btn btn-lg u-btn-outline-primary u-btn-hover-v1-1 g-mr-10 g-font-size-14" data-dismiss="modal">닫기</a>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <!-- 게시글 반복 끝 -->
                  </c:forEach>
                </tbody>
              </table>
              <!-- 테이블 끝 -->
              <!-- 게임 삭제 완료 팝업 시작-->
              <div class="modal fade justify-content-center" id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable">
                  <div class="modal-content">
                    <div class="modal-body">
                      <div class="row justify-content-center g-mx-5">
                        <div class="col-12 g-mt-10 g-mb-30">게임삭제를 완료하였습니다.</div>
                          <div>
                            <a href="#" class="btn btn-lg u-btn-outline-primary u-btn-hover-v1-1 g-font-size-14" data-dismiss="modal">닫기</a>
                          </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- 게임 삭제 완료 팝업 끝-->
              
            </div>

            <nav aria-label="Page Navigation">
              <ul class="list-inline d-flex align-items-center justify-content-center g-my-60">
              	<c:if test="${paging.startPage != 1 }">
	                <li class="list-inline-item g-mr-10">
	                  <a class="u-pagination-v1__item u-pagination-v1-2 g-bg-lightblue-v3--active g-color-gray-dark-v6 g-color-black--hover g-color-white--active g-brd-gray-light-v7 g-brd-lightblue-v3--hover g-brd-lightblue-v3--active g-px-18 g-py-12 g-rounded-4"
	                    href="/admin/game/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}" aria-label="Previous">
	                    <span aria-hidden="true">
	                      <i class="hs-admin-angle-left"></i>
	                    </span>
	                    <span class="sr-only">Previous</span>
	                  </a>
	                </li>
                </c:if>
                
                
                <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
	                <c:choose>
	                	<c:when test="${p != paging.nowPage }">
			                <li class="list-inline-item g-hidden-sm-down g-mr-10">
			                  <a class="u-pagination-v1__item u-pagination-v1-2 g-bg-lightblue-v3--active g-color-gray-dark-v6 g-color-black--hover g-color-white--active g-brd-gray-light-v7 g-brd-lightblue-v3--hover g-brd-lightblue-v3--active g-px-18 g-py-12 g-rounded-4"
			                    href="/admin/game/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}">${p }</a>
			                </li>
		                </c:when>
		                <c:when test="${p == paging.nowPage }">
			                <li class="list-inline-item g-hidden-sm-down g-mr-10">
			                  <span
			                    class="u-pagination-v1__item u-pagination-v1-2 g-bg-lightblue-v3--active g-color-gray-dark-v6 g-color-black--hover g-color-white--active g-brd-gray-light-v7 g-brd-lightblue-v3--hover g-brd-lightblue-v3--active g-px-18 g-py-12 g-rounded-4 active">
			                    ${p }</span>
			                </li>
		                </c:when>
	                </c:choose>
                </c:forEach>
                
                <c:if test="${paging.endPage != paging.lastPage}">
	                <li class="list-inline-item">
	                  <a class="u-pagination-v1__item u-pagination-v1-2 g-bg-lightblue-v3--active g-color-gray-dark-v6 g-color-black--hover g-color-white--active g-brd-gray-light-v7 g-brd-lightblue-v3--hover g-brd-lightblue-v3--active g-px-18 g-py-12 g-rounded-4"
	                    href="/admin/game/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}" aria-label="Next">
	                    <span aria-hidden="true">
	                      <i class="hs-admin-angle-right"></i>
	                    </span>
	                    <span class="sr-only">Next</span>
	                  </a>
	                </li>
                </c:if>
              </ul>
            </nav>
          </div>
          
		  <!--푸터 시작-->		
          <jsp:include page="layout/footer.jsp"/>
          <!--푸터 끝-->	
          	
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

    <script src="/resources/static/admin/assets/vendor/bloodhound-js/js/bloodhound.min.js"></script>
    <script src="/resources/static/admin/assets/vendor/bloodhound-js/js/typeahead.jquery.min.js"></script>
    <script src="/resources/static/admin/assets/vendor/bootstrap-tagsinput/js/bootstrap-tagsinput.min.js"></script>

    <script src="/resources/static/assets/vendor/jquery-ui/ui/widgets/slider.js"></script>

    <!-- jQuery UI Core -->
    <script src="/resources/static/assets/vendor/jquery-ui/ui/widget.js"></script>
    <script src="/resources/static/assets/vendor/jquery-ui/ui/version.js"></script>
    <script src="/resources/static/assets/vendor/jquery-ui/ui/keycode.js"></script>
    <script src="/resources/static/assets/vendor/jquery-ui/ui/position.js"></script>
    <script src="/resources/static/assets/vendor/jquery-ui/ui/unique-id.js"></script>
    <script src="/resources/static/assets/vendor/jquery-ui/ui/safe-active-element.js"></script>

    <!-- jQuery UI Helpers -->
    <script src="/resources/static/assets/vendor/jquery-ui/ui/widgets/menu.js"></script>
    <script src="/resources/static/assets/vendor/jquery-ui/ui/widgets/mouse.js"></script>

    <!-- jQuery UI Widgets -->
    <script src="/resources/static/assets/vendor/jquery-ui/ui/widgets/slider.js"></script>


    <!-- JS Unify -->
    <script src="/resources/static/assets/js/hs.core.js"></script>
    <script src="/resources/static/admin/assets/js/components/hs.side-nav.js"></script>
    <script src="/resources/static/assets/js/helpers/hs.hamburgers.js"></script>
    <script src="/resources/static/assets/js/components/hs.dropdown.js"></script>
    <script src="/resources/static/assets/js/components/hs.scrollbar.js"></script>
    <script src="/resources/static/assets/js/components/hs.count-qty.js"></script>
    <script src="/resources/static/admin/assets/js/components/hs.bar-chart.js"></script>
    <script src="/resources/static/assets/js/helpers/hs.focus-state.js"></script>
    <script src="/resources/static/admin/assets/js/components/hs.popup.js"></script>

    <script src="/resources/static/assets/js/helpers/hs.rating.js"></script>
    <script src="/resources/static/assets/js/components/hs.slider.js"></script>

    <!-- JS Custom -->
    <!-- <script src="/resources/static/assets/js/custom.js"></script> -->

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

        // initialization of forms
        $.HSCore.helpers.HSRating.init();

        // initialization of range slider
        $.HSCore.components.HSSlider.init('#rangeSlider1');

        // initialization of forms
        $.HSCore.components.HSCountQty.init('.js-quantity');


      // 필터인덱스2
      // 기능: 필터 초기화 이벤트
      // 제작: 의진
      // 설명:
      // 1. 초기화 버튼을 눌렀을 때 별 4개로 초기화
      // 2. 가격 20000 - 40000으로 초기화
      $("button[type='reset']").click(function () {
        $("h3:contains('별점')").next().children().addClass('g-color-primary click');
        $("h3:contains('별점')").next().children().last().removeClass('g-color-primary click');
        
        $.HSCore.components.HSSlider.init('#rangeSlider1');
      });

      });
    </script>
    <script src="/resources/static/etc/admin-game-list.js"></script>
    
</body>

</html>